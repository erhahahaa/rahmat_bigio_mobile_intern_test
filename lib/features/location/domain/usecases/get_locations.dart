import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_morty/core/core.dart';
import 'package:rick_morty/features/features.dart';

@lazySingleton
class GetLocations extends FNPUC<List<LocationEntity>> {
  final LocationRepository repository;

  GetLocations(this.repository);

  @override
  Future<Either<Failure, List<LocationEntity>>> call() =>
      repository.getLocations();
}
