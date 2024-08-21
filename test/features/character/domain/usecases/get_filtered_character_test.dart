import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rick_morty/core/core.dart';
import 'package:rick_morty/features/features.dart';

import '../../../../helpers/json_reader.dart';
import '../../../../helpers/test_mock.mocks.dart';

void main() {
  late MockCharacterRepository mockCharacterRepository;
  late GetFilteredCharacters getFilteredCharacters;

  setUp(() {
    mockCharacterRepository = MockCharacterRepository();
    getFilteredCharacters = GetFilteredCharacters(mockCharacterRepository);
  });

  group('Get Filtered Character Usecase', () {
    test(
      'SHOULD return list of character WHEN call to repository is successful',
      () async {
        // arrange
        final testCharacter = json.decode(
          jsonReader('characters/all_character_raw.json'),
        )['results'] as List;
        when(mockCharacterRepository.getFilteredCharacters(
          GetCharactersByFilterParams(
              name: 'Rick', status: CharacterStatus.alive),
        )).thenAnswer((_) async => Right(
              testCharacter.map((e) => CharacterModel.fromJson(e)).toList(),
            ));

        // act
        final result = await getFilteredCharacters(
          GetCharactersByFilterParams(
              name: 'Rick', status: CharacterStatus.alive),
        );

        // assert
        expect(result, isA<Right>());
        result.fold(
          (l) => expect(l, isA<Failure>()),
          (r) => expect(r, isA<List<CharacterEntity>>()),
        );
        verify(mockCharacterRepository.getFilteredCharacters(
          GetCharactersByFilterParams(
              name: 'Rick', status: CharacterStatus.alive),
        ));
        verifyNoMoreInteractions(mockCharacterRepository);
      },
    );

    test(
      'SHOULD return failure WHEN call to repository is unsuccessful',
      () async {
        // arrange
        when(mockCharacterRepository.getFilteredCharacters(
          GetCharactersByFilterParams(
              name: 'Rick', status: CharacterStatus.alive),
        )).thenAnswer((_) async => Left(ServerFailure()));
        // act
        final result = await getFilteredCharacters(
          GetCharactersByFilterParams(
              name: 'Rick', status: CharacterStatus.alive),
        );

        // assert
        expect(result, isA<Left>());
        result.fold(
          (l) => expect(l, isA<ServerFailure>()),
          (r) => expect(r, isA<List<CharacterEntity>>()),
        );
        verify(mockCharacterRepository.getFilteredCharacters(
          GetCharactersByFilterParams(
              name: 'Rick', status: CharacterStatus.alive),
        ));
        verifyNoMoreInteractions(mockCharacterRepository);
      },
    );
  });
}
