// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $loggerRoute,
    ];

RouteBase get $loggerRoute => GoRouteData.$route(
      path: '/logger',
      factory: $LoggerRouteExtension._fromState,
    );

extension $LoggerRouteExtension on LoggerRoute {
  static LoggerRoute _fromState(GoRouterState state) => const LoggerRoute();

  String get location => GoRouteData.$location(
        '/logger',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
