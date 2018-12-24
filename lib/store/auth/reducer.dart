import 'package:redux/redux.dart';
import 'package:owmflutter/store/store.dart';

Reducer<AuthState> authReducer = combineReducers<AuthState>([
  TypedReducer<AuthState, SaveAuthCredentialsAction>(_saveLoginCredentials),
  TypedReducer<AuthState, LogoutUserAction>(_logoutUser)
]);

AuthState _saveLoginCredentials(
    AuthState state, SaveAuthCredentialsAction action) {
  return state.rebuild((b) => b
    ..loggedIn = action.login.isNotEmpty
    ..avatarUrl = action.avatarUrl
    ..login = action.login
    ..backgroundUrl = action.backgroundUrl
    ..color = action.color
    ..avatarUrl = action.avatarUrl);
}

AuthState _logoutUser(AuthState state, LogoutUserAction action) {
  return state.rebuild((b) => b
    ..loggedIn = false
    ..avatarUrl = ""
    ..avatarUrl = "");
}
