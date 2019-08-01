import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:owmflutter/api/api.dart';

part 'voter_response.g.dart';

abstract class VoterResponse
    implements Built<VoterResponse, VoterResponseBuilder> {
  factory VoterResponse([updates(VoterResponseBuilder b)]) =
      _$VoterResponse;
  AuthorResponse get author;
  String get date;
  int get voteType;

  VoterResponse._();
  static Serializer<VoterResponse> get serializer =>
      _$voterResponseSerializer;
}
