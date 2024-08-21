import 'dart:ui';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_morty/core/core.dart';
import 'package:rick_morty/features/features.dart';

@lazySingleton
class GetLocale extends FNPUC<Locale> {
  final SettingsRepository _repository;

  GetLocale(this._repository);

  @override
  Future<Either<Failure, Locale>> call() {
    return _repository.getLocale();
  }
}
