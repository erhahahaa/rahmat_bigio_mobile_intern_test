import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_morty/core/errors/failure.dart';
import 'package:rick_morty/features/features.dart';

@LazySingleton(as: SettingsRepository)
class SettingsRepositoryImpl implements SettingsRepository {
  final SettingsLocalDataSource _localDataSource;

  SettingsRepositoryImpl(this._localDataSource);

  @override
  Future<Either<Failure, Locale>> getLocale() {
    return _localDataSource.getLocale();
  }

  @override
  Future<Either<Failure, ThemeMode>> getThemeMode() {
    return _localDataSource.getThemeMode();
  }

  @override
  Future<Either<Failure, Locale>> setLocale(Locale locale) {
    return _localDataSource.setLocale(locale);
  }

  @override
  Future<Either<Failure, ThemeMode>> setThemeMode(ThemeMode themeMode) {
    return _localDataSource.setThemeMode(themeMode);
  }
}
