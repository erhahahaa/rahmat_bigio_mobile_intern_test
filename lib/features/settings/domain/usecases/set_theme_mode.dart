import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:hidayatullah/core/core.dart';
import 'package:hidayatullah/features/features.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SetThemeMode extends FPUC<ThemeMode, ThemeMode> {
  final SettingsRepository _repository;

  SetThemeMode(this._repository);

  @override
  Future<Either<Failure, ThemeMode>> call(ThemeMode params) {
    return _repository.setThemeMode(params);
  }
}
