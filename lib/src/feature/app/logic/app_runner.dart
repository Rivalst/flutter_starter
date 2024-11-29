import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_starter/src/core/utils/logger/logger.dart';
import 'package:flutter_starter/src/feature/app/widget/app.dart';
import 'package:flutter_starter/src/feature/initialization/logic/composition_root.dart';
import 'package:flutter_starter/src/feature/initialization/widget/initialization_failed_app.dart';
import 'package:flutter_starter/src/feature/initialization/widget/initialization_process_app.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_observer.dart';

final class AppRunner {
  const AppRunner();

  /// Start the initialization and in case of success run application
  Future<void> initializeAndRun() async {
    final binding = WidgetsFlutterBinding.ensureInitialized();
    // With repaintBoundary
    debugRepaintRainbowEnabled = false;

    binding.deferFirstFrame();

    // await SentryFlutter.init(
    //       (options) {
    //     options.dsn = 'sentry key';
    //   },
    // );
    Bloc.observer = TalkerBlocObserver(talker: Logger.instance);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ));

    /// If you want to allow only portrait mode, you can remove the line below
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    FlutterError.onError =
        (details) => Logger.handle(details.exception, details.stack);
    WidgetsBinding.instance.platformDispatcher.onError =
        Logger.logPlatformDispatcherError;

    const initializationProcessor = CompositionRoot();
    binding.allowFirstFrame();
    Future<void> initializeAndRun() async {
      try {
        final completer = Completer<void>();
        runApp(InitializationProcessApp(onInitializationComplete: () {
          completer.complete();
        }));
        final result = await initializationProcessor.compose();

        await completer.future;

        runApp(App(result: result));
      } catch (e, stackTrace) {
        Logger.error('Initialization failed', e, stackTrace);
        runApp(
          InitializationFailedApp(
            error: e,
            stackTrace: stackTrace,
            retryInitialization: initializeAndRun,
          ),
        );
      }
    }

    await initializeAndRun();
  }
}
