import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter/src/common/theme/app_theme.dart';
import 'package:flutter_starter/src/common/theme/colored_palette/dark_colored_palette.dart';
import 'package:flutter_starter/src/common/theme/colored_palette/light_colored_palette.dart';
import 'package:flutter_starter/src/common/theme/theme_helper.dart';

@immutable
final class AppTheme with Diagnosticable {
  AppTheme({required this.mode, required this.seed})
      : darkTheme = createTheme(
          DarkColoredPalette(),
          colors: darkColor,
          typography: darkTypography,
        ),
        lightTheme = createTheme(
          LightColoredPalette(),
          colors: lightColor,
          typography: lightTypography,
        );

  final ThemeMode mode;

  final Color seed;

  final ThemeData darkTheme;

  final ThemeData lightTheme;

  static final defaultTheme = AppTheme(
    mode: ThemeMode.system,
    seed: Colors.blue,
  );

  ThemeData computeTheme() {
    switch (mode) {
      case ThemeMode.light:
        return lightTheme;
      case ThemeMode.dark:
        return darkTheme;
      case ThemeMode.system:
        return PlatformDispatcher.instance.platformBrightness == Brightness.dark
            ? darkTheme
            : lightTheme;
    }
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ColorProperty('seed', seed));
    properties.add(EnumProperty<ThemeMode>('type', mode));
    properties.add(DiagnosticsProperty<ThemeData>('lightTheme', lightTheme));
    properties.add(DiagnosticsProperty<ThemeData>('darkTheme', darkTheme));
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppTheme && seed == other.seed && mode == other.mode;

  @override
  int get hashCode => Object.hash(seed, mode);
}
