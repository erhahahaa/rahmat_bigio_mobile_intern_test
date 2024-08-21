// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:rick_morty/features/character/ui/screens/detail_character_screen.dart'
    as _i1;
import 'package:rick_morty/features/character/ui/screens/home_screen.dart'
    as _i2;
import 'package:rick_morty/features/character/ui/screens/search_character_screen.dart'
    as _i3;

/// generated route for
/// [_i1.DetailCharacterScreen]
class DetailCharacterRoute extends _i4.PageRouteInfo<DetailCharacterRouteArgs> {
  DetailCharacterRoute({
    _i5.Key? key,
    required int id,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          DetailCharacterRoute.name,
          args: DetailCharacterRouteArgs(
            key: key,
            id: id,
          ),
          rawPathParams: {'id': id},
          initialChildren: children,
        );

  static const String name = 'DetailCharacterRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<DetailCharacterRouteArgs>(
          orElse: () => DetailCharacterRouteArgs(id: pathParams.getInt('id')));
      return _i1.DetailCharacterScreen(
        key: args.key,
        id: args.id,
      );
    },
  );
}

class DetailCharacterRouteArgs {
  const DetailCharacterRouteArgs({
    this.key,
    required this.id,
  });

  final _i5.Key? key;

  final int id;

  @override
  String toString() {
    return 'DetailCharacterRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute({List<_i4.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return _i4.WrappedRoute(child: const _i2.HomeScreen());
    },
  );
}

/// generated route for
/// [_i3.SearchCharacterScreen]
class SearchCharacterRoute extends _i4.PageRouteInfo<void> {
  const SearchCharacterRoute({List<_i4.PageRouteInfo>? children})
      : super(
          SearchCharacterRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchCharacterRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i3.SearchCharacterScreen();
    },
  );
}
