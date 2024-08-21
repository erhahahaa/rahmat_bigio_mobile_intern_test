import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:rick_morty/core/core.dart';

abstract class SettingsRepository {
  Future<Either<Failure, ThemeMode>> getThemeMode();
  Future<Either<Failure, ThemeMode>> setThemeMode(ThemeMode themeMode);
  Future<Either<Failure, Locale>> getLocale();
  Future<Either<Failure, Locale>> setLocale(Locale locale);
}
