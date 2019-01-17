import 'package:owmflutter/store/store.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:owmflutter/api/api.dart';
import 'dart:async';

class SaveAuthCredentialsAction {
  final String login;
  final String avatarUrl;
  final int color;
  final String backgroundUrl;
  SaveAuthCredentialsAction({this.login, this.avatarUrl, this.color, this.backgroundUrl});
}

class LogoutUserAction {
  LogoutUserAction();
}

ThunkAction<AppState> loginUser(String token, String login, Completer completer) {
  return (Store<AppState> store) async {
    var creds = await api.users.login(login, token);

    store.dispatch(SaveAuthCredentialsAction(
        login: creds.login, avatarUrl: creds.avatarUrl, color: creds.color, backgroundUrl: creds.backgroundUrl));
  };
}

ThunkAction<AppState> logoutUser() {
  return (Store<AppState> store) async {
    await api.logoutUser();
    store.dispatch(LogoutUserAction());
  };
}

ThunkAction<AppState> syncStateWithApi() {
  return (Store<AppState> store) async {
    await api.ensureSynced();
    var creds = api.credentials;

    if (creds != null) {
      store.dispatch(SaveAuthCredentialsAction(
          login: creds.login, avatarUrl: creds.avatarUrl, backgroundUrl: creds.backgroundUrl, color: creds.color));
    }
  };
}
