import 'dart:async';

import 'package:flutter_starter/src/core/components/rest_client/rest_client.dart';
import 'package:flutter_starter/src/core/utils/preferences_dao.dart';
import 'package:flutter_starter/src/core/utils/token/token.dart';
import 'package:shared_preferences/shared_preferences.dart';

final class TokenStorageSP implements TokenStorage<Token> {
  TokenStorageSP({required SharedPreferences sharedPreferences})
      : _accessToken = TypedEntry(
    sharedPreferences: sharedPreferences,
    key: 'authorization.access_token',
  ),
        _refreshToken = TypedEntry(
          sharedPreferences: sharedPreferences,
          key: 'authorization.refresh_token',
        );

  late final PreferencesEntry<String> _accessToken;
  late final PreferencesEntry<String> _refreshToken;
  final _streamController = StreamController<Token?>.broadcast();

  @override
  Future<Token?> load() async {
    final accessToken = _accessToken.read();

    if (accessToken == null) {
      return null;
    }

    return Token(accessToken: accessToken);
  }

  @override
  Future<void> save(Token tokenPair) async {
    await _accessToken.set(tokenPair.accessToken);

    _streamController.add(tokenPair);
  }

  @override
  Future<void> clear() async {
    await (_accessToken.remove(), _refreshToken.remove()).wait;
    _streamController.add(null);
  }

  @override
  Stream<Token?> getStream() => _streamController.stream;

  @override
  Future<void> close() => _streamController.close();
}