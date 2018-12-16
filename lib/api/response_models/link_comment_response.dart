import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:owmflutter/api/api.dart';

part 'link_comment_response.g.dart';

abstract class LinkCommentResponse
    implements Built<LinkCommentResponse, LinkCommentResponseBuilder> {
  factory LinkCommentResponse([updates(LinkCommentResponseBuilder b)]) =
      _$LinkCommentResponse;
  int get id;
  String get date;

  @nullable
  String get body;

  @nullable
  @BuiltValueField(wireName: "user_vote")
  int get userVote;

  @BuiltValueField(wireName: "vote_count")
  int get voteCount;

  @BuiltValueField(wireName: "vote_count_plus")
  int get voteCountPlus;

  @BuiltValueField(wireName: "parent_id")
  int get parentId;

  @BuiltValueField(wireName: "blocked")
  bool get isBlocked;

  AuthorResponse get author;

  @nullable
  EmbedResponse get embed;

  LinkCommentResponse._();
  static Serializer<LinkCommentResponse> get serializer =>
      _$linkCommentResponseSerializer;
}
