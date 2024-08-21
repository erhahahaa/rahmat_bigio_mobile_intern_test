import 'dart:ui';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_morty/core/core.dart';
import 'package:rick_morty/features/features.dart';

@lazySingleton
class SetLocale extends FPUC<Locale, Locale> {
  final SettingsRepository _repository;

  SetLocale(this._repository);

  @override
  Future<Either<Failure, Locale>> call(Locale params) {
    return _repository.setLocale(params);
  }
}
