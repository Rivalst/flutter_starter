import 'package:flutter/material.dart';
import 'package:flutter_starter/src/common/routes/routes.dart';
import 'package:flutter_starter/src/core/constant/localization/localization.dart';
import 'package:flutter_starter/src/feature/settings/widget/settings_scope.dart';

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

void showSnackBar(String message) {
  scaffoldMessengerKey.currentState?.showSnackBar(
    SnackBar(
      content: Text(message),
    ),
  );
}

class MaterialContext extends StatelessWidget {
  const MaterialContext({super.key});

  static final _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final theme = SettingsScope.themeOf(context).theme;
    final locale = SettingsScope.localeOf(context).locale;
    final textScale = SettingsScope.textScaleOf(context).textScale;

    final mediaQueryData = MediaQuery.of(context);

    return MaterialApp.router(
      scaffoldMessengerKey: scaffoldMessengerKey,
      theme: theme.lightTheme,
      darkTheme: theme.darkTheme,
      themeMode: theme.mode,
      locale: locale,
      localizationsDelegates: Localization.localizationDelegates,
      supportedLocales: Localization.supportedLocales,
      // routerConfig: AppRouter.router,
      routerConfig: AppRouter().router,
      builder: (context, child) => MediaQuery(
        key: _globalKey,
        data: mediaQueryData.copyWith(
          textScaler: TextScaler.linear(
            mediaQueryData.textScaler.scale(textScale).clamp(0.5, 2),
          ),
        ),
        child: child!,
      ),
    );
  }
}
