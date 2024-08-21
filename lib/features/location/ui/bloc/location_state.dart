part of 'location_bloc.dart';

@freezed
class LocationState with _$LocationState {
  const factory LocationState.initial() = LocationStateInitial;
  const factory LocationState.loading() = LocationStateLoading;
  const factory LocationState.loaded(
    List<LocationEntity> locations,
  ) = LocationStateLoaded;
  const factory LocationState.error(String message) = LocationStateError;
}
