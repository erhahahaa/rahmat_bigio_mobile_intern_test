import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rick_morty/core/core.dart';
import 'package:rick_morty/features/features.dart';
import 'package:rick_morty/utils/utils.dart';

import '../../../../helpers/json_reader.dart';
import '../../../../helpers/test_mock.mocks.dart';

void main() {
  late MockCharacterRepository mockCharacterRepository;
  late GetMultipleCharacters getCharacter;

  setUp(() {
    mockCharacterRepository = MockCharacterRepository();
    getCharacter = GetMultipleCharacters(mockCharacterRepository);
  });

  group('Get Character Usecase', () {
    test(
      'SHOULD return list of character WHEN call to repository is successful',
      () async {
        // arrange
        final testCharacter = json.decode(
          jsonReader('characters/all_character_raw.json'),
        )['results'] as List;
        when(mockCharacterRepository.getMultipleCharacters(
          ByIdsParam(ids: [1, 2, 3]),
        )).thenAnswer((_) async => Right(
              testCharacter.map((e) => CharacterModel.fromJson(e)).toList(),
            ));

        // act
        final result = await getCharacter(
          ByIdsParam(ids: [1, 2, 3]),
        );

        // assert
        expect(result, isA<Right>());
        result.fold(
          (l) => expect(l, isA<Failure>()),
          (r) => expect(r, isA<List<CharacterEntity>>()),
        );
        verify(mockCharacterRepository.getMultipleCharacters(
          ByIdsParam(ids: [1, 2, 3]),
        ));
        verifyNoMoreInteractions(mockCharacterRepository);
      },
    );

    test(
      'SHOULD return failure WHEN call to repository is unsuccessful',
      () async {
        // arrange
        when(mockCharacterRepository.getMultipleCharacters(
          ByIdsParam(ids: [1, 2, 3]),
        )).thenAnswer((_) async => Left(ServerFailure()));

        // act
        final result = await getCharacter(
          ByIdsParam(ids: [1, 2, 3]),
        );

        // assert
        expect(result, isA<Left>());
        result.fold(
          (l) => expect(l, isA<ServerFailure>()),
          (r) => expect(r, isA<List<CharacterEntity>>()),
        );
        verify(mockCharacterRepository.getMultipleCharacters(
          ByIdsParam(ids: [1, 2, 3]),
        ));
        verifyNoMoreInteractions(mockCharacterRepository);
      },
    );
  });
}
