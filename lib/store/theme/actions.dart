import 'package:owmflutter/store/store.dart';
import 'package:owmflutter/api/api.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:owmflutter/store/store.dart';
import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class SetThemeAction {
  OWMTheme theme;
  SetThemeAction({this.theme});
}

ThunkAction<AppState> ensureTheme() {
  return (Store<AppState> store) async {
    var theme = (await SharedPreferences.getInstance()).getString("theme");
    store.dispatch(SetThemeAction(
        theme: theme == "light" ? OWMTheme.LIGHT_THEME : OWMTheme.DARK_THEME));
  };
}

ThunkAction<AppState> setTheme(OWMTheme theme) {
  return (Store<AppState> store) async {
    String themeName = theme == OWMTheme.LIGHT_THEME ? "light" : "dark";
    (await SharedPreferences.getInstance()).setString("theme", themeName);
    store.dispatch(SetThemeAction(theme: theme));
  };
}
