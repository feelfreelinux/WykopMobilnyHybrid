import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:owmflutter/api/api.dart';
import 'package:built_collection/built_collection.dart';

part 'entry_response.g.dart';

abstract class EntryResponse
    implements Built<EntryResponse, EntryResponseBuilder> {
  factory EntryResponse([updates(EntryResponseBuilder b)]) = _$EntryResponse;
  int get id;
  String get date;

  @nullable
  @BuiltValueField(wireName: "user_vote")
  int get userVote;

  @nullable
  BuiltList<EntryCommentResponse> get comments;

  @nullable
  String get body;

  @nullable
  bool get favorite;

  @BuiltValueField(wireName: "vote_count")
  int get voteCount;

  @BuiltValueField(wireName: "comments_count")
  @nullable
  int get commentsCount;

  AuthorResponse get author;

  @nullable
  EmbedResponse get embed;

  EntryResponse._();
  static Serializer<EntryResponse> get serializer => _$entryResponseSerializer;
}
