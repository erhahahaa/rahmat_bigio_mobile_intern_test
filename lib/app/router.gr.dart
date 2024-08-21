// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:flutter/material.dart' as _i12;
import 'package:rick_morty/features/character/ui/screens/character_detail_screen.dart'
    as _i1;
import 'package:rick_morty/features/character/ui/screens/home_screen.dart'
    as _i5;
import 'package:rick_morty/features/character/ui/screens/search_character_screen.dart'
    as _i8;
import 'package:rick_morty/features/episode/ui/screens/episode_detail_screen.dart'
    as _i3;
import 'package:rick_morty/features/episode/ui/screens/episode_screen.dart'
    as _i4;
import 'package:rick_morty/features/episode/ui/screens/search_episode_screen.dart'
    as _i9;
import 'package:rick_morty/features/features.dart' as _i13;
import 'package:rick_morty/features/location/ui/screens/location_detail_screen.dart'
    as _i6;
import 'package:rick_morty/features/location/ui/screens/location_screen.dart'
    as _i7;
import 'package:rick_morty/features/location/ui/screens/search_location_screen.dart'
    as _i10;
import 'package:rick_morty/features/navigation/ui/screens/dashboard_screen.dart'
    as _i2;

/// generated route for
/// [_i1.CharacterDetailScreen]
class CharacterDetailRoute
    extends _i11.PageRouteInfo<CharacterDetailRouteArgs> {
  CharacterDetailRoute({
    _i12.Key? key,
    required int id,
    required _i13.CharacterEntity character,
    List<_i11.PageRouteInfo>? children,
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

  static _i11.PageInfo page = _i11.PageInfo(
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

  final _i12.Key? key;

  final int id;

  final _i13.CharacterEntity character;

  @override
  String toString() {
    return 'CharacterDetailRouteArgs{key: $key, id: $id, character: $character}';
  }
}

/// generated route for
/// [_i2.DashboardScreen]
class DashboardRoute extends _i11.PageRouteInfo<void> {
  const DashboardRoute({List<_i11.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i2.DashboardScreen();
    },
  );
}

/// generated route for
/// [_i3.EpisodeDetailScreen]
class EpisodeDetailRoute extends _i11.PageRouteInfo<EpisodeDetailRouteArgs> {
  EpisodeDetailRoute({
    _i12.Key? key,
    required int id,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          EpisodeDetailRoute.name,
          args: EpisodeDetailRouteArgs(
            key: key,
            id: id,
          ),
          rawPathParams: {'id': id},
          initialChildren: children,
        );

  static const String name = 'EpisodeDetailRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<EpisodeDetailRouteArgs>(
          orElse: () => EpisodeDetailRouteArgs(id: pathParams.getInt('id')));
      return _i3.EpisodeDetailScreen(
        key: args.key,
        id: args.id,
      );
    },
  );
}

class EpisodeDetailRouteArgs {
  const EpisodeDetailRouteArgs({
    this.key,
    required this.id,
  });

  final _i12.Key? key;

  final int id;

  @override
  String toString() {
    return 'EpisodeDetailRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i4.EpisodeScreen]
class EpisodeRoute extends _i11.PageRouteInfo<void> {
  const EpisodeRoute({List<_i11.PageRouteInfo>? children})
      : super(
          EpisodeRoute.name,
          initialChildren: children,
        );

  static const String name = 'EpisodeRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i4.EpisodeScreen();
    },
  );
}

/// generated route for
/// [_i5.HomeScreen]
class HomeRoute extends _i11.PageRouteInfo<void> {
  const HomeRoute({List<_i11.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i5.HomeScreen();
    },
  );
}

/// generated route for
/// [_i6.LocationDetailScreen]
class LocationDetailRoute extends _i11.PageRouteInfo<LocationDetailRouteArgs> {
  LocationDetailRoute({
    _i12.Key? key,
    required int id,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          LocationDetailRoute.name,
          args: LocationDetailRouteArgs(
            key: key,
            id: id,
          ),
          rawPathParams: {'id': id},
          initialChildren: children,
        );

  static const String name = 'LocationDetailRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<LocationDetailRouteArgs>(
          orElse: () => LocationDetailRouteArgs(id: pathParams.getInt('id')));
      return _i6.LocationDetailScreen(
        key: args.key,
        id: args.id,
      );
    },
  );
}

class LocationDetailRouteArgs {
  const LocationDetailRouteArgs({
    this.key,
    required this.id,
  });

  final _i12.Key? key;

  final int id;

  @override
  String toString() {
    return 'LocationDetailRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i7.LocationScreen]
class LocationRoute extends _i11.PageRouteInfo<void> {
  const LocationRoute({List<_i11.PageRouteInfo>? children})
      : super(
          LocationRoute.name,
          initialChildren: children,
        );

  static const String name = 'LocationRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i7.LocationScreen();
    },
  );
}

/// generated route for
/// [_i8.SearchCharacterScreen]
class SearchCharacterRoute
    extends _i11.PageRouteInfo<SearchCharacterRouteArgs> {
  SearchCharacterRoute({
    _i12.Key? key,
    required _i13.GetCharactersByFilterParams params,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          SearchCharacterRoute.name,
          args: SearchCharacterRouteArgs(
            key: key,
            params: params,
          ),
          initialChildren: children,
        );

  static const String name = 'SearchCharacterRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SearchCharacterRouteArgs>();
      return _i11.WrappedRoute(
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

  final _i12.Key? key;

  final _i13.GetCharactersByFilterParams params;

  @override
  String toString() {
    return 'SearchCharacterRouteArgs{key: $key, params: $params}';
  }
}

/// generated route for
/// [_i9.SearchEpisodeScreen]
class SearchEpisodeRoute extends _i11.PageRouteInfo<void> {
  const SearchEpisodeRoute({List<_i11.PageRouteInfo>? children})
      : super(
          SearchEpisodeRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchEpisodeRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i9.SearchEpisodeScreen();
    },
  );
}

/// generated route for
/// [_i10.SearchLocationScreen]
class SearchLocationRoute extends _i11.PageRouteInfo<void> {
  const SearchLocationRoute({List<_i11.PageRouteInfo>? children})
      : super(
          SearchLocationRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchLocationRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i10.SearchLocationScreen();
    },
  );
}
