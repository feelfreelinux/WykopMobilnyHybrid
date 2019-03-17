import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:owmflutter/store/store.dart';

part 'item_list_state.g.dart';

abstract class ItemListState
    implements Built<ItemListState, ItemListStateBuilder> {
  PaginationState get paginationState;
  ListState get listState;
  ErrorState get errorState;

  factory ItemListState() {
    return _$ItemListState._(
        paginationState: PaginationState(),
        listState: new ListState(),
        errorState: new ErrorState());
  }

  ItemListState._();
  static Serializer<ItemListState> get serializer => _$itemListStateSerializer;
}
