import 'package:dartz/dartz.dart';
import 'package:hidayatullah/core/core.dart';
import 'package:hidayatullah/features/features.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetLocationsFromCache extends FNPUC<List<LocationEntity>> {
  final LocationRepository repository;

  GetLocationsFromCache(this.repository);

  @override
  Future<Either<Failure, List<LocationEntity>>> call() =>
      repository.getLocationsFromCache();
}
