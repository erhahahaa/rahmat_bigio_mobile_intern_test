import 'dart:ui';

import 'package:dartz/dartz.dart';
import 'package:hidayatullah/core/core.dart';
import 'package:hidayatullah/features/features.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetLocale extends FNPUC<Locale> {
  final SettingsRepository _repository;

  GetLocale(this._repository);

  @override
  Future<Either<Failure, Locale>> call() {
    return _repository.getLocale();
  }
}
