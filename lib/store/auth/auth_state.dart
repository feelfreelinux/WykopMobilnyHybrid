import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'auth_state.g.dart';

abstract class AuthState implements Built<AuthState, AuthStateBuilder> {
  String get token;
  String get login;
  String get avatarUrl;
  String get accountKey;
  int get color;
  String get backgroundUrl;
  bool get loggedIn;

  factory AuthState() {
    return _$AuthState._(
        token: "", login: "", avatarUrl: "", loggedIn: false, accountKey: "", backgroundUrl: "", color: 0);
  }

  AuthState._();
  static Serializer<AuthState> get serializer => _$authStateSerializer;
}
