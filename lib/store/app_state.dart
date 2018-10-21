import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';

import 'package:built_value/serializer.dart';
import 'package:owmflutter/models/models.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  BuiltList<Entry> get entries;

  factory AppState() {
    return _$AppState._(entries: BuiltList());
  }

  AppState._();
  static Serializer<AppState> get serializer => _$appStateSerializer;
}
