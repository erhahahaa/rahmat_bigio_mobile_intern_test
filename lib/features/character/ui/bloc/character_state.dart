part of 'character_bloc.dart';

@freezed
class CharacterState with _$CharacterState {
  const factory CharacterState.initial() = CharacterStateInitial;
  const factory CharacterState.loading() = CharacterStateLoading;
  const factory CharacterState.loaded(
    WithPagination<CharacterEntity> characters,
  ) = CharacterStateLoaded;
  const factory CharacterState.error(Failure message) = CharacterStateError;
}
