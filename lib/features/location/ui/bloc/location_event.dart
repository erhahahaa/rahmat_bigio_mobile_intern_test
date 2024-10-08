part of 'location_bloc.dart';

@freezed
class LocationEvent with _$LocationEvent {
  const factory LocationEvent.getLocations() = _GetLocations;
  const factory LocationEvent.getLocationsById(
    ByIdParam param,
  ) = _GetLocationsById;
  const factory LocationEvent.getMultipleLocations(
    ByIdsParam param,
  ) = _GetMultipleLocations;
  const factory LocationEvent.getFilteredLocations(
    GetLocationsByFilterParams param,
  ) = _GetFilteredLocations;
  const factory LocationEvent.toggleFavorite(
    ByIdParam param,
  ) = _ToggleFavorite;
  const factory LocationEvent.getFavoriteLocations() = _GetFavoriteLocations;
  const factory LocationEvent.restoreLocations() = _RestoreLocations;
  const factory LocationEvent.nextPage() = _NextPage;
}
