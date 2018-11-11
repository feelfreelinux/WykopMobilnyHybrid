import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';

import 'package:built_value/serializer.dart';
import 'package:owmflutter/models/models.dart';

part 'mikroblog_state.g.dart';

abstract class MikroblogState
    implements Built<MikroblogState, MikroblogStateBuilder> {
  BuiltMap<int, Entry> get entries;
  List<int> get entriesIds;
  bool get isLoading;
  bool get haveReachedEnd;
  num get page;

  factory MikroblogState() {
    return _$MikroblogState._(
        entries: new BuiltMap<int, Entry>(),
        entriesIds: [],
        isLoading: false,
        haveReachedEnd: false,
        page: 1);
  }

  MikroblogState._();
  static Serializer<MikroblogState> get serializer =>
      _$mikroblogStateSerializer;
}
