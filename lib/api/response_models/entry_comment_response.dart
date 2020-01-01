import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:owmflutter/api/api.dart';

part 'entry_comment_response.g.dart';

abstract class EntryCommentResponse
    implements Built<EntryCommentResponse, EntryCommentResponseBuilder> {
  factory EntryCommentResponse([updates(EntryCommentResponseBuilder b)]) =
      _$EntryCommentResponse;
  int get id;
  String get date;

  @nullable
  String get body;

  @nullable
  @BuiltValueField(wireName: "user_vote")
  int get userVote;

  @BuiltValueField(wireName: "vote_count")
  int get voteCount;

  AuthorResponse get author;

  @nullable
  EmbedResponse get embed;

  @nullable
  @BuiltValueField(wireName: "violation_url")
  String get violationUrl;

  EntryCommentResponse._();
  static Serializer<EntryCommentResponse> get serializer =>
      _$entryCommentResponseSerializer;
}
