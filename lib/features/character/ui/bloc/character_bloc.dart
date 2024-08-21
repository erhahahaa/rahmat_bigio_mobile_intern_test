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
  final GetCharactersById _getCharactersById;
  final GetMultipleCharacters _getMultipleCharacters;
  final GetFilteredCharacters _getFilteredCharacters;
  final ToggleFavoriteCharacter _toggleFavoriteCharacter;

  CharacterBloc(
    this._getCharacters,
    this._getCharactersById,
    this._getMultipleCharacters,
    this._getFilteredCharacters,
    this._toggleFavoriteCharacter,
  ) : super(const CharacterStateInitial()) {
    on<_GetCharacters>(_getCharactersHandler);
    on<_GetCharactersById>(_getCharactersByIdHandler);
    on<_GetMultipleCharacters>(_getMultipleCharactersHandler);
    on<_GetFilteredCharacters>(_getFilteredCharactersHandler);
    on<_ToggleFavorite>(_toggleFavoriteCharacterHandler);
    on<_RestoreCharacters>(_restoreCharactersHandler);
  }
  final _characters = <CharacterEntity>[];

  Future<void> _getCharactersHandler(
    _GetCharacters event,
    Emitter emit,
  ) async {
    emit(const CharacterStateLoading());
    final result = await _getCharacters.call();
    result.fold(
      (failure) => emit(CharacterStateError(failure.message)),
      (success) {
        _characters.clear();
        _characters.addAll(success);
        emit(CharacterStateLoaded(_characters));
      },
    );
  }

  Future<void> _getCharactersByIdHandler(
    _GetCharactersById event,
    Emitter emit,
  ) async {
    emit(const CharacterStateLoading());
    final result = await _getCharactersById.call(event.param);
    result.fold(
      (failure) => emit(CharacterStateError(failure.message)),
      (success) => emit(CharacterStateLoaded([success])),
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
      (success) => emit(CharacterStateLoaded(success)),
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
      (success) => emit(CharacterStateLoaded(success)),
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
        final updatedCharacters = characters.map((character) {
          if (character.id == success.id) {
            return success;
          }
          return character;
        }).toList();

        _characters.clear();
        _characters.addAll(updatedCharacters);
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
}
