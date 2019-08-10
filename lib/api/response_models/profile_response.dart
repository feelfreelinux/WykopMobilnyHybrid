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

  @BuiltValueField(wireName: "sex")
  String get voteCount;

  @BuiltValueField(wireName: "signup_at")
  String get signupAt;

  @BuiltValueField(wireName: "is_blocked")
  bool get isBlocked;
  
  @BuiltValueField(wireName: "is_observed")
  bool get isObserved;
  
  @BuiltValueField(wireName: "background")
  String get background;
  
  @BuiltValueField(wireName: "links_added_count")
  int get linksAddedCount;

  @BuiltValueField(wireName: "links_published_count")
  int get linksPublishedCount;
  
  int get rank;
  
  String get about;
  
  @BuiltValueField(wireName: "violation_url")
  String get violationUrl;

  ProfileResponse._();
  static Serializer<ProfileResponse> get serializer =>
      _$profileResponseSerializer;
}
