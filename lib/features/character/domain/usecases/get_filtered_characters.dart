import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_morty/core/core.dart';
import 'package:rick_morty/features/features.dart';

@lazySingleton
class GetFilteredCharacters
    extends FPUC<List<CharacterEntity>, GetCharactersByFilterParams> {
  final CharacterRepository repository;

  GetFilteredCharacters(this.repository);

  @override
  Future<Either<Failure, List<CharacterEntity>>> call(
    GetCharactersByFilterParams params,
  ) =>
      repository.getFilteredCharacters(params);
}
