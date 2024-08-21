import 'package:dartz/dartz.dart';
import 'package:hidayatullah/core/core.dart';
import 'package:hidayatullah/features/features.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetCharactersFromCache extends FNPUC<List<CharacterEntity>> {
  final CharacterRepository repository;

  GetCharactersFromCache(this.repository);

  @override
  Future<Either<Failure, List<CharacterEntity>>> call() =>
      repository.getCharactersFromCache();
}
