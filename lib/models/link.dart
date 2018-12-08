import 'package:built_value/built_value.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/api/api.dart';
import 'package:built_collection/built_collection.dart';

part 'link.g.dart';

abstract class Link implements Built<Link, LinkBuilder> {
  int get id;
  String get date;

  String get title;

  String get description;

  String get tags;

  String get sourceUrl;

  int get voteCount;

  int get commentsCount;

  int get relatedCount;

  Author get author;

  @nullable
  String get preview;

  bool get isHot;

  bool get canVote;

  factory Link.mapFromResponse(LinkResponse response) {
    return _$Link._(
      id: response.id,
      date: response.date,
      title: response.title,
      voteCount: response.voteCount,
      commentsCount: response.commentsCount,
      author: Author.fromResponse(response: response.author),
      isHot: response.isHot,
      preview: // Makes link previews load in full resolution
        response.preview != null ? response.preview.split(',')[0] + '.' + response.preview.split(',')[1].split('.')[1] : null,
      sourceUrl: response.sourceUrl,
      canVote: response.canVote,
      description: response.description,
      relatedCount: response.relatedCount,
      tags: response.tags,
    );
  }

  Link._();
}
