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
  final GetLocationsById _getLocationsById;
  final GetMultipleLocations _getMultipleLocations;
  final GetFilteredLocations _getFilteredLocations;

  LocationBloc(
    this._getLocations,
    this._getLocationsById,
    this._getMultipleLocations,
    this._getFilteredLocations,
  ) : super(const LocationStateInitial()) {
    on<_GetLocations>(_getLocationsHandler);
    on<_GetLocationsById>(_getLocationsByIdHandler);
    on<_GetMultipleLocations>(_getMultipleLocationsHandler);
    on<_GetFilteredLocations>(_getFilteredLocationsHandler);
  }

  Future<void> _getLocationsHandler(
    _GetLocations event,
    Emitter emit,
  ) async {
    emit(const LocationStateLoading());
    final result = await _getLocations.call();
    result.fold(
      (failure) => emit(LocationStateError(failure.message)),
      (success) => emit(LocationStateLoaded(success)),
    );
  }

  Future<void> _getLocationsByIdHandler(
    _GetLocationsById event,
    Emitter emit,
  ) async {
    emit(const LocationStateLoading());
    final result = await _getLocationsById.call(event.param);
    result.fold(
      (failure) => emit(LocationStateError(failure.message)),
      (success) => emit(LocationStateLoaded([success])),
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
      (success) => emit(LocationStateLoaded(success)),
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
      (success) => emit(LocationStateLoaded(success)),
    );
  }
}
