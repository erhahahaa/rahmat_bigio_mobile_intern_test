// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../core/core.dart' as _i156;
import '../core/services/http/dio_client.dart' as _i352;
import '../core/services/storage/isar_client.dart' as _i361;
import '../features/character/data/data_sources/character_local_data_source.dart'
    as _i568;
import '../features/character/data/data_sources/character_remote_data_source.dart'
    as _i540;
import '../features/character/data/repositories/character_repository_impl.dart'
    as _i512;
import '../features/character/domain/usecases/clear_characters_cache.dart'
    as _i162;
import '../features/character/domain/usecases/get_characters.dart' as _i129;
import '../features/character/domain/usecases/get_characters_by_id.dart'
    as _i296;
import '../features/character/domain/usecases/get_characters_by_pagination.dart'
    as _i530;
import '../features/character/domain/usecases/get_characters_from_cache.dart'
    as _i830;
import '../features/character/domain/usecases/get_filtered_characters.dart'
    as _i444;
import '../features/character/domain/usecases/get_multiple_characters.dart'
    as _i840;
import '../features/character/domain/usecases/toggle_favorite_character.dart'
    as _i437;
import '../features/character/ui/bloc/character_bloc.dart' as _i323;
import '../features/episode/data/data_sources/episode_local_data_source.dart'
    as _i620;
import '../features/episode/data/data_sources/episode_remote_data_source.dart'
    as _i271;
import '../features/episode/data/repositories/episode_repository_impl.dart'
    as _i375;
import '../features/episode/domain/usecases/clear_episodes_cache.dart' as _i188;
import '../features/episode/domain/usecases/get_episodes.dart' as _i1047;
import '../features/episode/domain/usecases/get_episodes_by_id.dart' as _i605;
import '../features/episode/domain/usecases/get_episodes_from_cache.dart'
    as _i142;
import '../features/episode/domain/usecases/get_filtered_episodes.dart'
    as _i541;
import '../features/episode/domain/usecases/get_multiple_episodes.dart'
    as _i563;
import '../features/episode/domain/usecases/toggle_favorite_episode.dart'
    as _i778;
import '../features/episode/ui/bloc/episode_bloc.dart' as _i792;
import '../features/features.dart' as _i1009;
import '../features/location/data/data_sources/location_local_data_source.dart'
    as _i751;
import '../features/location/data/data_sources/location_remote_data_source.dart'
    as _i611;
import '../features/location/data/repositories/location_repository_impl.dart'
    as _i159;
import '../features/location/domain/usecases/clear_locations_cache.dart'
    as _i128;
import '../features/location/domain/usecases/get_filtered_locations.dart'
    as _i115;
import '../features/location/domain/usecases/get_locations.dart' as _i394;
import '../features/location/domain/usecases/get_locations_by_id.dart' as _i50;
import '../features/location/domain/usecases/get_locations_from_cache.dart'
    as _i1065;
import '../features/location/domain/usecases/get_multiple_locations.dart'
    as _i707;
import '../features/location/domain/usecases/toggle_favorite_location.dart'
    as _i428;
import '../features/location/ui/bloc/location_bloc.dart' as _i234;
import 'router.dart' as _i216;
import 'sl.dart' as _i581;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.factory<_i216.AppRouter>(() => _i216.AppRouter());
    gh.singleton<bool>(() => appModule.isUnitTest);
    gh.lazySingleton<_i352.DioClient>(
      () => _i352.DioClient(),
      dispose: (i) => i.dispose(),
    );
    await gh.lazySingletonAsync<_i361.IsarClient>(
      () {
        final i = _i361.IsarClient(gh<bool>());
        return i.init().then((_) => i);
      },
      preResolve: true,
    );
    gh.lazySingleton<_i751.LocationLocalDataSource>(
        () => _i751.LocationLocalDataSourceImpl(gh<_i156.IsarClient>()));
    gh.lazySingleton<_i568.CharacterLocalDataSource>(
        () => _i568.CharacterLocalDataSourceImpl(gh<_i156.IsarClient>()));
    gh.lazySingleton<_i620.EpisodeLocalDataSource>(
        () => _i620.EpisodeLocalDataSourceImpl(gh<_i156.IsarClient>()));
    gh.lazySingleton<_i540.CharacterRemoteDataSource>(
        () => _i540.CharacterRemoteDataSourceImpl(gh<_i156.DioClient>()));
    gh.lazySingleton<_i611.LocationRemoteDataSource>(
        () => _i611.LocationRemoteDataSourceImpl(gh<_i156.DioClient>()));
    gh.lazySingleton<_i271.EpisodeRemoteDataSource>(
        () => _i271.EpisodeRemoteDataSourceImpl(gh<_i156.DioClient>()));
    gh.lazySingleton<_i1009.CharacterRepository>(
        () => _i512.CharacterRepositoryImpl(
              gh<_i1009.CharacterLocalDataSource>(),
              gh<_i1009.CharacterRemoteDataSource>(),
            ));
    gh.lazySingleton<_i830.GetCharactersFromCache>(
        () => _i830.GetCharactersFromCache(gh<_i1009.CharacterRepository>()));
    gh.lazySingleton<_i444.GetFilteredCharacters>(
        () => _i444.GetFilteredCharacters(gh<_i1009.CharacterRepository>()));
    gh.lazySingleton<_i296.GetCharactersById>(
        () => _i296.GetCharactersById(gh<_i1009.CharacterRepository>()));
    gh.lazySingleton<_i162.ClearCharactersCache>(
        () => _i162.ClearCharactersCache(gh<_i1009.CharacterRepository>()));
    gh.lazySingleton<_i129.GetCharacters>(
        () => _i129.GetCharacters(gh<_i1009.CharacterRepository>()));
    gh.lazySingleton<_i840.GetMultipleCharacters>(
        () => _i840.GetMultipleCharacters(gh<_i1009.CharacterRepository>()));
    gh.lazySingleton<_i437.ToggleFavoriteCharacter>(
        () => _i437.ToggleFavoriteCharacter(gh<_i1009.CharacterRepository>()));
    gh.lazySingleton<_i1009.LocationRepository>(
        () => _i159.LocationRepositoryImpl(
              gh<_i1009.LocationLocalDataSource>(),
              gh<_i1009.LocationRemoteDataSource>(),
            ));
    gh.lazySingleton<_i530.GetCharactersByPagination>(() =>
        _i530.GetCharactersByPagination(gh<_i1009.CharacterRepository>()));
    gh.lazySingleton<_i323.CharacterBloc>(() => _i323.CharacterBloc(
          gh<_i1009.GetCharacters>(),
          gh<_i1009.GetMultipleCharacters>(),
          gh<_i1009.GetFilteredCharacters>(),
          gh<_i1009.ToggleFavoriteCharacter>(),
          gh<_i1009.GetCharactersByPagination>(),
        ));
    gh.lazySingleton<_i1009.EpisodeRepository>(
        () => _i375.EpisodeRepositoryImpl(
              gh<_i1009.EpisodeLocalDataSource>(),
              gh<_i1009.EpisodeRemoteDataSource>(),
            ));
    gh.lazySingleton<_i778.ToggleFavoriteEpisode>(
        () => _i778.ToggleFavoriteEpisode(gh<_i1009.EpisodeRepository>()));
    gh.lazySingleton<_i188.ClearEpisodesCache>(
        () => _i188.ClearEpisodesCache(gh<_i1009.EpisodeRepository>()));
    gh.lazySingleton<_i142.GetEpisodesFromCache>(
        () => _i142.GetEpisodesFromCache(gh<_i1009.EpisodeRepository>()));
    gh.lazySingleton<_i1047.GetEpisodes>(
        () => _i1047.GetEpisodes(gh<_i1009.EpisodeRepository>()));
    gh.lazySingleton<_i541.GetFilteredEpisodes>(
        () => _i541.GetFilteredEpisodes(gh<_i1009.EpisodeRepository>()));
    gh.lazySingleton<_i563.GetMultipleEpisodes>(
        () => _i563.GetMultipleEpisodes(gh<_i1009.EpisodeRepository>()));
    gh.lazySingleton<_i605.GetEpisodesById>(
        () => _i605.GetEpisodesById(gh<_i1009.EpisodeRepository>()));
    gh.lazySingleton<_i792.EpisodeBloc>(() => _i792.EpisodeBloc(
          gh<_i1009.GetEpisodes>(),
          gh<_i1009.GetEpisodesById>(),
          gh<_i1009.GetMultipleEpisodes>(),
          gh<_i1009.GetFilteredEpisodes>(),
        ));
    gh.lazySingleton<_i50.GetLocationsById>(
        () => _i50.GetLocationsById(gh<_i1009.LocationRepository>()));
    gh.lazySingleton<_i115.GetFilteredLocations>(
        () => _i115.GetFilteredLocations(gh<_i1009.LocationRepository>()));
    gh.lazySingleton<_i394.GetLocations>(
        () => _i394.GetLocations(gh<_i1009.LocationRepository>()));
    gh.lazySingleton<_i128.ClearLocationsCache>(
        () => _i128.ClearLocationsCache(gh<_i1009.LocationRepository>()));
    gh.lazySingleton<_i707.GetMultipleLocations>(
        () => _i707.GetMultipleLocations(gh<_i1009.LocationRepository>()));
    gh.lazySingleton<_i428.ToggleFavoriteLocation>(
        () => _i428.ToggleFavoriteLocation(gh<_i1009.LocationRepository>()));
    gh.lazySingleton<_i1065.GetLocationsFromCache>(
        () => _i1065.GetLocationsFromCache(gh<_i1009.LocationRepository>()));
    gh.lazySingleton<_i234.LocationBloc>(() => _i234.LocationBloc(
          gh<_i1009.GetLocations>(),
          gh<_i1009.GetLocationsById>(),
          gh<_i1009.GetMultipleLocations>(),
          gh<_i1009.GetFilteredLocations>(),
        ));
    return this;
  }
}

class _$AppModule extends _i581.AppModule {}
