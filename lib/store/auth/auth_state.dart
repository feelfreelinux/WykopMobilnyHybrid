import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';

part 'auth_state.g.dart';

abstract class AuthState implements Built<AuthState, AuthStateBuilder> {
  String get token;
  String get login;
  String get avatarUrl;
  String get accountKey;
  bool get loggedIn;

  factory AuthState() {
    return _$AuthState._(
        token: "", login: "", avatarUrl: "", loggedIn: false, accountKey: "");
  }

  AuthState._();
  static Serializer<AuthState> get serializer => _$authStateSerializer;
}
