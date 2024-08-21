import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_morty/core/core.dart';
import 'package:rick_morty/features/features.dart';

@lazySingleton
class GetThemeMode extends FNPUC<ThemeMode> {
  final SettingsRepository _repository;

  GetThemeMode(this._repository);

  @override
  Future<Either<Failure, ThemeMode>> call() {
    return _repository.getThemeMode();
  }
}
