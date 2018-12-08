import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';

import 'package:built_value/serializer.dart';
import 'package:owmflutter/store/store.dart';

part 'notifications_state.g.dart';

abstract class NotificationsState
    implements Built<NotificationsState, NotificationsStateBuilder> {
  ItemListState get hashTagsState;
  ItemListState get notificationsState;

  factory NotificationsState() {
    return _$NotificationsState._(hashTagsState: ItemListState(), notificationsState: ItemListState());
  }

  NotificationsState._();
  static Serializer<NotificationsState> get serializer => _$notificationsStateSerializer;
}
