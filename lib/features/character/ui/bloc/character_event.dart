part of 'character_bloc.dart';

@freezed
class CharacterEvent with _$CharacterEvent {
  const factory CharacterEvent.getCharacters() = _GetCharacters;
  const factory CharacterEvent.getCharactersById(
    ByIdParam param,
  ) = _GetCharactersById;
  const factory CharacterEvent.getMultipleCharacters(
    ByIdsParam param,
  ) = _GetMultipleCharacters;
  const factory CharacterEvent.getFilteredCharacters(
    GetCharactersByFilterParams param,
  ) = _GetFilteredCharacters;
  const factory CharacterEvent.toggleFavorite(
    ByIdParam param,
  ) = _ToggleFavorite;
  const factory CharacterEvent.getFavoriteCharacters() = _GetFavoriteCharacters;
  const factory CharacterEvent.restoreCharacters() = _RestoreCharacters;
  const factory CharacterEvent.nextPage() = _NextPage;
}
