import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';

import 'package:built_value/serializer.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/store/store.dart';

part 'links_list_state.g.dart';

abstract class LinksListState
    implements Built<LinksListState, LinksListStateBuilder> {
  PaginationState get itemsState;
  ListState get listState;

  factory LinksListState() {
    return _$LinksListState._(
        itemsState: PaginationState(), listState: new ListState());
  }

  LinksListState._();
  static Serializer<LinksListState> get serializer =>
      _$linksListStateSerializer;
}
