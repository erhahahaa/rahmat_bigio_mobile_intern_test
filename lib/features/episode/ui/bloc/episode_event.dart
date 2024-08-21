part of 'episode_bloc.dart';

@freezed
class EpisodeEvent with _$EpisodeEvent {
  const factory EpisodeEvent.getEpisodes() = _GetEpisodes;
  const factory EpisodeEvent.getEpisodesById(
    ByIdParam param,
  ) = _GetEpisodesById;
  const factory EpisodeEvent.getMultipleEpisodes(
    ByIdsParam param,
  ) = _GetMultipleEpisodes;
  const factory EpisodeEvent.getFilteredEpisodes(
    GetEpisodesByFilterParams param,
  ) = _GetFilteredEpisodes;
  const factory EpisodeEvent.toggleFavorite(
    ByIdParam param,
  ) = _ToggleFavorite;
  const factory EpisodeEvent.getFavoriteEpisodes() = _GetFavoriteEpisodes;
  const factory EpisodeEvent.restoreEpisodes() = _RestoreEpisodes;
  const factory EpisodeEvent.nextPage() = _NextPage;
}
