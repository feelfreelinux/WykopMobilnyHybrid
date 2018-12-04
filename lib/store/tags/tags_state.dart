import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:owmflutter/store/store.dart';

part 'tags_state.g.dart';

abstract class TagsState implements Built<TagsState, TagsStateBuilder> {
  BuiltMap<String, TagState> get states;

  factory TagsState() {
    return _$TagsState._(states: BuiltMap<String, TagState>());
  }

  TagsState._();
  static Serializer<TagsState> get serializer => _$tagsStateSerializer;
}

abstract class TagState implements Built<TagState, TagStateBuilder> {
  EntrylistState get indexState;
  EntrylistState get entriesState;
  EntrylistState get linksState;

  factory TagState() {
    return _$TagState._(
        indexState: EntrylistState(),
        entriesState: EntrylistState(),
        linksState: EntrylistState());
  }

  TagState._();
  static Serializer<TagState> get serializer => _$tagStateSerializer;
}
