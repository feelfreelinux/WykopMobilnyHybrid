import 'package:built_value/built_value.dart';

import 'package:built_value/serializer.dart';
import 'package:owmflutter/store/store.dart';

part 'mikroblog_state.g.dart';

abstract class MikroblogState
    implements Built<MikroblogState, MikroblogStateBuilder> {
  ItemListState get hot12State;
  ItemListState get hot24State;
  ItemListState get hot6State;
  ItemListState get activeState;
  ItemListState get newestState;

  factory MikroblogState() {
    return _$MikroblogState._(
        hot12State: ItemListState(),
        hot6State: ItemListState(),
        hot24State: ItemListState(),
        newestState: ItemListState(),
        activeState: ItemListState());
  }

  MikroblogState._();
  static Serializer<MikroblogState> get serializer =>
      _$mikroblogStateSerializer;
}
