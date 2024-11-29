import 'package:flutter/material.dart';
import 'package:flutter_starter/src/common/routes/redirect_builder.dart';
import 'package:go_router/go_router.dart';

final class RedirectIfFirstRun extends Guard {
  // matches login and signup routes
  @override
  Pattern get matchPattern => RegExp(r'^/(some_pattern_to_redirect)$');

  @override
  String? redirect(BuildContext context, GoRouterState state) {
    // final bool isFirstRun =
    //     DependenciesScope.of(context).boardingRepository.isFirstRun();

    // if (isFirstRun) {
    //   return Routes.onboarding;
    // }

    return null;
  }
}
