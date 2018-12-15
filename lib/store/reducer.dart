import 'package:redux/redux.dart';
import 'package:owmflutter/store/store.dart';
import 'package:owmflutter/models/models.dart';
import 'package:built_collection/built_collection.dart';

AppState appReducer(AppState state, action) {
  return state.rebuild((b) => b
    ..entitiesState.replace(entitiesReducer(state.entitiesState, action))
    ..authState.replace(authReducer(state.authState, action))
    ..entryScreensState
        .replace(entryScreenReducer(state.entryScreensState, action))
    ..linksState.replace(linksReducer(state.linksState, action))
    ..myWykopState.replace(myWykopReducer(state.myWykopState, action))
    ..tagsState.replace(tagReducer(state.tagsState, action))
    ..notificationsState.replace(notificationsReducer(state.notificationsState, action))
    ..searchState.replace(searchReducer(state.searchState, action))
    ..linkScreensState.replace(linkScreenReducer(state.linkScreensState, action))
    ..mikroblogState.replace(mikroblogReducer(state.mikroblogState, action)));
}
