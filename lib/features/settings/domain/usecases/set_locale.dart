import 'dart:ui';

import 'package:dartz/dartz.dart';
import 'package:hidayatullah/core/core.dart';
import 'package:hidayatullah/features/features.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SetLocale extends FPUC<Locale, Locale> {
  final SettingsRepository _repository;

  SetLocale(this._repository);

  @override
  Future<Either<Failure, Locale>> call(Locale params) {
    return _repository.setLocale(params);
  }
}
