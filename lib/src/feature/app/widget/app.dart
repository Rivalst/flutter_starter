import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/src/feature/app/widget/material_context.dart';
import 'package:flutter_starter/src/feature/initialization/model/dependencies.dart';
import 'package:flutter_starter/src/feature/initialization/widget/dependencies_scope.dart';
import 'package:flutter_starter/src/feature/settings/widget/settings_scope.dart';

class App extends StatelessWidget {
  const App({required this.result, super.key});

  /// The result from the [CompositionRoot].
  final CompositionResult result;

  @override
  Widget build(BuildContext context) => DependenciesScope(
        dependencies: result.dependencies,
        child: MultiBlocProvider(
          providers: [
            /// Example of provide a socket bloc. But prefet using scope for this
            // BlocProvider<SocketBloc>(
            //   create: (context) => SocketBloc(
            //     webSocketRepository:
            //     DependenciesScope.of(context).webSocketRepository,
            //   ),
            // ),
          ],
          child: SettingsScope(
            settingsBloc: result.dependencies.settingsBloc,
            child: const MaterialContext(),
          ),

          /// Example of provide a AuthScope for real app
          // child: SettingsScope(
          //   settingsBloc: result.dependencies.settingsBloc,
          //   child: const ConnectionScope(
          //     child: AuthScope(
          //       child: AppEvent(
          //         child: MaterialContext(),
          //       ),
          //     ),
          //   ),
          // ),
        ),
      );
}
