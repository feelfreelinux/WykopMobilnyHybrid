import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';

import 'package:built_value/serializer.dart';
import 'package:owmflutter/store/store.dart';

part 'mywykop_state.g.dart';

abstract class MyWykopState
    implements Built<MyWykopState, MyWykopStateBuilder> {
  EntrylistState get indexState;

  factory MyWykopState() {
    return _$MyWykopState._(
        indexState: EntrylistState());
  }

  MyWykopState._();
  static Serializer<MyWykopState> get serializer =>
      _$myWykopStateSerializer;
}
