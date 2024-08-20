import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_morty/core/core.dart';
import 'package:rick_morty/features/features.dart';
import 'package:rick_morty/utils/utils.dart';

@lazySingleton
class GetMultipleCharacters extends FPUC<List<CharacterEntity>, ByIdsParam> {
  final CharacterRepository repository;

  GetMultipleCharacters(this.repository);

  @override
  Future<Either<Failure, List<CharacterEntity>>> call(
    ByIdsParam params,
  ) =>
      repository.getMultipleCharacters(params);
}
