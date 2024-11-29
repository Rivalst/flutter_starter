import 'dart:io';

import 'package:flutter_starter/src/core/constant/variable/variable.dart';
import 'package:share_plus/share_plus.dart';

Future<void> shareAction() async {
  await Share.share(
    'Discover the appname app —. Download now: ${Platform.isAndroid ? googlePlayLink : appleStoreLink}',
    subject: 'appname App',
  );
}
