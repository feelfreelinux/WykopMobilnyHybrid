import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:owmflutter/api/api.dart';

part 'link_response.g.dart';

abstract class LinkResponse
    implements Built<LinkResponse, LinkResponseBuilder> {
  factory LinkResponse([updates(LinkResponseBuilder b)]) = _$LinkResponse;
  int get id;
  String get date;

  String get title;

  @nullable
  String get description;

  String get tags;

  @nullable
  @BuiltValueField(wireName: "user_favorite")
  bool get favorite;

  @nullable
  @BuiltValueField(wireName: "user_vote")
  String get userVote;

  @BuiltValueField(wireName: "source_url")
  String get sourceUrl;

  @BuiltValueField(wireName: "vote_count")
  int get voteCount;

  @BuiltValueField(wireName: "comments_count")
  int get commentsCount;

  @BuiltValueField(wireName: "related_count")
  int get relatedCount;

  @BuiltValueField(wireName: "bury_count")
  int get buryCount;

  AuthorResponse get author;

  @nullable
  String get preview;

  @BuiltValueField(wireName: "is_hot")
  bool get isHot;

  @BuiltValueField(wireName: "can_vote")
  bool get canVote;

  @nullable
  @BuiltValueField(wireName: "violation_url")
  String get violationUrl;

  @nullable
  String get app;

  LinkResponse._();
  static Serializer<LinkResponse> get serializer => _$linkResponseSerializer;
}
