import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:owmflutter/api/api.dart';

part 'entry_response.g.dart';

abstract class EntryResponse
    implements Built<EntryResponse, EntryResponseBuilder> {
  factory EntryResponse([updates(EntryResponseBuilder b)]) = _$EntryResponse;
  num get id;
  String get date;

  @nullable
  String get body;

  @BuiltValueField(wireName: "vote_count")
  num get voteCount;

  @BuiltValueField(wireName: "comments_count")
  num get commentsCount;

  AuthorResponse get author;

  @nullable
  EmbedResponse get embed;

  EntryResponse._();
  static Serializer<EntryResponse> get serializer => _$entryResponseSerializer;
}


