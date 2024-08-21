import 'package:dartz/dartz.dart';
import 'package:hidayatullah/core/core.dart';
import 'package:hidayatullah/features/features.dart';
import 'package:hidayatullah/utils/utils.dart';
import 'package:injectable/injectable.dart';

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
