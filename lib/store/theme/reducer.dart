import 'package:owmflutter/models/models.dart';
import 'package:redux/redux.dart';
import 'package:built_collection/built_collection.dart';
import 'package:owmflutter/store/store.dart';

Reducer<ThemeState> themeReducer = combineReducers<ThemeState>(
    [TypedReducer<ThemeState, SetThemeAction>(_setTheme)]);

ThemeState _setTheme(ThemeState state, SetThemeAction action) {
  return state.rebuild((b) => b..currentTheme = action.theme);
}
