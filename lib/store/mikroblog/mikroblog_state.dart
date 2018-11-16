import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';

import 'package:built_value/serializer.dart';
import 'package:owmflutter/store/store.dart';

part 'mikroblog_state.g.dart';

abstract class MikroblogState implements Built<MikroblogState, MikroblogStateBuilder> {
  EntrylistState get hot12State;
  EntrylistState get hot24State;
  EntrylistState get hot6State;
  EntrylistState get activeState;
  EntrylistState get newestState;


  factory MikroblogState() {
    return _$MikroblogState._(
      hot12State: EntrylistState(),
      hot6State: EntrylistState(),
      hot24State: EntrylistState(),
      newestState: EntrylistState(),
      activeState: EntrylistState());
  }

  MikroblogState._();
  static Serializer<MikroblogState> get serializer => _$mikroblogStateSerializer;
}
