import 'package:flutter_starter/src/feature/settings/bloc/settings_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

base class Dependencies {
  const Dependencies({
    required this.settingsBloc,
    required this.sharedPreferences,
    // required this.connectionCheckerCubit,
  });

  final SettingsBloc settingsBloc;

  // final ConnectionCheckerCubit connectionCheckerCubit;
  final SharedPreferences sharedPreferences;
}

final class CompositionResult {
  const CompositionResult({
    required this.dependencies,
    required this.msSpent,
  });

  final Dependencies dependencies;

  final int msSpent;

  @override
  String toString() => '$CompositionResult('
      'dependencies: $dependencies, '
      'msSpent: $msSpent'
      ')';
}
