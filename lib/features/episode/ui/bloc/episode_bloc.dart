import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hidayatullah/features/features.dart';
import 'package:hidayatullah/utils/utils.dart';
import 'package:injectable/injectable.dart';

part 'episode_bloc.freezed.dart';
part 'episode_event.dart';
part 'episode_state.dart';

@lazySingleton
class EpisodeBloc extends Bloc<EpisodeEvent, EpisodeState> {
  final GetEpisodes _getEpisodes;
  final GetMultipleEpisodes _getMultipleEpisodes;
  final GetFilteredEpisodes _getFilteredEpisodes;
  final ToggleFavoriteEpisode _toggleFavoriteEpisode;
  final GetEpisodesByPagination _getEpisodesByPagination;

  EpisodeBloc(
    this._getEpisodes,
    this._getMultipleEpisodes,
    this._getFilteredEpisodes,
    this._toggleFavoriteEpisode,
    this._getEpisodesByPagination,
  ) : super(const EpisodeStateInitial()) {
    on<_GetEpisodes>(_getEpisodesHandler);
    on<_GetMultipleEpisodes>(_getMultipleEpisodesHandler);
    on<_GetFilteredEpisodes>(_getFilteredEpisodesHandler);
    on<_ToggleFavorite>(_toggleFavoriteEpisodeHandler);
    on<_RestoreEpisodes>(_restoreEpisodesHandler);
    on<_NextPage>(_getNextPageHandler);
  }
  WithPagination<EpisodeEntity> _episodes = const WithPagination(
    info: Pagination(pages: 1),
    results: [],
  );

  Future<void> _getEpisodesHandler(
    _GetEpisodes event,
    Emitter emit,
  ) async {
    emit(const EpisodeStateLoading());
    final result = await _getEpisodes.call();
    result.fold(
      (failure) => emit(EpisodeStateError(failure.message)),
      (success) {
        _episodes = success;
        emit(EpisodeStateLoaded(_episodes));
      },
    );
  }

  Future<void> _getMultipleEpisodesHandler(
    _GetMultipleEpisodes event,
    Emitter emit,
  ) async {
    emit(const EpisodeStateLoading());
    final result = await _getMultipleEpisodes.call(event.param);
    result.fold(
      (failure) => emit(EpisodeStateError(failure.message)),
      (success) => emit(EpisodeStateLoaded(_episodes.copyWith(
        results: [..._episodes.results, ...success],
      ))),
    );
  }

  Future<void> _getFilteredEpisodesHandler(
    _GetFilteredEpisodes event,
    Emitter emit,
  ) async {
    emit(const EpisodeStateLoading());
    final result = await _getFilteredEpisodes.call(event.param);
    result.fold(
      (failure) => emit(EpisodeStateError(failure.message)),
      (success) => emit(EpisodeStateLoaded(
        WithPagination(
          info: const Pagination(pages: 1),
          results: success,
        ),
      )),
    );
  }

  Future<void> _toggleFavoriteEpisodeHandler(
    _ToggleFavorite event,
    Emitter emit,
  ) async {
    final episodes = (state as EpisodeStateLoaded).episodes;
    emit(const EpisodeStateLoading());
    final result = await _toggleFavoriteEpisode.call(event.param);
    result.fold(
      (failure) => emit(EpisodeStateError(failure.message)),
      (success) {
        final updatedEpisodes = episodes.copyWith(
          results: episodes.results
              .map(
                (e) => e.id == success.id ? success : e,
              )
              .toList(),
        );
        emit(EpisodeStateLoaded(updatedEpisodes));
      },
    );
  }

  Future<void> _restoreEpisodesHandler(
    _RestoreEpisodes event,
    Emitter emit,
  ) async {
    emit(const EpisodeStateLoading());
    emit(EpisodeStateLoaded(_episodes));
  }

  Future<void> _getNextPageHandler(
    _NextPage event,
    Emitter emit,
  ) async {
    final episodes = (state as EpisodeStateLoaded).episodes;
    if (episodes.info.next == null) {
      emit(const EpisodeStateError('No more pages'));
      return;
    }
    Pagination pagination = episodes.info;

    if (pagination.next != null) {
      final nextPage = pagination.next!.split('=').last;
      pagination = pagination.copyWith(pages: int.parse(nextPage));
    } else {
      pagination = pagination.copyWith(pages: pagination.pages + 1);
    }

    final result = await _getEpisodesByPagination.call(pagination);
    result.fold(
      (failure) => emit(EpisodeStateError(failure.message)),
      (success) {
        _episodes = episodes.copyWith(
          info: success.info,
          results: [...episodes.results, ...success.results],
        );
        emit(EpisodeStateLoaded(_episodes));
      },
    );
  }
}
