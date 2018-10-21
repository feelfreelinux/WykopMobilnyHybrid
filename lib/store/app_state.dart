import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';

import 'package:built_value/serializer.dart';
import 'package:owmflutter/api/api.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  BuiltList<EntryResponse> get entries;

  factory AppState() {
    return _$AppState._(entries: BuiltList());
  }

  AppState._();
  static Serializer<AppState> get serializer => _$appStateSerializer;
}
