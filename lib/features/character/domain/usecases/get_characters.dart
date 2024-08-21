import 'package:dartz/dartz.dart';
import 'package:hidayatullah/core/core.dart';
import 'package:hidayatullah/features/features.dart';
import 'package:hidayatullah/utils/helpers/helpers.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetCharacters extends FNPUC<WithPagination<CharacterEntity>> {
  final CharacterRepository repository;

  GetCharacters(this.repository);

  @override
  Future<Either<Failure, WithPagination<CharacterEntity>>> call() =>
      repository.getCharacters();
}
