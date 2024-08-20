import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_morty/core/core.dart';
import 'package:rick_morty/features/features.dart';

@lazySingleton
class GetCharactersFromCache extends FNPUC<List<CharacterEntity>> {
  final CharacterRepository repository;

  GetCharactersFromCache(this.repository);

  @override
  Future<Either<Failure, List<CharacterEntity>>> call() =>
      repository.getCharactersFromCache();
}
