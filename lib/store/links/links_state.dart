import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';

import 'package:built_value/serializer.dart';
import 'package:owmflutter/store/store.dart';

part 'links_state.g.dart';

abstract class LinksState implements Built<LinksState, LinksStateBuilder> {
  LinksListState get promotedState;

  factory LinksState() {
    return _$LinksState._(promotedState: LinksListState());
  }

  LinksState._();
  static Serializer<LinksState> get serializer => _$linksStateSerializer;
}
