import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'global_list_state.g.dart';

abstract class GlobalListState implements Built<GlobalListState, GlobalListStateBuilder> {
  bool get showListShadow;
  bool get showInputShadow;

  factory GlobalListState() {
    return _$GlobalListState._(
      showListShadow: false,
      showInputShadow: false,
    );
  }

  GlobalListState._();
  static Serializer<GlobalListState> get serializer => _$globalListStateSerializer;
}
