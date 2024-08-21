import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_morty/core/core.dart';
import 'package:rick_morty/features/features.dart';
import 'package:rick_morty/utils/utils.dart';

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
