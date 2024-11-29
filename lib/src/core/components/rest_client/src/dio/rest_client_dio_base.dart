import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_starter/src/core/components/rest_client/rest_client.dart';
import 'package:flutter_starter/src/core/utils/logger/logger.dart';
import 'package:flutter_starter/src/core/utils/token/token.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

class RestClientDioBase {
  //Host for API requests to dev server
  static const baseUrl = 'https://$host/api';

  static const host = 'somehost';


  RestClientDioBase({
    required TokenStorage tokenStorage,
  }) : _tokenStorage = tokenStorage {
    _dio = Dio(_options())
      ..interceptors.addAll([dioLogger, wrapper()])
      ..options;
  }

  final TokenStorage _tokenStorage;

  late final Dio _dio;

  Dio get dio => _dio;

  String? _token;

  set token(String? value) {
    _token = value;
    if (_token != null) _tokenStorage.save(Token(accessToken: _token!));

    if (value != null && value.isNotEmpty) {
      _dio.options = _changeTokenInOptions(_token!);
    } else {
      _dio.options.headers.remove(HttpHeaders.authorizationHeader);
    }
  }

  BaseOptions _changeTokenInOptions(String newToken) {
    return _dio.options.copyWith(
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer $newToken',
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.contentTypeHeader: 'application/json',
      },
    );
  }

  final dioLogger = TalkerDioLogger(
    talker: Logger.instance,
    settings: const TalkerDioLoggerSettings(
      printResponseHeaders: true,
      printRequestHeaders: true,
    ),
  );

  BaseOptions _options() => BaseOptions(
        baseUrl: baseUrl,
        headers: {
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.contentTypeHeader: 'application/json',
        },
        connectTimeout: const Duration(seconds: 16),
        receiveTimeout: const Duration(seconds: 16),
        sendTimeout: const Duration(seconds: 16),
      );

  QueuedInterceptorsWrapper wrapper() => QueuedInterceptorsWrapper(
        onRequest: (options, handler) {
          return handler.next(options);
        },
        onResponse: (response, handler) async {
          return handler.next(response);
        },
        onError: (error, handler) async {
          return handler.next(error);
        },
      );
}
