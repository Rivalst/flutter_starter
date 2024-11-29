import 'package:flutter/material.dart';

class ColorExtension extends ThemeExtension<ColorExtension> {
  const ColorExtension({
    required this.primary,
    required this.secondary,
  });

  final Color primary;
  final Color secondary;

  @override
  ThemeExtension<ColorExtension> copyWith({
    Color? primary,
    Color? secondary,
  }) =>
      ColorExtension(
        primary: primary ?? this.primary,
        secondary: secondary ?? this.secondary,
      );

  @override
  ThemeExtension<ColorExtension> lerp(
    covariant ThemeExtension<ColorExtension>? other,
    double t,
  ) {
    if (other == null || other is! ColorExtension) {
      return this;
    }

    return ColorExtension(
      primary: Color.lerp(primary, other.primary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
    );
  }
}
