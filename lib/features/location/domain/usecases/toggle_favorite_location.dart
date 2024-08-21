import 'package:dartz/dartz.dart';
import 'package:hidayatullah/core/core.dart';
import 'package:hidayatullah/features/features.dart';
import 'package:hidayatullah/utils/utils.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ToggleFavoriteLocation extends FPUC<LocationEntity, ByIdParam> {
  final LocationRepository repository;

  ToggleFavoriteLocation(this.repository);

  @override
  Future<Either<Failure, LocationEntity>> call(
    ByIdParam params,
  ) =>
      repository.toggleFavoriteLocation(params);
}
