import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_morty/core/core.dart';
import 'package:rick_morty/features/features.dart';
import 'package:rick_morty/utils/utils.dart';

@lazySingleton
class GetCharactersById extends FPUC<CharacterEntity, ByIdParam> {
  final CharacterRepository repository;

  GetCharactersById(this.repository);

  @override
  Future<Either<Failure, CharacterEntity>> call(
    ByIdParam params,
  ) =>
      repository.getCharacter(params);
}
