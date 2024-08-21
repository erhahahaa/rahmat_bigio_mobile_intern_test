import 'package:dartz/dartz.dart';
import 'package:hidayatullah/core/core.dart';
import 'package:hidayatullah/features/features.dart';
import 'package:injectable/injectable.dart';

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
