import 'dart:ui';

abstract interface class ColoredPalette {
  const ColoredPalette({
    required this.brightness,
    required this.primary,
    required this.secondary,
  });

  final Brightness brightness;
  final Color primary;
  final Color secondary;
}
