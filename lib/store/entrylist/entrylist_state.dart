import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';

import 'package:built_value/serializer.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/store/store.dart';

part 'entrylist_state.g.dart';

abstract class EntrylistState
    implements Built<EntrylistState, EntrylistStateBuilder> {
  PaginationState get entriesState;
  ListState get listState;

  factory EntrylistState() {
    return _$EntrylistState._(
        entriesState: PaginationState(), listState: new ListState());
  }

  EntrylistState._();
  static Serializer<EntrylistState> get serializer =>
      _$entrylistStateSerializer;
}
