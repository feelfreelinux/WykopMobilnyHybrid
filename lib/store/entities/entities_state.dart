import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';

import 'package:built_value/serializer.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/store/store.dart';

part 'entities_state.g.dart';

abstract class EntitiesState
    implements Built<EntitiesState, EntitiesStateBuilder> {
  BuiltMap<int, Entry> get entries;
  BuiltMap<int, EntryComment> get entryComments;

  factory EntitiesState() {
    return _$EntitiesState._(
        entries: new BuiltMap<int, Entry>(),
        entryComments: new BuiltMap<int, EntryComment>());
  }

  EntitiesState._();
  static Serializer<EntitiesState> get serializer => _$entitiesStateSerializer;
}
