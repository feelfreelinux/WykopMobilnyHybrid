import 'package:owmflutter/store/store.dart';

AppState appReducer(AppState state, action) {
  return state.rebuild((b) => b
    ..entitiesState.replace(entitiesReducer(state.entitiesState, action))
    ..authState.replace(authReducer(state.authState, action))
    ..entryScreensState
        .replace(entryScreenReducer(state.entryScreensState, action))
    ..linksState.replace(linksReducer(state.linksState, action))
    ..myWykopState.replace(myWykopReducer(state.myWykopState, action))
    ..tagsState.replace(tagReducer(state.tagsState, action))
    ..themeState.replace(themeReducer(state.themeState, action))
    ..notificationsState
        .replace(notificationsReducer(state.notificationsState, action))
    ..searchState.replace(searchReducer(state.searchState, action))
    ..suggestionsState
        .replace(suggestionsReducer(state.suggestionsState, action))
    ..errorState.replace(errorReducer(state.errorState, action))
    ..linkScreensState
        .replace(linkScreenReducer(state.linkScreensState, action))
    ..mikroblogState.replace(mikroblogReducer(state.mikroblogState, action)));
}
