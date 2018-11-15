import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';

part 'entries_state.g.dart';

abstract class EntriesState
    implements Built<EntriesState, EntriesStateBuilder> {
  BuiltList<int> get entryIds;

  factory EntriesState() {
    return _$EntriesState._(entryIds: BuiltList.from([]));
  }

  EntriesState._();
  static Serializer<EntriesState> get serializer => _$entriesStateSerializer;
}
