import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'error_state.g.dart';

abstract class ErrorState implements Built<ErrorState, ErrorStateBuilder> {
  @nullable
  Exception get exception;
  bool get isDismissed;

  factory ErrorState() {
    return _$ErrorState._(exception: null, isDismissed: true);
  }

  ErrorState._();
  static Serializer<ErrorState> get serializer => _$errorStateSerializer;
}
