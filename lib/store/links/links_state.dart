import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:owmflutter/store/store.dart';

part 'links_state.g.dart';

abstract class LinksState implements Built<LinksState, LinksStateBuilder> {
  ItemListState get promotedState;
  ItemListState get favoriteState;

  factory LinksState() {
    return _$LinksState._(
        promotedState: ItemListState(), favoriteState: ItemListState());
  }

  LinksState._();
  static Serializer<LinksState> get serializer => _$linksStateSerializer;
}
