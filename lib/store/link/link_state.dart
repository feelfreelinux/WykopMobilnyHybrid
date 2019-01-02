import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:owmflutter/store/store.dart';
import 'package:built_collection/built_collection.dart';

part 'link_state.g.dart';

abstract class LinkScreensState
    implements Built<LinkScreensState, LinkScreensStateBuilder> {
  BuiltMap<String, LinkScreenState> get states;

  factory LinkScreensState() {
    return _$LinkScreensState._(states: BuiltMap<String, LinkScreenState>());
  }

  LinkScreensState._();
  static Serializer<LinkScreensState> get serializer =>
      _$linkScreensStateSerializer;
}

abstract class LinkScreenState
    implements Built<LinkScreenState, LinkScreenStateBuilder> {
  List<int> get ids;
  ErrorState get errorState;

  factory LinkScreenState() {
    return _$LinkScreenState._(ids: ([]), errorState: ErrorState());
  }

  LinkScreenState._();
  static Serializer<LinkScreenState> get serializer =>
      _$linkScreenStateSerializer;
}
