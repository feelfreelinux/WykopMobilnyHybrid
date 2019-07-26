import 'package:flutter/foundation.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/api/api.dart';

class AuthStateModel extends ChangeNotifier {
  String _login;
  String _avatarUrl;
  int _color;
  String _backgroundUrl;

  String get login => _login;
  String get avatarUrl => _avatarUrl;
  int get color => _color;
  String get backgroundUrl => _backgroundUrl;
  bool get loggedIn => _login != null;

  AuthStateModel() {
    syncStateWithApi();
  }

  Future<void> loginUser(String token, String login) async {
    var creds = await api.users.login(login, token);
    _login = creds.login;
    _avatarUrl = creds.avatarUrl;
    _color = creds.color;
    _backgroundUrl = creds.backgroundUrl;
    notifyListeners();
  }

  Future<void> logoutUser() async {
    await api.logoutUser();
    _login = null;
    _avatarUrl = null;
    _color = null;
    _backgroundUrl = "";
    notifyListeners();
  }

  Future<void> syncStateWithApi() async {
    await api.ensureSynced();
    var creds = api.credentials;

    if (creds != null) {
      _login = creds.login;
      _avatarUrl = creds.avatarUrl;
      _color = creds.color;
      _backgroundUrl = creds.backgroundUrl ?? "";
    }
    notifyListeners();
  }
}
