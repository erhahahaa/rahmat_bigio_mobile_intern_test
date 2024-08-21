import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_morty/core/core.dart';
import 'package:rick_morty/features/features.dart';
import 'package:rick_morty/utils/helpers/helpers.dart';

@lazySingleton
class GetCharacters extends FNPUC<WithPagination<CharacterEntity>> {
  final CharacterRepository repository;

  GetCharacters(this.repository);

  @override
  Future<Either<Failure, WithPagination<CharacterEntity>>> call() =>
      repository.getCharacters();
}
