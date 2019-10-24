import 'package:built_value/built_value.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/api/api.dart';

part 'link.g.dart';

abstract class Link implements Built<Link, LinkBuilder> {
  int get id;
  String get date;

  String get title;

  String get description;

  String get tags;

  String get sourceUrl;

  int get voteCount;
  
  int get buryCount;

  bool get isFavorite;

  int get commentsCount;

  int get relatedCount;

  LinkVoteState get voteState;

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
      buryCount: response.buryCount,
      voteState: response.userVote ?? "" == "dig" ? LinkVoteState.DIGGED : (response.userVote ?? "" == "bury" ? LinkVoteState.BURIED : LinkVoteState.NONE),
      preview: // Makes link previews load in full resolution
          response.preview != null
              ? response.preview.split(',')[0] +
                  '.' +
                  response.preview.split(',')[1].split('.')[1]
              : null,
      isFavorite: response.favorite ?? false,
      sourceUrl: response.sourceUrl,
      canVote: response.canVote,
      description: response.description,
      relatedCount: response.relatedCount,
      tags: response.tags,
    );
  }

  Link._();
}
