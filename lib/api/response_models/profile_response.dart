import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:owmflutter/api/api.dart';

part 'profile_response.g.dart';

abstract class ProfileResponse
    implements Built<ProfileResponse, ProfileResponseBuilder> {
  factory ProfileResponse([updates(ProfileResponseBuilder b)]) =
      _$ProfileResponse;
  String get login;
  @BuiltValueField(wireName: "color")
  int get color;

  @nullable
  String get sex;

  @BuiltValueField(wireName: "signup_at")
  String get signupAt;

  @nullable
  @BuiltValueField(wireName: "is_blocked")
  bool get isBlocked;

  int get followers;
  
  @nullable
  @BuiltValueField(wireName: "is_observed")
  bool get isObserved;
  
  @nullable
  @BuiltValueField(wireName: "background")
  String get background;
  
  @BuiltValueField(wireName: "links_added_count")
  int get linksAddedCount;

  @BuiltValueField(wireName: "links_published_count")
  int get linksPublishedCount;

  @BuiltValueField(wireName: "avatar")
  String get avatarUrl;
  
  int get rank;
  
  @nullable
  String get about;
    
  @nullable
  @BuiltValueField(wireName: "violation_url")
  String get violationUrl;

  ProfileResponse._();
  static Serializer<ProfileResponse> get serializer =>
      _$profileResponseSerializer;
}
