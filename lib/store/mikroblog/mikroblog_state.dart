import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';

import 'package:built_value/serializer.dart';
import 'package:owmflutter/models/models.dart';

part 'mikroblog_state.g.dart';

abstract class MikroblogState implements Built<MikroblogState, MikroblogStateBuilder> {
  BuiltList<Entry> get entries;
  bool get isLoading;
  num get page;

  factory MikroblogState() {
    return _$MikroblogState._(entries: BuiltList(), isLoading: false, page: 1);
  }

  MikroblogState._();
  static Serializer<MikroblogState> get serializer => _$mikroblogStateSerializer;
}
