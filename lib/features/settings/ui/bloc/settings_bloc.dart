import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hidayatullah/features/features.dart';
import 'package:injectable/injectable.dart';

part 'settings_bloc.freezed.dart';
part 'settings_event.dart';
part 'settings_state.dart';

@lazySingleton
class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final GetThemeMode _getThemeMode;
  final SetThemeMode _setThemeMode;
  final GetLocale _getLocale;
  final SetLocale _setLocale;

  SettingsBloc(
    this._getThemeMode,
    this._setThemeMode,
    this._getLocale,
    this._setLocale,
  ) : super(const SettingsState()) {
    on<_ChangedLocale>(_changeLocaleHandler);
    on<_ChangedTheme>(_changeThemeHandler);
    on<_Started>(_startedHandler);
  }

  Future<void> _changeThemeHandler(
    _ChangedTheme event,
    Emitter<SettingsState> emit,
  ) async {
    final result = await _setThemeMode(event.themeMode);
    emit(SettingsState(themeMode: result.getOrElse(() => state.themeMode)));
  }

  Future<void> _changeLocaleHandler(
    _ChangedLocale event,
    Emitter<SettingsState> emit,
  ) async {
    final result = await _setLocale(event.locale);
    emit(SettingsState(locale: result.getOrElse(() => state.locale)));
  }

  Future<void> _startedHandler(
    _Started event,
    Emitter<SettingsState> emit,
  ) async {
    final themeMode = await _getThemeMode();
    final locale = await _getLocale();
    emit(SettingsState(
      themeMode: themeMode.getOrElse(() => state.themeMode),
      locale: locale.getOrElse(() => state.locale),
    ));
  }
}
