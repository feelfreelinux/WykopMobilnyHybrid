import 'package:owmflutter/api/api.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:owmflutter/store/store.dart';
import 'package:redux/redux.dart';
import 'dart:async';

ThunkAction<AppState> loadProfileActions(
    String profile, bool refresh, Completer completer) {
  return (Store<AppState> store) async {
    store.dispatch(loadItems(
        PROFILE_ACTIONS_PREFIX + profile,
        false,
        (page) => api.profiles.getActions(profile),
        store.state.profilesState.states[profile] == null
            ? ListState()
            : store.state.profilesState.states[profile].actionsState.listState,
        completer));
  };
}
