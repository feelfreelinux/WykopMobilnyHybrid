import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';

import 'package:built_value/serializer.dart';
import 'package:owmflutter/store/store.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  EntitiesState get entitiesState;
  MikroblogState get hot12State;
  MikroblogState get hot24State;
  MikroblogState get hot6State;
  MikroblogState get activeState;
  MikroblogState get newest;

  EntryScreensState get entryScreensState;

  factory AppState() {
    return _$AppState._(
      hot12State: MikroblogState(),
      hot6State: MikroblogState(),
      hot24State: MikroblogState(),
      entitiesState: EntitiesState(),
      newest: MikroblogState(),
      activeState: MikroblogState(),
      entryScreensState: EntryScreensState());
  }

  AppState._();
  static Serializer<AppState> get serializer => _$appStateSerializer;
}
