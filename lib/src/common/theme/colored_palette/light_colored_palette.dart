import 'dart:ui';

import 'package:flutter_starter/src/common/theme/colored_palette/colored_palette.dart';

class LightColoredPalette implements ColoredPalette {
  @override
  Brightness get brightness => Brightness.light;

  @override
  Color get primary => const Color(0xFFFFFFFF);

  @override
  Color get secondary => const Color(0xFF000000);
}
