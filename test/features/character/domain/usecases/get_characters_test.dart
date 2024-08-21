import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rick_morty/core/errors/failure.dart';
import 'package:rick_morty/features/features.dart';
import 'package:rick_morty/utils/utils.dart';

import '../../../../helpers/test_mock.mocks.dart';

void main() {
  late MockCharacterRepository mockCharacterRepository;
  late GetCharacters getCharacters;

  setUp(() {
    mockCharacterRepository = MockCharacterRepository();
    getCharacters = GetCharacters(mockCharacterRepository);
  });

  group('Get Character Usecase', () {
    test(
      'SHOULD return list of characters WHEN call to repository is successful',
      () async {
        // arrange
        when(mockCharacterRepository.getCharacters()).thenAnswer((_) async =>
            const Right(WithPagination(info: Pagination(), results: [])));
        // act
        final result = await getCharacters();
        // assert
        expect(result, isA<Right>());
        result.fold(
          (l) => expect(l, isA<Failure>()),
          (r) => expect(r, isA<WithPagination<CharacterEntity>>()),
        );
        verify(mockCharacterRepository.getCharacters());
        verifyNoMoreInteractions(mockCharacterRepository);
      },
    );

    test(
      'SHOULD return failure WHEN call to repository is unsuccessful',
      () async {
        // arrange
        when(mockCharacterRepository.getCharacters())
            .thenAnswer((_) async => const Left(ServerFailure()));
        // act
        final result = await getCharacters();

        // assert
        expect(result, isA<Left>());
        result.fold(
          (l) => expect(l, isA<ServerFailure>()),
          (r) => expect(r, isA<List<CharacterEntity>>()),
        );
        verify(mockCharacterRepository.getCharacters());
        verifyNoMoreInteractions(mockCharacterRepository);
      },
    );
  });
}
