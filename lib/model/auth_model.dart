import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/api/api.dart';

class AuthStateModel extends ChangeNotifier {
  String _login;
  String _avatarUrl;
  int _color;
  String _backgroundUrl;
  bool _loggedIn = false;
  Completer _syncCompleter = Completer();

  String get login => _login;
  String get avatarUrl => _avatarUrl;
  int get color => _color;
  String get backgroundUrl => _backgroundUrl;
  bool get loggedIn => _loggedIn && _color != null;

  Completer get syncCompleter => _syncCompleter;

  AuthStateModel() {
    syncStateWithApi().then((e) => _syncCompleter.complete());
  }

  Future<void> loginUser(String login, String token) async {
    var creds = await api.users.login(login, token);
    _login = creds.login;
    _avatarUrl = creds.avatarUrl;
    _color = creds.color;
    _loggedIn = creds.login.isNotEmpty;
    _backgroundUrl = creds.backgroundUrl;
    notifyListeners();
  }

  Future<void> logoutUser() async {
    await api.logoutUser();
    _avatarUrl = "";
    _backgroundUrl = "";
    _loggedIn = false;
    notifyListeners();
  }

  Future<void> syncStateWithApi() async {
    await api.ensureSynced();
    var creds = api.credentials;

    if (creds != null && creds.login != null) {
      _login = creds.login;
      _avatarUrl = creds.avatarUrl;
      _loggedIn = creds.login.isNotEmpty;
      _color = creds.color;
      _backgroundUrl = creds.backgroundUrl ?? "";
    }
    notifyListeners();
  }
}
