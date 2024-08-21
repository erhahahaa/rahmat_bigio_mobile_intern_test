import 'package:dartz/dartz.dart';
import 'package:hidayatullah/core/core.dart';
import 'package:hidayatullah/features/features.dart';
import 'package:hidayatullah/utils/utils.dart';
import 'package:injectable/injectable.dart';

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
