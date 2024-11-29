import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/src/feature/app/model/app_theme.dart';
import 'package:flutter_starter/src/feature/settings/data/locale_repository.dart';
import 'package:flutter_starter/src/feature/settings/data/text_scale_repository.dart';
import 'package:flutter_starter/src/feature/settings/data/theme_repository.dart';

part 'settings_state.dart';

part 'settings_event.dart';

/// {@template settings_bloc}
/// A [Bloc] that handles the settings.
/// {@endtemplate}
final class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  /// {@macro settings_bloc}
  SettingsBloc({
    required LocaleRepository localeRepository,
    required ThemeRepository themeRepository,
    required TextScaleRepository textScaleRepository,
    required SettingsState initialState,
  })  : _localeRepo = localeRepository,
        _themeRepo = themeRepository,
        _textScaleRepo = textScaleRepository,
        super(initialState) {
    on<SettingsEvent>(
      (event, emit) => switch (event) {
        final _UpdateLocaleSettingsEvent e => _updateLocale(e, emit),
        final _UpdateThemeSettingsEvent e => _updateTheme(e, emit),
        final _UpdateTextScaleSettingsEvent e => _updateTextScale(e, emit),
      },
    );
  }

  final LocaleRepository _localeRepo;
  final ThemeRepository _themeRepo;
  final TextScaleRepository _textScaleRepo;

  Future<void> _updateTheme(
    _UpdateThemeSettingsEvent event,
    Emitter<SettingsState> emitter,
  ) async {
    try {
      emitter(
        SettingsState.processing(
          appTheme: state.appTheme,
          locale: state.locale,
          textScale: state.textScale,
        ),
      );
      await _themeRepo.setTheme(event.appTheme);

      emitter(
        SettingsState.idle(
          appTheme: event.appTheme,
          locale: state.locale,
          textScale: state.textScale,
        ),
      );
    } on Object catch (e, stackTrace) {
      emitter(
        SettingsState.error(
          appTheme: state.appTheme,
          locale: state.locale,
          textScale: state.textScale,
          cause: e,
        ),
      );
      onError(e, stackTrace);
    }
  }

  Future<void> _updateLocale(
    _UpdateLocaleSettingsEvent event,
    Emitter<SettingsState> emitter,
  ) async {
    try {
      emitter(
        SettingsState.processing(
          appTheme: state.appTheme,
          locale: state.locale,
          textScale: state.textScale,
        ),
      );
      await _localeRepo.setLocale(event.locale);

      emitter(
        SettingsState.idle(
          appTheme: state.appTheme,
          locale: event.locale,
          textScale: state.textScale,
        ),
      );
    } on Object catch (e, stackTrace) {
      emitter(
        SettingsState.error(
          appTheme: state.appTheme,
          locale: state.locale,
          textScale: state.textScale,
          cause: e,
        ),
      );
      onError(e, stackTrace);
    }
  }

  Future<void> _updateTextScale(
    _UpdateTextScaleSettingsEvent event,
    Emitter<SettingsState> emitter,
  ) async {
    try {
      emitter(
        SettingsState.processing(
          appTheme: state.appTheme,
          locale: state.locale,
          textScale: state.textScale,
        ),
      );
      await _textScaleRepo.setScale(event.textScale);

      emitter(
        SettingsState.idle(
          appTheme: state.appTheme,
          locale: state.locale,
          textScale: event.textScale,
        ),
      );
    } on Object catch (e, stackTrace) {
      emitter(
        SettingsState.error(
          appTheme: state.appTheme,
          locale: state.locale,
          textScale: state.textScale,
          cause: e,
        ),
      );
      onError(e, stackTrace);
    }
  }
}
