import 'package:flutter/material.dart';
import 'package:flutter_starter/src/common/theme/colored_palette/colored_palette.dart';
import 'package:flutter_starter/src/common/theme/extension/color/color_extension.dart';
import 'package:flutter_starter/src/common/theme/extension/typography_extension.dart';

InputBorder _inputBorder(ColoredPalette palette) => OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: BorderSide(
        color: palette.secondary,
        width: 1.0,
      ),
    );

ThemeData createTheme(
  ColoredPalette palette, {
  required ColorExtension colors,
  required TypographyExtension typography,
}) =>
    ThemeData(
      useMaterial3: true,
      // fontFamily: 'PlusJakartaSans',
      scaffoldBackgroundColor: palette.primary,
      brightness: palette.brightness,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      // bottomSheetTheme: BottomSheetThemeData(
      //   backgroundColor: palette.primary,
      //   shape: const RoundedRectangleBorder(
      //     borderRadius: BorderRadius.vertical(
      //       top: Radius.circular(
      //         20,
      //       ), // Adjust this value for the desired corner radius
      //     ),
      //   ),
      // ),
      // colorScheme: ColorScheme(
      //   primary: palette.primary,
      //   secondary: palette.primary,
      //   surface: palette.background,
      //   background: palette.background,
      //   error: palette.error,
      //   onPrimary: palette.onBackground,
      //   onSecondary: palette.onBackground,
      //   onSurface: palette.onBackground,
      //   onBackground: palette.onBackground,
      //   onError: palette.onBackground,
      //   brightness: palette.brightness,
      // ),
      // appBarTheme: AppBarTheme(
      //   centerTitle: false,
      //   titleTextStyle: TextStyle(
      //     fontSize: 24.0,
      //     fontWeight: FontWeight.w500,
      //     color: palette.secondary,
      //   ),
        // surfaceTintColor: palette.primary,
        // backgroundColor: palette.primary,
        // foregroundColor: palette.primary,
      // ),
      // inputDecorationTheme: InputDecorationTheme(
      //   filled: true,
      //   fillColor: palette.primary,
      //   contentPadding: const EdgeInsets.symmetric(
      //     horizontal: 16.0,
      //     vertical: 12.0,
      //   ),
        // border: _inputBorder(palette),
        // focusedBorder: _inputBorder(palette),
        // enabledBorder: _inputBorder(palette),
        // errorBorder: _inputBorder(palette),
        // focusedErrorBorder: _inputBorder(palette),
        // disabledBorder: _inputBorder(palette),
        // hintStyle: TextStyle(
        //   color: palette.primary,
        //   fontSize: 14.0,
        //   fontWeight: FontWeight.w400,
        // ),
      // ),
      // checkboxTheme: CheckboxThemeData(
      //   checkColor: WidgetStateProperty.all(palette.primary),
      //   fillColor: WidgetStateProperty.resolveWith((states) {
      //     if (states.contains(WidgetState.selected)) {
      //       return palette.primary;
      //     }
      //     return palette.primary;
      //   }),
      //   side: BorderSide(
      //     color: palette.primary,
      //     width: 1.0,
      //   ),
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(2.0),
      //   ),
      // ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(),
        displayMedium: TextStyle(),
        displaySmall: TextStyle(),
        headlineLarge: TextStyle(),
        headlineMedium: TextStyle(),
        headlineSmall: TextStyle(),
        titleLarge: TextStyle(),
        titleMedium: TextStyle(),
      ),
      extensions: {
        colors,
        typography,
      },
    );
