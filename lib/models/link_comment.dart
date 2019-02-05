import 'package:built_value/built_value.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/api/api.dart';

part 'link_comment.g.dart';

abstract class LinkComment implements Built<LinkComment, LinkCommentBuilder> {
  int get id;
  String get date;

  @nullable
  String get body;

  int get voteCount;

  int get voteCountPlus;

  int get userVote;

  int get parentId;

  List<int> get childrenIds;

  bool get isVoted;

  bool get isBlocked;

  Author get author;

  @nullable
  Embed get embed;

  factory LinkComment.mapFromResponse(
      LinkCommentResponse response, List<int> childrenIds) {
    return _$LinkComment._(
        id: response.id,
        date: response.date,
        body: response.body,
        isBlocked: response.isBlocked,
        userVote: response.userVote,
        voteCountPlus: response.voteCountPlus,
        childrenIds: childrenIds,
        parentId: response.parentId,
        voteCount: response.voteCount,
        author: Author.fromResponse(response: response.author),
        isVoted: response.userVote != null && response.userVote > 0,
        embed: (response.embed != null
            ? Embed.fromResponse(response: response.embed)
            : null));
  }

  LinkComment._();
}
