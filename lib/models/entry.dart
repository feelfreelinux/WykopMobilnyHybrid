import 'package:built_value/built_value.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/api/api.dart';

part 'entry.g.dart';

abstract class Entry implements Built<Entry, EntryBuilder> {
  num get id;
  String get date;

  @nullable
  String get body;

  @BuiltValueField(wireName: "vote_count")
  num get voteCount;

  @BuiltValueField(wireName: "comments_count")
  num get commentsCount;

  Author get author;

  @nullable
  Embed get embed;

  factory Entry.mapFromResponse(EntryResponse response) {
    return _$Entry._(
        id: response.id,
        date: response.date,
        body: response.body,
        voteCount: response.voteCount,
        commentsCount: response.commentsCount,
        author: Author.fromResponse(response: response.author),
        embed: (response.embed != null
            ? Embed.fromResponse(response: response.embed)
            : null));
  }

  Entry._();
}
