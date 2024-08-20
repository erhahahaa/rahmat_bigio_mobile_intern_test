import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_morty/core/core.dart';
import 'package:rick_morty/features/features.dart';

@lazySingleton
class ClearLocationsCache extends FNPUC<void> {
  final LocationRepository repository;

  ClearLocationsCache(this.repository);

  @override
  Future<Either<Failure, void>> call() => repository.clearCache();
}
