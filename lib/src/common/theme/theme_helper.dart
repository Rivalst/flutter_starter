import 'package:flutter/material.dart';
import 'package:flutter_starter/src/common/theme/colored_palette/colored_palette.dart';
import 'package:flutter_starter/src/common/theme/colored_palette/light_colored_palette.dart';
import 'package:flutter_starter/src/common/theme/extension/color/color_extension.dart';
import 'package:flutter_starter/src/common/theme/extension/typography_extension.dart';

ColorExtension _colorExtension(ColoredPalette palette) => ColorExtension(
      primary: palette.primary,
      secondary: palette.secondary,
    );

TypographyExtension _typographyExtension(Color color) =>
    const TypographyExtension(
      displayLarge: TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.w600,
      ),
      displayMedium: TextStyle(
        fontSize: 36.0,
        fontWeight: FontWeight.w600,
      ),
      displaySmall: TextStyle(
        fontSize: 34.0,
        fontWeight: FontWeight.w600,
      ),
      headlineLarge: TextStyle(
        fontSize: 32.0,
        fontWeight: FontWeight.w600,
      ),
      headlineMedium: TextStyle(
        fontSize: 30.0,
        fontWeight: FontWeight.w600,
      ),
      headlineSmall: TextStyle(
        fontSize: 28.0,
        fontWeight: FontWeight.w600,
      ),
      titleLarge: TextStyle(
        fontSize: 26.0,
        fontWeight: FontWeight.w600,
      ),
      titleMedium: TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.w600,
      ),
      titleSmall: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w600,
      ),
      bodyMedium: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w300,
      ),
      labelLarge: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w400,
      ),
      labelMedium: TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.w400,
      ),
      labelSmall: TextStyle(
        fontSize: 10.0,
        fontWeight: FontWeight.w400,
      ),
    );

ColorExtension get lightColor => _colorExtension(LightColoredPalette());

ColorExtension get darkColor => _colorExtension(LightColoredPalette());

TypographyExtension get lightTypography =>
    _typographyExtension(lightColor.secondary);

TypographyExtension get darkTypography =>
    _typographyExtension(darkColor.secondary);
