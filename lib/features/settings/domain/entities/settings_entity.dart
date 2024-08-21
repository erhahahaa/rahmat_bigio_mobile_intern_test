import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

part 'settings_entity.g.dart';

@Collection(accessor: 'settings')
class SettingsEntity {
  final Id id;
  @enumerated
  final ThemeMode themeMode;
  final String langCode, countryCode;

  const SettingsEntity({
    this.id = 0,
    this.themeMode = ThemeMode.system,
    this.langCode = 'en',
    this.countryCode = 'US',
  });
}
