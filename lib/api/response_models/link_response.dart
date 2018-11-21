import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:owmflutter/api/api.dart';
import 'package:built_collection/built_collection.dart';

part 'link_response.g.dart';

abstract class LinkResponse
    implements Built<LinkResponse, LinkResponseBuilder> {
  factory LinkResponse([updates(LinkResponseBuilder b)]) = _$LinkResponse;
  int get id;
  String get date;

  String get title;

  String get description;

  String get tags;

  @BuiltValueField(wireName: "source_url")
  String get sourceUrl;

  @BuiltValueField(wireName: "vote_count")
  int get voteCount;

  @BuiltValueField(wireName: "comments_count")
  int get commentsCount;

  @BuiltValueField(wireName: "related_count")
  int get relatedCount;

  AuthorResponse get author;

  @nullable
  String get preview;

  @BuiltValueField(wireName: "is_hot")
  bool get isHot;

  @BuiltValueField(wireName: "can_vote")
  bool get canVote;

  LinkResponse._();
  static Serializer<LinkResponse> get serializer => _$linkResponseSerializer;
}
