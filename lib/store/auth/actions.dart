import 'package:owmflutter/store/store.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:owmflutter/api/api.dart';
import 'package:owmflutter/keys.dart';

class SaveAuthCredentialsAction {
  final String login;
  final String avatarUrl;
  SaveAuthCredentialsAction({this.login, this.avatarUrl});
}

ThunkAction<AppState> loginUser(String token, String login) {
  return (Store<AppState> store) async {
    var creds = await api.users.login(login, token);

    // Exit login screen
    OwmKeys.navKey.currentState.pop();

    store.dispatch(SaveAuthCredentialsAction(
        login: creds.login, avatarUrl: creds.avatarUrl));
  };
}

ThunkAction<AppState> syncStateWithApi() {
  return (Store<AppState> store) async {
    await api.ensureSynced();
    var creds = api.credentials;

    if (creds != null) {
      store.dispatch(SaveAuthCredentialsAction(
          login: creds.login, avatarUrl: creds.avatarUrl));
    }
  };
}
