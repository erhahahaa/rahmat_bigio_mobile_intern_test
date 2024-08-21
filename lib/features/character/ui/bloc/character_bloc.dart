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

  CharacterBloc(
    this._getCharacters,
    this._getCharactersById,
    this._getMultipleCharacters,
    this._getFilteredCharacters,
  ) : super(const CharacterStateInitial()) {
    on<_GetCharacters>(_getCharactersHandler);
    on<_GetCharactersById>(_getCharactersByIdHandler);
    on<_GetMultipleCharacters>(_getMultipleCharactersHandler);
    on<_GetFilteredCharacters>(_getFilteredCharactersHandler);
  }

  Future<void> _getCharactersHandler(
    _GetCharacters event,
    Emitter emit,
  ) async {
    emit(const CharacterStateLoading());
    final result = await _getCharacters.call();
    result.fold(
      (failure) => emit(CharacterStateError(failure.message)),
      (success) => emit(CharacterStateLoaded(success, success)),
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
      (success) => emit(CharacterStateLoaded([success], [success])),
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
      (success) => emit(CharacterStateLoaded(success, success)),
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
      (success) => emit(CharacterStateLoaded(success, success)),
    );
  }
}
