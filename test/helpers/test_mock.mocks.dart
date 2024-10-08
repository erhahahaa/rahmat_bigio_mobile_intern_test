// Mocks generated by Mockito 5.4.4 from annotations
// in hidayatullah/test/helpers/test_mock.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:hidayatullah/core/core.dart' as _i5;
import 'package:hidayatullah/features/features.dart' as _i3;
import 'package:hidayatullah/utils/utils.dart' as _i6;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [CharacterRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockCharacterRepository extends _i1.Mock
    implements _i3.CharacterRepository {
  MockCharacterRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<
      _i2.Either<_i5.Failure,
          _i6.WithPagination<_i3.CharacterEntity>>> getCharacters() =>
      (super.noSuchMethod(
        Invocation.method(
          #getCharacters,
          [],
        ),
        returnValue: _i4.Future<
                _i2.Either<_i5.Failure,
                    _i6.WithPagination<_i3.CharacterEntity>>>.value(
            _FakeEither_0<_i5.Failure, _i6.WithPagination<_i3.CharacterEntity>>(
          this,
          Invocation.method(
            #getCharacters,
            [],
          ),
        )),
      ) as _i4.Future<
          _i2.Either<_i5.Failure, _i6.WithPagination<_i3.CharacterEntity>>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.WithPagination<_i3.CharacterEntity>>>
      getCharactersByPagination(_i6.Pagination? pagination) =>
          (super.noSuchMethod(
            Invocation.method(
              #getCharactersByPagination,
              [pagination],
            ),
            returnValue: _i4.Future<
                    _i2.Either<_i5.Failure,
                        _i6.WithPagination<_i3.CharacterEntity>>>.value(
                _FakeEither_0<_i5.Failure,
                    _i6.WithPagination<_i3.CharacterEntity>>(
              this,
              Invocation.method(
                #getCharactersByPagination,
                [pagination],
              ),
            )),
          ) as _i4.Future<
              _i2
              .Either<_i5.Failure, _i6.WithPagination<_i3.CharacterEntity>>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, _i3.CharacterEntity>> getCharacter(
          _i6.ByIdParam? param) =>
      (super.noSuchMethod(
        Invocation.method(
          #getCharacter,
          [param],
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.Failure, _i3.CharacterEntity>>.value(
                _FakeEither_0<_i5.Failure, _i3.CharacterEntity>(
          this,
          Invocation.method(
            #getCharacter,
            [param],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i3.CharacterEntity>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i3.CharacterEntity>>>
      getMultipleCharacters(_i6.ByIdsParam? param) => (super.noSuchMethod(
            Invocation.method(
              #getMultipleCharacters,
              [param],
            ),
            returnValue: _i4.Future<
                    _i2.Either<_i5.Failure, List<_i3.CharacterEntity>>>.value(
                _FakeEither_0<_i5.Failure, List<_i3.CharacterEntity>>(
              this,
              Invocation.method(
                #getMultipleCharacters,
                [param],
              ),
            )),
          ) as _i4.Future<_i2.Either<_i5.Failure, List<_i3.CharacterEntity>>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i3.CharacterEntity>>>
      getFilteredCharacters(_i3.GetCharactersByFilterParams? params) =>
          (super.noSuchMethod(
            Invocation.method(
              #getFilteredCharacters,
              [params],
            ),
            returnValue: _i4.Future<
                    _i2.Either<_i5.Failure, List<_i3.CharacterEntity>>>.value(
                _FakeEither_0<_i5.Failure, List<_i3.CharacterEntity>>(
              this,
              Invocation.method(
                #getFilteredCharacters,
                [params],
              ),
            )),
          ) as _i4.Future<_i2.Either<_i5.Failure, List<_i3.CharacterEntity>>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i3.CharacterEntity>>>
      getCharactersFromCache() => (super.noSuchMethod(
            Invocation.method(
              #getCharactersFromCache,
              [],
            ),
            returnValue: _i4.Future<
                    _i2.Either<_i5.Failure, List<_i3.CharacterEntity>>>.value(
                _FakeEither_0<_i5.Failure, List<_i3.CharacterEntity>>(
              this,
              Invocation.method(
                #getCharactersFromCache,
                [],
              ),
            )),
          ) as _i4.Future<_i2.Either<_i5.Failure, List<_i3.CharacterEntity>>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i3.CharacterEntity>>>
      getFavoriteCharacters() => (super.noSuchMethod(
            Invocation.method(
              #getFavoriteCharacters,
              [],
            ),
            returnValue: _i4.Future<
                    _i2.Either<_i5.Failure, List<_i3.CharacterEntity>>>.value(
                _FakeEither_0<_i5.Failure, List<_i3.CharacterEntity>>(
              this,
              Invocation.method(
                #getFavoriteCharacters,
                [],
              ),
            )),
          ) as _i4.Future<_i2.Either<_i5.Failure, List<_i3.CharacterEntity>>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, _i3.CharacterEntity>>
      toggleFavoriteCharacter(_i6.ByIdParam? param) => (super.noSuchMethod(
            Invocation.method(
              #toggleFavoriteCharacter,
              [param],
            ),
            returnValue:
                _i4.Future<_i2.Either<_i5.Failure, _i3.CharacterEntity>>.value(
                    _FakeEither_0<_i5.Failure, _i3.CharacterEntity>(
              this,
              Invocation.method(
                #toggleFavoriteCharacter,
                [param],
              ),
            )),
          ) as _i4.Future<_i2.Either<_i5.Failure, _i3.CharacterEntity>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, void>> clearCache() => (super.noSuchMethod(
        Invocation.method(
          #clearCache,
          [],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, void>>.value(
            _FakeEither_0<_i5.Failure, void>(
          this,
          Invocation.method(
            #clearCache,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, void>>);
}

/// A class which mocks [EpisodeRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockEpisodeRepository extends _i1.Mock implements _i3.EpisodeRepository {
  MockEpisodeRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.WithPagination<_i3.EpisodeEntity>>>
      getEpisodes() => (super.noSuchMethod(
            Invocation.method(
              #getEpisodes,
              [],
            ),
            returnValue: _i4.Future<
                _i2.Either<_i5.Failure,
                    _i6.WithPagination<_i3.EpisodeEntity>>>.value(_FakeEither_0<
                _i5.Failure, _i6.WithPagination<_i3.EpisodeEntity>>(
              this,
              Invocation.method(
                #getEpisodes,
                [],
              ),
            )),
          ) as _i4.Future<
              _i2.Either<_i5.Failure, _i6.WithPagination<_i3.EpisodeEntity>>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.WithPagination<_i3.EpisodeEntity>>>
      getEpisodesByPagination(_i6.Pagination? pagination) =>
          (super.noSuchMethod(
            Invocation.method(
              #getEpisodesByPagination,
              [pagination],
            ),
            returnValue: _i4.Future<
                _i2.Either<_i5.Failure,
                    _i6.WithPagination<_i3.EpisodeEntity>>>.value(_FakeEither_0<
                _i5.Failure, _i6.WithPagination<_i3.EpisodeEntity>>(
              this,
              Invocation.method(
                #getEpisodesByPagination,
                [pagination],
              ),
            )),
          ) as _i4.Future<
              _i2.Either<_i5.Failure, _i6.WithPagination<_i3.EpisodeEntity>>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, _i3.EpisodeEntity>> getEpisode(
          _i6.ByIdParam? param) =>
      (super.noSuchMethod(
        Invocation.method(
          #getEpisode,
          [param],
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.Failure, _i3.EpisodeEntity>>.value(
                _FakeEither_0<_i5.Failure, _i3.EpisodeEntity>(
          this,
          Invocation.method(
            #getEpisode,
            [param],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i3.EpisodeEntity>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i3.EpisodeEntity>>>
      getMultipleEpisodes(_i6.ByIdsParam? param) => (super.noSuchMethod(
            Invocation.method(
              #getMultipleEpisodes,
              [param],
            ),
            returnValue: _i4
                .Future<_i2.Either<_i5.Failure, List<_i3.EpisodeEntity>>>.value(
                _FakeEither_0<_i5.Failure, List<_i3.EpisodeEntity>>(
              this,
              Invocation.method(
                #getMultipleEpisodes,
                [param],
              ),
            )),
          ) as _i4.Future<_i2.Either<_i5.Failure, List<_i3.EpisodeEntity>>>);

  @override
  _i4.Future<
      _i2.Either<_i5.Failure, List<_i3.EpisodeEntity>>> getFilteredEpisodes(
          _i3.GetEpisodesByFilterParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #getFilteredEpisodes,
          [params],
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.Failure, List<_i3.EpisodeEntity>>>.value(
                _FakeEither_0<_i5.Failure, List<_i3.EpisodeEntity>>(
          this,
          Invocation.method(
            #getFilteredEpisodes,
            [params],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, List<_i3.EpisodeEntity>>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i3.EpisodeEntity>>>
      getEpisodesFromCache() => (super.noSuchMethod(
            Invocation.method(
              #getEpisodesFromCache,
              [],
            ),
            returnValue: _i4
                .Future<_i2.Either<_i5.Failure, List<_i3.EpisodeEntity>>>.value(
                _FakeEither_0<_i5.Failure, List<_i3.EpisodeEntity>>(
              this,
              Invocation.method(
                #getEpisodesFromCache,
                [],
              ),
            )),
          ) as _i4.Future<_i2.Either<_i5.Failure, List<_i3.EpisodeEntity>>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i3.EpisodeEntity>>>
      getFavoriteEpisodes() => (super.noSuchMethod(
            Invocation.method(
              #getFavoriteEpisodes,
              [],
            ),
            returnValue: _i4
                .Future<_i2.Either<_i5.Failure, List<_i3.EpisodeEntity>>>.value(
                _FakeEither_0<_i5.Failure, List<_i3.EpisodeEntity>>(
              this,
              Invocation.method(
                #getFavoriteEpisodes,
                [],
              ),
            )),
          ) as _i4.Future<_i2.Either<_i5.Failure, List<_i3.EpisodeEntity>>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, _i3.EpisodeEntity>> toggleFavoriteEpisode(
          _i6.ByIdParam? param) =>
      (super.noSuchMethod(
        Invocation.method(
          #toggleFavoriteEpisode,
          [param],
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.Failure, _i3.EpisodeEntity>>.value(
                _FakeEither_0<_i5.Failure, _i3.EpisodeEntity>(
          this,
          Invocation.method(
            #toggleFavoriteEpisode,
            [param],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i3.EpisodeEntity>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, void>> clearCache() => (super.noSuchMethod(
        Invocation.method(
          #clearCache,
          [],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, void>>.value(
            _FakeEither_0<_i5.Failure, void>(
          this,
          Invocation.method(
            #clearCache,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, void>>);
}

/// A class which mocks [LocationRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockLocationRepository extends _i1.Mock
    implements _i3.LocationRepository {
  MockLocationRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.WithPagination<_i3.LocationEntity>>>
      getLocations() => (super.noSuchMethod(
            Invocation.method(
              #getLocations,
              [],
            ),
            returnValue: _i4.Future<
                    _i2.Either<_i5.Failure,
                        _i6.WithPagination<_i3.LocationEntity>>>.value(
                _FakeEither_0<_i5.Failure,
                    _i6.WithPagination<_i3.LocationEntity>>(
              this,
              Invocation.method(
                #getLocations,
                [],
              ),
            )),
          ) as _i4.Future<
              _i2.Either<_i5.Failure, _i6.WithPagination<_i3.LocationEntity>>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.WithPagination<_i3.LocationEntity>>>
      getLocationsByPagination(_i6.Pagination? pagination) =>
          (super.noSuchMethod(
            Invocation.method(
              #getLocationsByPagination,
              [pagination],
            ),
            returnValue: _i4.Future<
                    _i2.Either<_i5.Failure,
                        _i6.WithPagination<_i3.LocationEntity>>>.value(
                _FakeEither_0<_i5.Failure,
                    _i6.WithPagination<_i3.LocationEntity>>(
              this,
              Invocation.method(
                #getLocationsByPagination,
                [pagination],
              ),
            )),
          ) as _i4.Future<
              _i2.Either<_i5.Failure, _i6.WithPagination<_i3.LocationEntity>>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, _i3.LocationEntity>> getLocation(
          _i6.ByIdParam? param) =>
      (super.noSuchMethod(
        Invocation.method(
          #getLocation,
          [param],
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.Failure, _i3.LocationEntity>>.value(
                _FakeEither_0<_i5.Failure, _i3.LocationEntity>(
          this,
          Invocation.method(
            #getLocation,
            [param],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i3.LocationEntity>>);

  @override
  _i4.Future<
      _i2.Either<_i5.Failure, List<_i3.LocationEntity>>> getMultipleLocations(
          _i6.ByIdsParam? param) =>
      (super.noSuchMethod(
        Invocation.method(
          #getMultipleLocations,
          [param],
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.Failure, List<_i3.LocationEntity>>>.value(
                _FakeEither_0<_i5.Failure, List<_i3.LocationEntity>>(
          this,
          Invocation.method(
            #getMultipleLocations,
            [param],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, List<_i3.LocationEntity>>>);

  @override
  _i4.Future<
      _i2.Either<_i5.Failure, List<_i3.LocationEntity>>> getFilteredLocations(
          _i3.GetLocationsByFilterParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #getFilteredLocations,
          [params],
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.Failure, List<_i3.LocationEntity>>>.value(
                _FakeEither_0<_i5.Failure, List<_i3.LocationEntity>>(
          this,
          Invocation.method(
            #getFilteredLocations,
            [params],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, List<_i3.LocationEntity>>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i3.LocationEntity>>>
      getLocationsFromCache() => (super.noSuchMethod(
            Invocation.method(
              #getLocationsFromCache,
              [],
            ),
            returnValue: _i4.Future<
                    _i2.Either<_i5.Failure, List<_i3.LocationEntity>>>.value(
                _FakeEither_0<_i5.Failure, List<_i3.LocationEntity>>(
              this,
              Invocation.method(
                #getLocationsFromCache,
                [],
              ),
            )),
          ) as _i4.Future<_i2.Either<_i5.Failure, List<_i3.LocationEntity>>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i3.LocationEntity>>>
      getFavoriteLocations() => (super.noSuchMethod(
            Invocation.method(
              #getFavoriteLocations,
              [],
            ),
            returnValue: _i4.Future<
                    _i2.Either<_i5.Failure, List<_i3.LocationEntity>>>.value(
                _FakeEither_0<_i5.Failure, List<_i3.LocationEntity>>(
              this,
              Invocation.method(
                #getFavoriteLocations,
                [],
              ),
            )),
          ) as _i4.Future<_i2.Either<_i5.Failure, List<_i3.LocationEntity>>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, _i3.LocationEntity>>
      toggleFavoriteLocation(_i6.ByIdParam? param) => (super.noSuchMethod(
            Invocation.method(
              #toggleFavoriteLocation,
              [param],
            ),
            returnValue:
                _i4.Future<_i2.Either<_i5.Failure, _i3.LocationEntity>>.value(
                    _FakeEither_0<_i5.Failure, _i3.LocationEntity>(
              this,
              Invocation.method(
                #toggleFavoriteLocation,
                [param],
              ),
            )),
          ) as _i4.Future<_i2.Either<_i5.Failure, _i3.LocationEntity>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, void>> clearCache() => (super.noSuchMethod(
        Invocation.method(
          #clearCache,
          [],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, void>>.value(
            _FakeEither_0<_i5.Failure, void>(
          this,
          Invocation.method(
            #clearCache,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, void>>);
}
