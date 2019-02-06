import 'package:built_value/built_value.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/api/api.dart';

part 'link_comment.g.dart';

enum LinkCommentVoteState {
  UP_VOTED,
  DOWN_VOTED,
  NOT_VOTED,
}

abstract class LinkComment implements Built<LinkComment, LinkCommentBuilder> {
  int get id;
  String get date;

  @nullable
  String get body;

  int get voteCount;

  int get voteCountPlus;

  int get userVote;
  String get linkId;

  int get parentId;

  List<int> get childrenIds;

  LinkCommentVoteState get voteState;

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
        linkId: response.link,
        voteCount: response.voteCount,
        author: Author.fromResponse(response: response.author),
        voteState: getVoteState(response.userVote),
        embed: (response.embed != null
            ? Embed.fromResponse(response: response.embed)
            : null));
  }

  LinkComment._();
}

LinkCommentVoteState getVoteState(int userVote) {
  switch (userVote) {
    case 0:
      return LinkCommentVoteState.NOT_VOTED;
    case 1:
      return LinkCommentVoteState.UP_VOTED;
    case -1: 
      return LinkCommentVoteState.DOWN_VOTED;
    default:
      return LinkCommentVoteState.NOT_VOTED;
  }
}