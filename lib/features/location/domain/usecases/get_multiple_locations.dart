import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_morty/core/core.dart';
import 'package:rick_morty/features/features.dart';
import 'package:rick_morty/utils/utils.dart';

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
