import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';

import 'package:built_value/serializer.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/store/store.dart';

part 'mikroblog_state.g.dart';

abstract class MikroblogState
    implements Built<MikroblogState, MikroblogStateBuilder> {
  BuiltMap<int, Entry> get entries;
  BuiltList<int> get entriesIds;
  ListState get listState;

  factory MikroblogState() {
    return _$MikroblogState._(
        entries: new BuiltMap<int, Entry>(),
        entriesIds: BuiltList.from([]),
        listState: new ListState());
  }

  MikroblogState._();
  static Serializer<MikroblogState> get serializer =>
      _$mikroblogStateSerializer;
}
