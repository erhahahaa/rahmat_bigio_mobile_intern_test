import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_morty/features/features.dart';

part 'settings_model.freezed.dart';

@freezed
class SettingsModel extends SettingsEntity with _$SettingsModel {
  const factory SettingsModel({
    @Default(1) int id,
    @Default(ThemeMode.system) ThemeMode themeMode,
    @Default('en') String langCode,
    @Default('US') String countryCode,
  }) = _SettingsModel;

  const SettingsModel._();

  factory SettingsModel.fromEntity(SettingsEntity entity) {
    return SettingsModel(
      id: entity.id,
      themeMode: entity.themeMode,
      langCode: entity.langCode,
      countryCode: entity.countryCode,
    );
  }

  SettingsEntity toEntity() {
    return SettingsEntity(
      id: id,
      themeMode: themeMode,
      langCode: langCode,
      countryCode: countryCode,
    );
  }
}
