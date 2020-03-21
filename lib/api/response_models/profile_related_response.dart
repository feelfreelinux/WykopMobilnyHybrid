import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:owmflutter/api/api.dart';

part 'profile_related_response.g.dart';

abstract class ProfileRelatedResponse
    implements Built<ProfileRelatedResponse, ProfileRelatedResponseBuilder> {
  factory ProfileRelatedResponse([updates(ProfileRelatedResponseBuilder b)]) =
      _$ProfileRelatedResponse;
  int get id;
  String get url;
  String get title;
  
  @BuiltValueField(wireName: "vote_count")
  int get voteCount;


  ProfileRelatedResponse._();
  static Serializer<ProfileRelatedResponse> get serializer =>
      _$profileRelatedResponseSerializer;
}
