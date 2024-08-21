import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:rick_morty/core/core.dart';
import 'package:rick_morty/features/features.dart';

abstract class SettingsLocalDataSource {
  Future<Either<Failure, ThemeMode>> getThemeMode();
  Future<Either<Failure, ThemeMode>> setThemeMode(ThemeMode themeMode);
  Future<Either<Failure, Locale>> getLocale();
  Future<Either<Failure, Locale>> setLocale(Locale locale);
}

@LazySingleton(as: SettingsLocalDataSource)
class SettingsLocalDataSourceImpl implements SettingsLocalDataSource {
  final IsarClient _isar;

  SettingsLocalDataSourceImpl(this._isar);

  @override
  Future<Either<Failure, ThemeMode>> getThemeMode() async {
    try {
      final settings = await _isar.instance.settings.where().findAll();
      if (settings.isEmpty) {
        return const Right(ThemeMode.system);
      }
      return Right(settings.first.themeMode);
    } catch (e) {
      return const Left(CacheFailure(message: 'Failed to get theme mode'));
    }
  }

  @override
  Future<Either<Failure, ThemeMode>> setThemeMode(ThemeMode themeMode) async {
    try {
      final settings = await _isar.instance.settings.where().findAll();
      if (settings.isEmpty) {
        await _isar.instance.writeTxn(() async {
          await _isar.instance.settings.put(SettingsEntity(
            themeMode: themeMode,
          ));
        });
      } else {
        await _isar.instance.writeTxn(() async {
          await _isar.instance.settings.put(SettingsEntity(
            id: settings.first.id,
            themeMode: themeMode,
            langCode: settings.first.langCode,
            countryCode: settings.first.countryCode,
          ));
        });
      }
      return Right(themeMode);
    } catch (e) {
      return const Left(CacheFailure(message: 'Failed to set theme mode'));
    }
  }

  @override
  Future<Either<Failure, Locale>> getLocale() async {
    try {
      final settings = await _isar.instance.settings.where().findAll();
      if (settings.isEmpty) {
        return const Right(Locale('en', 'US'));
      }
      return Right(Locale(settings.first.langCode, settings.first.countryCode));
    } catch (e) {
      return const Left(CacheFailure(message: 'Failed to get locale'));
    }
  }

  @override
  Future<Either<Failure, Locale>> setLocale(Locale locale) async {
    try {
      final settings = await _isar.instance.settings.where().findAll();
      if (settings.isEmpty) {
        await _isar.instance.writeTxn(() async {
          await _isar.instance.settings.put(SettingsEntity(
            langCode: locale.languageCode,
            countryCode: locale.countryCode ?? 'US',
          ));
        });
      } else {
        await _isar.instance.writeTxn(() async {
          await _isar.instance.settings.put(SettingsEntity(
            id: settings.first.id,
            themeMode: settings.first.themeMode,
            langCode: locale.languageCode,
            countryCode: locale.countryCode ?? 'US',
          ));
        });
      }
      return Right(locale);
    } catch (e) {
      return const Left(CacheFailure(message: 'Failed to set locale'));
    }
  }
}
