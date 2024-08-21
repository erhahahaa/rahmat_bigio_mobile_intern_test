part of 'episode_bloc.dart';

@freezed
class EpisodeState with _$EpisodeState {
  const factory EpisodeState.initial() = EpisodeStateInitial;
  const factory EpisodeState.loading() = EpisodeStateLoading;
  const factory EpisodeState.loaded(
    List<EpisodeEntity> episodes,
  ) = EpisodeStateLoaded;
  const factory EpisodeState.error(String message) = EpisodeStateError;
}
