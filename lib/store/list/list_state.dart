import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'list_state.g.dart';

abstract class ListState implements Built<ListState, ListStateBuilder> {
  bool get isLoading;
  bool get haveReachedEnd;
  num get page;

  factory ListState() {
    return _$ListState._(isLoading: false, haveReachedEnd: false, page: 1);
  }

  ListState._();
  static Serializer<ListState> get serializer => _$listStateSerializer;
}
