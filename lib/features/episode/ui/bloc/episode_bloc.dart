import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_morty/features/features.dart';
import 'package:rick_morty/utils/utils.dart';

part 'episode_bloc.freezed.dart';
part 'episode_event.dart';
part 'episode_state.dart';

@lazySingleton
class EpisodeBloc extends Bloc<EpisodeEvent, EpisodeState> {
  final GetEpisodes _getEpisodes;
  final GetEpisodesById _getEpisodesById;
  final GetMultipleEpisodes _getMultipleEpisodes;
  final GetFilteredEpisodes _getFilteredEpisodes;

  EpisodeBloc(
    this._getEpisodes,
    this._getEpisodesById,
    this._getMultipleEpisodes,
    this._getFilteredEpisodes,
  ) : super(const EpisodeStateInitial()) {
    on<_GetEpisodes>(_getEpisodesHandler);
    on<_GetEpisodesById>(_getEpisodesByIdHandler);
    on<_GetMultipleEpisodes>(_getMultipleEpisodesHandler);
    on<_GetFilteredEpisodes>(_getFilteredEpisodesHandler);
  }

  Future<void> _getEpisodesHandler(
    _GetEpisodes event,
    Emitter<EpisodeState> emit,
  ) async {
    emit(const EpisodeStateLoading());
    final result = await _getEpisodes.call();
    result.fold(
      (failure) => emit(EpisodeStateError(failure.message)),
      (success) => emit(EpisodeStateLoaded(success)),
    );
  }

  Future<void> _getEpisodesByIdHandler(
    _GetEpisodesById event,
    Emitter<EpisodeState> emit,
  ) async {
    emit(const EpisodeStateLoading());
    final result = await _getEpisodesById.call(event.param);
    result.fold(
      (failure) => emit(EpisodeStateError(failure.message)),
      (success) => emit(EpisodeStateLoaded([success])),
    );
  }

  Future<void> _getMultipleEpisodesHandler(
    _GetMultipleEpisodes event,
    Emitter<EpisodeState> emit,
  ) async {
    emit(const EpisodeStateLoading());
    final result = await _getMultipleEpisodes.call(event.param);
    result.fold(
      (failure) => emit(EpisodeStateError(failure.message)),
      (success) => emit(EpisodeStateLoaded(success)),
    );
  }

  Future<void> _getFilteredEpisodesHandler(
    _GetFilteredEpisodes event,
    Emitter<EpisodeState> emit,
  ) async {
    emit(const EpisodeStateLoading());
    final result = await _getFilteredEpisodes.call(event.param);
    result.fold(
      (failure) => emit(EpisodeStateError(failure.message)),
      (success) => emit(EpisodeStateLoaded(success)),
    );
  }
}
