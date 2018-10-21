import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

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

  EntryAuthor get author;

  @nullable
  EntryEmbed get embed;

  EntryResponse._();
  static Serializer<EntryResponse> get serializer => _$entryResponseSerializer;
}

abstract class EntryAuthor implements Built<EntryAuthor, EntryAuthorBuilder> {
  factory EntryAuthor([updates(EntryAuthorBuilder b)]) = _$EntryAuthor;
  num get color;
  String get avatar;
  String get login;

  EntryAuthor._();
  static Serializer<EntryAuthor> get serializer => _$entryAuthorSerializer;
}

abstract class EntryEmbed implements Built<EntryEmbed, EntryEmbedBuilder> {
  factory EntryEmbed([updates(EntryEmbedBuilder b)]) = _$EntryEmbed;
  String get url;
  String get preview;

  EntryEmbed._();
  static Serializer<EntryEmbed> get serializer => _$entryEmbedSerializer;
}
