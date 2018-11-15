import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';

part 'entry_state.g.dart';
abstract class EntryScreensState
    implements Built<EntryScreensState, EntryScreensStateBuilder> {
  BuiltMap<String, EntryScreenState> get states;

  factory EntryScreensState() {
    return _$EntryScreensState._(states: BuiltMap<String, EntryScreenState>());
  }

  EntryScreensState._();
  static Serializer<EntryScreensState> get serializer => _$entryScreensStateSerializer;
}

abstract class EntryScreenState
    implements Built<EntryScreenState, EntryScreenStateBuilder> {
  List<int> get ids;

  factory EntryScreenState() {
    return _$EntryScreenState._(ids: ([]));
  }

  EntryScreenState._();
  static Serializer<EntryScreenState> get serializer => _$entryScreenStateSerializer;
}
