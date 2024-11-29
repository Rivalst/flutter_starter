import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/src/common/routes/boarding_guard.dart';
import 'package:flutter_starter/src/common/routes/redirect_builder.dart';
import 'package:flutter_starter/src/core/utils/logger/logger.dart';
import 'package:go_router/go_router.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'router.dart';

part 'routes.g.dart';

class Routes {
  static const logger = '/logger';
}
//
// class BranchTab1Data extends StatefulShellBranchData {
//   const BranchTab1Data();
// }

// @TypedStatefulShellRoute<BottomNavigationShellRoute>(
//   branches: <TypedStatefulShellBranch<StatefulShellBranchData>>[
//     TypedStatefulShellBranch<BranchTab1Data>(
//       routes: <TypedRoute<RouteData>>[
//         TypedGoRoute<Tab1Route>(path: Routes.tab1),
//       ],
//     ),
//     TypedStatefulShellBranch<BranchTab2Data>(
//       routes: <TypedRoute<RouteData>>[
//         TypedGoRoute<Tab2Route>(path: Routes.tab2),
//       ],
//     ),
//     TypedStatefulShellBranch<BranchTab3Data>(
//       routes: <TypedRoute<RouteData>>[
//         TypedGoRoute<Tab3Route>(path: Routes.tab3),
//       ],
//     ),
//     TypedStatefulShellBranch<BranchTab4Data>(
//       routes: <TypedRoute<RouteData>>[
//         TypedGoRoute<Tab4Route>(path: Routes.tab4),
//       ],
//     ),
//   ],
// )

/// Example of nested routes
// @TypedStatefulShellRoute<ResetPasswordShellRoute>(
//   branches: <TypedStatefulShellBranch<StatefulShellBranchData>>[
//     TypedStatefulShellBranch<ResetPasswordData>(
//       routes: <TypedRoute<RouteData>>[
//         TypedGoRoute<ResetPasswordRoute>(
//           path: Routes.resetPassword,
//           routes: <TypedRoute<RouteData>>[
//             TypedGoRoute<SendCodeRoute>(
//               path: 'send-code',
//               routes: <TypedRoute<RouteData>>[
//                 TypedGoRoute<ForgotPasswordRoute>(
//                   path: 'change-password',
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ],
//     ),
//   ],
// )

// class BottomNavigationShellRoute extends StatefulShellRouteData {
//   const BottomNavigationShellRoute();
//
//   @override
//   Widget builder(
//     BuildContext context,
//     GoRouterState state,
//     StatefulNavigationShell navigationShell,
//   ) =>
//       ScaffoldWithNavBar(navigationShell: navigationShell);
// }


// @TypedGoRoute<Tab1Route>(path: Routes.tab1)
// class Tab1Route extends GoRouteData {
//   const Tab1Route();
//
//   @override
//   Widget build(BuildContext context, GoRouterState state) =>
//       const Tab1Screen();
// }


@TypedGoRoute<LoggerRoute>(path: Routes.logger)
class LoggerRoute extends GoRouteData {
  const LoggerRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      TalkerScreen(talker: Logger.instance);
}



