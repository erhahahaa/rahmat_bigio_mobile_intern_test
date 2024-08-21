// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i12;
import 'package:flutter/material.dart' as _i13;
import 'package:hidayatullah/features/character/ui/screens/character_detail_screen.dart'
    as _i1;
import 'package:hidayatullah/features/character/ui/screens/home_screen.dart'
    as _i5;
import 'package:hidayatullah/features/character/ui/screens/search_character_screen.dart'
    as _i8;
import 'package:hidayatullah/features/episode/ui/screens/episode_detail_screen.dart'
    as _i3;
import 'package:hidayatullah/features/episode/ui/screens/episode_screen.dart'
    as _i4;
import 'package:hidayatullah/features/episode/ui/screens/search_episode_screen.dart'
    as _i9;
import 'package:hidayatullah/features/features.dart' as _i14;
import 'package:hidayatullah/features/location/ui/screens/location_detail_screen.dart'
    as _i6;
import 'package:hidayatullah/features/location/ui/screens/location_screen.dart'
    as _i7;
import 'package:hidayatullah/features/location/ui/screens/search_location_screen.dart'
    as _i10;
import 'package:hidayatullah/features/navigation/ui/screens/dashboard_screen.dart'
    as _i2;
import 'package:hidayatullah/features/settings/ui/screens/settings_screen.dart'
    as _i11;

/// generated route for
/// [_i1.CharacterDetailScreen]
class CharacterDetailRoute
    extends _i12.PageRouteInfo<CharacterDetailRouteArgs> {
  CharacterDetailRoute({
    _i13.Key? key,
    required int id,
    required _i14.CharacterEntity character,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          CharacterDetailRoute.name,
          args: CharacterDetailRouteArgs(
            key: key,
            id: id,
            character: character,
          ),
          rawPathParams: {'id': id},
          initialChildren: children,
        );

  static const String name = 'CharacterDetailRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CharacterDetailRouteArgs>();
      return _i1.CharacterDetailScreen(
        key: args.key,
        id: args.id,
        character: args.character,
      );
    },
  );
}

class CharacterDetailRouteArgs {
  const CharacterDetailRouteArgs({
    this.key,
    required this.id,
    required this.character,
  });

  final _i13.Key? key;

  final int id;

  final _i14.CharacterEntity character;

  @override
  String toString() {
    return 'CharacterDetailRouteArgs{key: $key, id: $id, character: $character}';
  }
}

/// generated route for
/// [_i2.DashboardScreen]
class DashboardRoute extends _i12.PageRouteInfo<void> {
  const DashboardRoute({List<_i12.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i2.DashboardScreen();
    },
  );
}

/// generated route for
/// [_i3.EpisodeDetailScreen]
class EpisodeDetailRoute extends _i12.PageRouteInfo<EpisodeDetailRouteArgs> {
  EpisodeDetailRoute({
    _i13.Key? key,
    required int id,
    required _i14.EpisodeEntity episode,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          EpisodeDetailRoute.name,
          args: EpisodeDetailRouteArgs(
            key: key,
            id: id,
            episode: episode,
          ),
          rawPathParams: {'id': id},
          initialChildren: children,
        );

  static const String name = 'EpisodeDetailRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<EpisodeDetailRouteArgs>();
      return _i3.EpisodeDetailScreen(
        key: args.key,
        id: args.id,
        episode: args.episode,
      );
    },
  );
}

class EpisodeDetailRouteArgs {
  const EpisodeDetailRouteArgs({
    this.key,
    required this.id,
    required this.episode,
  });

  final _i13.Key? key;

  final int id;

  final _i14.EpisodeEntity episode;

  @override
  String toString() {
    return 'EpisodeDetailRouteArgs{key: $key, id: $id, episode: $episode}';
  }
}

/// generated route for
/// [_i4.EpisodeScreen]
class EpisodeRoute extends _i12.PageRouteInfo<void> {
  const EpisodeRoute({List<_i12.PageRouteInfo>? children})
      : super(
          EpisodeRoute.name,
          initialChildren: children,
        );

  static const String name = 'EpisodeRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i4.EpisodeScreen();
    },
  );
}

/// generated route for
/// [_i5.HomeScreen]
class HomeRoute extends _i12.PageRouteInfo<void> {
  const HomeRoute({List<_i12.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i5.HomeScreen();
    },
  );
}

/// generated route for
/// [_i6.LocationDetailScreen]
class LocationDetailRoute extends _i12.PageRouteInfo<LocationDetailRouteArgs> {
  LocationDetailRoute({
    _i13.Key? key,
    required int id,
    required _i14.LocationEntity location,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          LocationDetailRoute.name,
          args: LocationDetailRouteArgs(
            key: key,
            id: id,
            location: location,
          ),
          rawPathParams: {'id': id},
          initialChildren: children,
        );

  static const String name = 'LocationDetailRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LocationDetailRouteArgs>();
      return _i6.LocationDetailScreen(
        key: args.key,
        id: args.id,
        location: args.location,
      );
    },
  );
}

class LocationDetailRouteArgs {
  const LocationDetailRouteArgs({
    this.key,
    required this.id,
    required this.location,
  });

  final _i13.Key? key;

  final int id;

  final _i14.LocationEntity location;

  @override
  String toString() {
    return 'LocationDetailRouteArgs{key: $key, id: $id, location: $location}';
  }
}

/// generated route for
/// [_i7.LocationScreen]
class LocationRoute extends _i12.PageRouteInfo<void> {
  const LocationRoute({List<_i12.PageRouteInfo>? children})
      : super(
          LocationRoute.name,
          initialChildren: children,
        );

  static const String name = 'LocationRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i7.LocationScreen();
    },
  );
}

/// generated route for
/// [_i8.SearchCharacterScreen]
class SearchCharacterRoute
    extends _i12.PageRouteInfo<SearchCharacterRouteArgs> {
  SearchCharacterRoute({
    _i13.Key? key,
    required _i14.GetCharactersByFilterParams params,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          SearchCharacterRoute.name,
          args: SearchCharacterRouteArgs(
            key: key,
            params: params,
          ),
          initialChildren: children,
        );

  static const String name = 'SearchCharacterRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SearchCharacterRouteArgs>();
      return _i12.WrappedRoute(
          child: _i8.SearchCharacterScreen(
        key: args.key,
        params: args.params,
      ));
    },
  );
}

class SearchCharacterRouteArgs {
  const SearchCharacterRouteArgs({
    this.key,
    required this.params,
  });

  final _i13.Key? key;

  final _i14.GetCharactersByFilterParams params;

  @override
  String toString() {
    return 'SearchCharacterRouteArgs{key: $key, params: $params}';
  }
}

/// generated route for
/// [_i9.SearchEpisodeScreen]
class SearchEpisodeRoute extends _i12.PageRouteInfo<SearchEpisodeRouteArgs> {
  SearchEpisodeRoute({
    _i13.Key? key,
    required _i14.GetEpisodesByFilterParams params,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          SearchEpisodeRoute.name,
          args: SearchEpisodeRouteArgs(
            key: key,
            params: params,
          ),
          initialChildren: children,
        );

  static const String name = 'SearchEpisodeRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SearchEpisodeRouteArgs>();
      return _i12.WrappedRoute(
          child: _i9.SearchEpisodeScreen(
        key: args.key,
        params: args.params,
      ));
    },
  );
}

class SearchEpisodeRouteArgs {
  const SearchEpisodeRouteArgs({
    this.key,
    required this.params,
  });

  final _i13.Key? key;

  final _i14.GetEpisodesByFilterParams params;

  @override
  String toString() {
    return 'SearchEpisodeRouteArgs{key: $key, params: $params}';
  }
}

/// generated route for
/// [_i10.SearchLocationScreen]
class SearchLocationRoute extends _i12.PageRouteInfo<SearchLocationRouteArgs> {
  SearchLocationRoute({
    _i13.Key? key,
    required _i14.GetLocationsByFilterParams params,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          SearchLocationRoute.name,
          args: SearchLocationRouteArgs(
            key: key,
            params: params,
          ),
          initialChildren: children,
        );

  static const String name = 'SearchLocationRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SearchLocationRouteArgs>();
      return _i12.WrappedRoute(
          child: _i10.SearchLocationScreen(
        key: args.key,
        params: args.params,
      ));
    },
  );
}

class SearchLocationRouteArgs {
  const SearchLocationRouteArgs({
    this.key,
    required this.params,
  });

  final _i13.Key? key;

  final _i14.GetLocationsByFilterParams params;

  @override
  String toString() {
    return 'SearchLocationRouteArgs{key: $key, params: $params}';
  }
}

/// generated route for
/// [_i11.SettingsScreen]
class SettingsRoute extends _i12.PageRouteInfo<void> {
  const SettingsRoute({List<_i12.PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i11.SettingsScreen();
    },
  );
}
