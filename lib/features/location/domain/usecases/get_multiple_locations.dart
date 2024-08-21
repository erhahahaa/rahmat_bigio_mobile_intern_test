import 'package:dartz/dartz.dart';
import 'package:hidayatullah/core/core.dart';
import 'package:hidayatullah/features/features.dart';
import 'package:hidayatullah/utils/utils.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetMultipleLocations extends FPUC<List<LocationEntity>, ByIdsParam> {
  final LocationRepository repository;

  GetMultipleLocations(this.repository);

  @override
  Future<Either<Failure, List<LocationEntity>>> call(
    ByIdsParam params,
  ) =>
      repository.getMultipleLocations(params);
}
