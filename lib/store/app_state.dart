import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:owmflutter/store/store.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  AuthState get authState;
  ThemeState get themeState;
  EntitiesState get entitiesState;

  SearchState get searchState;
  SuggestionsState get suggestionsState;

  LinksState get linksState;
  MyWykopState get myWykopState;
  NotificationsState get notificationsState;
  MikroblogState get mikroblogState;
  EntryScreensState get entryScreensState;
  LinkScreensState get linkScreensState;
  TagsState get tagsState;
  ProfilesState get profilesState;

  factory AppState() {
    return _$AppState._(
        authState: AuthState(),
        linksState: LinksState(),
        searchState: SearchState(),
        themeState: ThemeState(),
        suggestionsState: SuggestionsState(),
        mikroblogState: MikroblogState(),
        myWykopState: MyWykopState(),
        tagsState: TagsState(),
        profilesState: ProfilesState(),
        notificationsState: NotificationsState(),
        entitiesState: EntitiesState(),
        linkScreensState: LinkScreensState(),
        entryScreensState: EntryScreensState());
  }

  AppState._();
  static Serializer<AppState> get serializer => _$appStateSerializer;
}
