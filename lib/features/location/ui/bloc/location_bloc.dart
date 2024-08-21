import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_morty/features/features.dart';
import 'package:rick_morty/utils/utils.dart';

part 'location_bloc.freezed.dart';
part 'location_event.dart';
part 'location_state.dart';

@lazySingleton
class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final GetLocations _getLocations;
  final GetMultipleLocations _getMultipleLocations;
  final GetFilteredLocations _getFilteredLocations;
  final ToggleFavoriteLocation _toggleFavoriteLocation;
  final GetLocationsByPagination _getLocationsByPagination;

  LocationBloc(
    this._getLocations,
    this._getMultipleLocations,
    this._getFilteredLocations,
    this._toggleFavoriteLocation,
    this._getLocationsByPagination,
  ) : super(const LocationStateInitial()) {
    on<_GetLocations>(_getLocationsHandler);
    on<_GetMultipleLocations>(_getMultipleLocationsHandler);
    on<_GetFilteredLocations>(_getFilteredLocationsHandler);
    on<_ToggleFavorite>(_toggleFavoriteLocationHandler);
    on<_RestoreLocations>(_restoreLocationsHandler);
    on<_NextPage>(_getNextPageHandler);
  }
  WithPagination<LocationEntity> _locations = const WithPagination(
    info: Pagination(pages: 1),
    results: [],
  );

  Future<void> _getLocationsHandler(
    _GetLocations event,
    Emitter emit,
  ) async {
    emit(const LocationStateLoading());
    final result = await _getLocations.call();
    result.fold(
      (failure) => emit(LocationStateError(failure.message)),
      (success) {
        _locations = success;
        emit(LocationStateLoaded(_locations));
      },
    );
  }

  Future<void> _getMultipleLocationsHandler(
    _GetMultipleLocations event,
    Emitter emit,
  ) async {
    emit(const LocationStateLoading());
    final result = await _getMultipleLocations.call(event.param);
    result.fold(
      (failure) => emit(LocationStateError(failure.message)),
      (success) => emit(LocationStateLoaded(_locations.copyWith(
        results: [..._locations.results, ...success],
      ))),
    );
  }

  Future<void> _getFilteredLocationsHandler(
    _GetFilteredLocations event,
    Emitter emit,
  ) async {
    emit(const LocationStateLoading());
    final result = await _getFilteredLocations.call(event.param);
    result.fold(
      (failure) => emit(LocationStateError(failure.message)),
      (success) => emit(LocationStateLoaded(
        WithPagination(
          info: const Pagination(pages: 1),
          results: success,
        ),
      )),
    );
  }

  Future<void> _toggleFavoriteLocationHandler(
    _ToggleFavorite event,
    Emitter emit,
  ) async {
    final locations = (state as LocationStateLoaded).locations;
    emit(const LocationStateLoading());
    final result = await _toggleFavoriteLocation.call(event.param);
    result.fold(
      (failure) => emit(LocationStateError(failure.message)),
      (success) {
        final updatedLocations = locations.copyWith(
          results: locations.results
              .map(
                (e) => e.id == success.id ? success : e,
              )
              .toList(),
        );
        emit(LocationStateLoaded(updatedLocations));
      },
    );
  }

  Future<void> _restoreLocationsHandler(
    _RestoreLocations event,
    Emitter emit,
  ) async {
    emit(const LocationStateLoading());
    emit(LocationStateLoaded(_locations));
  }

  Future<void> _getNextPageHandler(
    _NextPage event,
    Emitter emit,
  ) async {
    final locations = (state as LocationStateLoaded).locations;
    if (locations.info.next == null) {
      emit(const LocationStateError('No more pages'));
      return;
    }
    Pagination pagination = locations.info;

    if (pagination.next != null) {
      final nextPage = pagination.next!.split('=').last;
      pagination = pagination.copyWith(pages: int.parse(nextPage));
    } else {
      pagination = pagination.copyWith(pages: pagination.pages + 1);
    }

    final result = await _getLocationsByPagination.call(pagination);
    result.fold(
      (failure) => emit(LocationStateError(failure.message)),
      (success) {
        _locations = locations.copyWith(
          info: success.info,
          results: [...locations.results, ...success.results],
        );
        emit(LocationStateLoaded(_locations));
      },
    );
  }
}
