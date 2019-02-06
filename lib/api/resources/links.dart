import 'package:owmflutter/api/api.dart';
import 'package:built_collection/built_collection.dart';
import 'package:owmflutter/models/models.dart';

class LinksApi extends ApiResource {
  LinksApi(ApiClient client) : super(client);

  Future<Result> getPromoted(int page) async {
    var items = await client
        .request('links', 'promoted', named: {'page': page.toString()});
    return normalizeLinksResponse(
        BuiltList.from(client.deserializeList(LinkResponse.serializer, items)));
  }

  Future<Result> getFavorite(int page) async {
    var items = await client
        .request('links', 'observed', named: {'page': page.toString()});
    return normalizeLinksResponse(
        BuiltList.from(client.deserializeList(LinkResponse.serializer, items)));
  }

  Future<Result> getLink(int linkId) async {
    var items = await client.request('links', 'link', api: [linkId.toString()]);
    return normalizeLinkResponse(
        client.deserializeElement(LinkResponse.serializer, items));
  }

  Future<Result> getLinkComments(int linkId) async {
    var items =
        await client.request('links', 'comments', api: [linkId.toString()]);
    return normalizeLinkCommentsResponse(BuiltList.from(
        client.deserializeList(LinkCommentResponse.serializer, items)));
  }

  Future<Result> commentVoteUp(LinkComment link) async {
    var voteCount = await client.request('links', 'commentvoteup',
        api: [link.linkId, link.id.toString()]);
    var updatedLink = link.rebuild((b) => b
      ..voteCount = voteCount["vote_count"]
      ..voteCountPlus = voteCount["vote_count_plus"]
      ..voteState = LinkCommentVoteState.UP_VOTED);

    return normalizeLinkComment(updatedLink);
  }

  Future<Result> commentVoteRemove(LinkComment link) async {
    var voteCount = await client.request('links', 'commentvotecancel',
        api: [link.linkId, link.id.toString()]);
    var updatedLink = link.rebuild((b) => b
      ..voteCount = voteCount["vote_count"]
      ..voteCountPlus = voteCount["vote_count_plus"]
      ..voteState = LinkCommentVoteState.NOT_VOTED);

    return normalizeLinkComment(updatedLink);
  }

  Future<Result> commentVoteDown(LinkComment link) async {
    var voteCount = await client.request('links', 'CommentVoteDown',
        api: [link.linkId, link.id.toString()]);
    print(voteCount);
    var updatedLink = link.rebuild((b) => b
      ..voteCount = voteCount["vote_count"]
      ..voteCountPlus = voteCount["vote_count_plus"]
      ..voteState = LinkCommentVoteState.DOWN_VOTED);

    return normalizeLinkComment(updatedLink);
  }

  Future<Result> getRelatedLinks(int linkId) async {
    var items =
        await client.request('links', 'related', api: [linkId.toString()]);
    return normalizeRelatedResponse(BuiltList.from(
        client.deserializeList(RelatedResponse.serializer, items)));
  }
}
