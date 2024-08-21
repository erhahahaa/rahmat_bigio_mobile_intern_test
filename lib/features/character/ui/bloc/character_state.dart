part of 'character_bloc.dart';

@freezed
class CharacterState with _$CharacterState {
  const factory CharacterState.initial() = CharacterStateInitial;
  const factory CharacterState.loading() = CharacterStateLoading;
  const factory CharacterState.loaded(
    List<CharacterEntity> characters,
    List<CharacterEntity> filteredCharacters,
  ) = CharacterStateLoaded;
  const factory CharacterState.error(String message) = CharacterStateError;
}
