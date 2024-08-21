import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rick_morty/core/errors/failure.dart';
import 'package:rick_morty/features/features.dart';
import 'package:rick_morty/utils/utils.dart';

import '../../../../helpers/json_reader.dart';
import '../../../../helpers/test_mock.mocks.dart';

void main() {
  late MockCharacterRepository mockCharacterRepository;
  late GetCharactersById getCharacter;

  setUp(() {
    mockCharacterRepository = MockCharacterRepository();
    getCharacter = GetCharactersById(mockCharacterRepository);
  });

  group('Get Character Usecase', () {
    test(
      'SHOULD return list of character WHEN call to repository is successful',
      () async {
        // arrange
        final testCharacter = json.decode(
          jsonReader('characters/character_1.json'),
        );
        when(mockCharacterRepository.getCharacter(
          const ByIdParam(id: 1),
        )).thenAnswer((_) async => Right(
              CharacterModel.fromJson(testCharacter),
            ));
        // act
        final result = await getCharacter(
          const ByIdParam(id: 1),
        );
        // assert
        expect(result, isA<Right>());
        result.fold(
          (l) => expect(l, isA<Failure>()),
          (r) => expect(r, isA<CharacterEntity>()),
        );
        verify(mockCharacterRepository.getCharacter(
          const ByIdParam(id: 1),
        ));
        verifyNoMoreInteractions(mockCharacterRepository);
      },
    );

    test(
      'SHOULD return failure WHEN call to repository is unsuccessful',
      () async {
        // arrange
        when(mockCharacterRepository.getCharacter(
          const ByIdParam(id: -2),
        )).thenAnswer((_) async => const Left(ServerFailure()));
        // act
        final result = await getCharacter(
          const ByIdParam(id: -2),
        );

        // assert
        expect(result, isA<Left>());
        result.fold(
          (l) => expect(l, isA<ServerFailure>()),
          (r) => expect(r, isA<CharacterEntity>()),
        );
        verify(mockCharacterRepository.getCharacter(
          const ByIdParam(id: -2),
        ));
        verifyNoMoreInteractions(mockCharacterRepository);
      },
    );
  });
}
