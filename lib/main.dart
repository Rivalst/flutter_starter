import 'dart:async';

import 'package:flutter_starter/src/core/utils/logger/logger.dart';
import 'package:flutter_starter/src/feature/app/logic/app_runner.dart';

void main() => runZonedGuarded(
      () => const AppRunner().initializeAndRun(),
      Logger.handle,
    );
