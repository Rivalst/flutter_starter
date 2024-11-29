class TimeFormatter {
  static String formatIntToTimerTime(int time) {
    final minutes = time ~/ 60;
    final seconds = time % 60;
    final minutesStr = minutes < 10 ? '0$minutes' : '$minutes';
    final secondsStr = seconds < 10 ? '0$seconds' : '$seconds';
    return '$minutesStr:$secondsStr';
  }
}