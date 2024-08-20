import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_morty/core/core.dart';
import 'package:rick_morty/features/features.dart';

@lazySingleton
class ClearCharactersCache extends FNPUC<void> {
  final CharacterRepository repository;

  ClearCharactersCache(this.repository);

  @override
  Future<Either<Failure, void>> call() => repository.clearCache();
}
