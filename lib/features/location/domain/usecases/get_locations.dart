import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_morty/core/core.dart';
import 'package:rick_morty/features/features.dart';
import 'package:rick_morty/utils/helpers/helpers.dart';

@lazySingleton
class GetLocations extends FNPUC<WithPagination<LocationEntity>> {
  final LocationRepository repository;

  GetLocations(this.repository);

  @override
  Future<Either<Failure, WithPagination<LocationEntity>>> call() =>
      repository.getLocations();
}
