import 'package:owmflutter/store/store.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:owmflutter/api/api.dart';

class SaveAuthCredentialsAction {
  final String login;
  SaveAuthCredentialsAction({this.login});
}

ThunkAction<AppState> loginUser(String token, String login) {
  return (Store<AppState> store) async {
    
  };
}
