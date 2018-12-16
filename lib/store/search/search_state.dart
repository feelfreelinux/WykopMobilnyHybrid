import 'package:built_value/built_value.dart';

import 'package:built_value/serializer.dart';
import 'package:owmflutter/store/store.dart';

part 'search_state.g.dart';

abstract class SearchState
    implements Built<SearchState, SearchStateBuilder> {
  ItemListState get entriesSearchState;
  ItemListState get linksSearchState;

  factory SearchState() {
    return _$SearchState._(
        entriesSearchState: ItemListState(),
        linksSearchState: ItemListState());
  }

  SearchState._();
  static Serializer<SearchState> get serializer =>
      _$searchStateSerializer;
}
