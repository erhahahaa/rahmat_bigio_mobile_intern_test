import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_morty/features/features.dart';
import 'package:rick_morty/utils/utils.dart';

part 'character_bloc.freezed.dart';
part 'character_event.dart';
part 'character_state.dart';

@lazySingleton
class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final GetCharacters _getCharacters;
  final GetMultipleCharacters _getMultipleCharacters;
  final GetFilteredCharacters _getFilteredCharacters;
  final ToggleFavoriteCharacter _toggleFavoriteCharacter;
  final GetCharactersByPagination _getCharactersByPagination;

  CharacterBloc(
    this._getCharacters,
    this._getMultipleCharacters,
    this._getFilteredCharacters,
    this._toggleFavoriteCharacter,
    this._getCharactersByPagination,
  ) : super(const CharacterStateInitial()) {
    on<_GetCharacters>(_getCharactersHandler);
    on<_GetMultipleCharacters>(_getMultipleCharactersHandler);
    on<_GetFilteredCharacters>(_getFilteredCharactersHandler);
    on<_ToggleFavorite>(_toggleFavoriteCharacterHandler);
    on<_RestoreCharacters>(_restoreCharactersHandler);
    on<_NextPage>(_getNextPageHandler);
  }
  WithPagination<CharacterEntity> _characters = const WithPagination(
    info: Pagination(pages: 1),
    results: [],
  );

  Future<void> _getCharactersHandler(
    _GetCharacters event,
    Emitter emit,
  ) async {
    emit(const CharacterStateLoading());
    final result = await _getCharacters.call();
    result.fold(
      (failure) => emit(CharacterStateError(failure.message)),
      (success) {
        _characters = success;
        emit(CharacterStateLoaded(_characters));
      },
    );
  }

  Future<void> _getMultipleCharactersHandler(
    _GetMultipleCharacters event,
    Emitter emit,
  ) async {
    emit(const CharacterStateLoading());
    final result = await _getMultipleCharacters.call(event.param);
    result.fold(
      (failure) => emit(CharacterStateError(failure.message)),
      (success) => emit(CharacterStateLoaded(_characters.copyWith(
        results: [..._characters.results, ...success],
      ))),
    );
  }

  Future<void> _getFilteredCharactersHandler(
    _GetFilteredCharacters event,
    Emitter emit,
  ) async {
    emit(const CharacterStateLoading());
    final result = await _getFilteredCharacters.call(event.param);
    result.fold(
      (failure) => emit(CharacterStateError(failure.message)),
      (success) => emit(CharacterStateLoaded(
        WithPagination(
          info: const Pagination(pages: 1),
          results: success,
        ),
      )),
    );
  }

  Future<void> _toggleFavoriteCharacterHandler(
    _ToggleFavorite event,
    Emitter emit,
  ) async {
    final characters = (state as CharacterStateLoaded).characters;
    emit(const CharacterStateLoading());
    final result = await _toggleFavoriteCharacter.call(event.param);
    result.fold(
      (failure) => emit(CharacterStateError(failure.message)),
      (success) {
        final updatedCharacters = characters.copyWith(
          results: characters.results
              .map(
                (e) => e.id == success.id ? success : e,
              )
              .toList(),
        );
        emit(CharacterStateLoaded(updatedCharacters));
      },
    );
  }

  Future<void> _restoreCharactersHandler(
    _RestoreCharacters event,
    Emitter emit,
  ) async {
    emit(const CharacterStateLoading());
    emit(CharacterStateLoaded(_characters));
  }

  Future<void> _getNextPageHandler(
    _NextPage event,
    Emitter emit,
  ) async {
    final characters = (state as CharacterStateLoaded).characters;
    if (characters.info.next == null) {
      emit(const CharacterStateError('No more pages'));
      return;
    }
    Pagination pagination = characters.info;

    if (pagination.next != null) {
      final nextPage = pagination.next!.split('=').last;
      pagination = pagination.copyWith(pages: int.parse(nextPage));
    } else {
      pagination = pagination.copyWith(pages: pagination.pages + 1);
    }

    final result = await _getCharactersByPagination.call(pagination);
    result.fold(
      (failure) => emit(CharacterStateError(failure.message)),
      (success) {
        _characters = characters.copyWith(
          info: success.info,
          results: [...characters.results, ...success.results],
        );
        emit(CharacterStateLoaded(_characters));
      },
    );
  }
}
