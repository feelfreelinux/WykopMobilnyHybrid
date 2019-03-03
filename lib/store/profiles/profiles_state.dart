import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:owmflutter/store/store.dart';

part 'profiles_state.g.dart';

abstract class ProfilesState implements Built<ProfilesState, ProfilesStateBuilder> {
  BuiltMap<String, ProfileState> get states;

  factory ProfilesState() {
    return _$ProfilesState._(states: BuiltMap<String, ProfileState>());
  }

  ProfilesState._();
  static Serializer<ProfilesState> get serializer => _$profilesStateSerializer;
}

abstract class ProfileState implements Built<ProfileState, ProfileStateBuilder> {
  ItemListState get actionsState;

  factory ProfileState() {
    return _$ProfileState._(
        actionsState: ItemListState());
  }

  ProfileState._();
  static Serializer<ProfileState> get serializer => _$profileStateSerializer;
}
