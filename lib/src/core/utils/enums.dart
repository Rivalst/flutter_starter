enum DeviceScreenType { mobile, tablet, desktop }

enum SocketChannel {
  noChanel(rawValue: "No channel");

  const SocketChannel({
    required this.rawValue,
  });

  final String rawValue;
}

enum SocketEventValue {
  unknownEvent(rawValue: "unknown event");

  const SocketEventValue({
    required this.rawValue,
  });

  final String rawValue;
}
