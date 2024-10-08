import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:hidayatullah/core/core.dart';
import 'package:hidayatullah/features/features.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetThemeMode extends FNPUC<ThemeMode> {
  final SettingsRepository _repository;

  GetThemeMode(this._repository);

  @override
  Future<Either<Failure, ThemeMode>> call() {
    return _repository.getThemeMode();
  }
}
