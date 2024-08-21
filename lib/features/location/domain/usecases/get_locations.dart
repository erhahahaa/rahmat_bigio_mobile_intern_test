import 'package:dartz/dartz.dart';
import 'package:hidayatullah/core/core.dart';
import 'package:hidayatullah/features/features.dart';
import 'package:hidayatullah/utils/helpers/helpers.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetLocations extends FNPUC<WithPagination<LocationEntity>> {
  final LocationRepository repository;

  GetLocations(this.repository);

  @override
  Future<Either<Failure, WithPagination<LocationEntity>>> call() =>
      repository.getLocations();
}
