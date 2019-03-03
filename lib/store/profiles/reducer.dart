import 'package:owmflutter/store/store.dart';

/*
  Reducer that directs actions of all profile screens into their reducers.
**/
ProfilesState profilesReducer(ProfilesState state, action) {
  if (action is TypedAction && action.type.startsWith("PROFILE_")) {
    print(action.type);
    var profile = action.type.split('_')[2];
    print(profile);
    var newState =
        state.rebuild((b) => b..states.putIfAbsent(profile, () => ProfileState()));
    return newState.rebuild((e) => e
      ..states.updateValue(
          profile,
          (tagState) => tagState.rebuild(
                (k) => k
                  ..actionsState.replace(itemListReducer(PROFILE_ACTIONS_PREFIX + profile,
                      newState.states[profile].actionsState, action))
              )));
  } else {
    return state;
  }
}
