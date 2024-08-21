part of 'settings_bloc.dart';

@freezed
class SettingsEvent with _$SettingsEvent {
  const factory SettingsEvent.started() = _Started;
  const factory SettingsEvent.changedTheme(ThemeMode themeMode) = _ChangedTheme;
  const factory SettingsEvent.changedLocale(Locale locale) = _ChangedLocale;
}
