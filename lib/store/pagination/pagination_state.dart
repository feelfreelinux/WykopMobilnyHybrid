import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';

part 'pagination_state.g.dart';

abstract class PaginationState
    implements Built<PaginationState, PaginationStateBuilder> {
  BuiltList<int> get itemIds;

  factory PaginationState() {
    return _$PaginationState._(itemIds: BuiltList.from([]));
  }

  PaginationState._();
  static Serializer<PaginationState> get serializer =>
      _$paginationStateSerializer;
}
