import 'dart:async';

import 'package:flutter_starter/src/core/utils/enums.dart';

abstract base class WebSocketBase {
  Future<void> connection();

  Future<void> close();

  Future<void> reconnect();

  Future<void> connectionToChannel({required SocketChannel channel});

  Future<void> closeConnectionToChannel({required SocketChannel channel});

  Stream<bool> get connectionStream;

  Stream<T> getEventData<T>({
    required SocketEventValue socketEvent,
  });
}
