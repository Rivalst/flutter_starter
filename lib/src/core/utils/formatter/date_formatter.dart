import 'package:flutter/material.dart';
import 'package:flutter_starter/src/core/constant/localization/localization.dart';

class DateFormatter {
  //TODO: How remove context from this method?
  static String formatDurationToDateLocale(Duration duration, BuildContext context) {
    final days = duration.inDays;
    final hours = duration.inHours % 24;
    final minutes = duration.inMinutes % 60;

    final parts = <String>[];
    if (days > 0) parts.add(Localization.of(context).days(days));
    if (hours > 0) parts.add(Localization.of(context).hours(hours));
    if (minutes > 0) parts.add(Localization.of(context).minutes(minutes));

    return parts.join(' ');
  }
}