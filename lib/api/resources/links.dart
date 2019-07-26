import 'package:owmflutter/api/api.dart';
import 'package:built_collection/built_collection.dart';
import 'package:owmflutter/api/api.dart' as prefix0;
import 'package:owmflutter/models/models.dart';
import 'package:flutter/material.dart';

class LinksApi extends ApiResource {
  LinksApi(ApiClient client) : super(client);


  Future<List<Link>> _getLinks(String resource, String endpoint, int page) async {
      var items = await client
        .request(resource, endpoint, named: {'page': page.toString()});
    return client.deserializeList(LinkResponse.serializer, items).map((f) => Link.mapFromResponse(f)).toList();
  }


  Future<List<Link>> getPromotedNew(int page) => _getLinks('links', 'promoted', page);



  Future<List<Link>> getFavoriteNew(int page) => _getLinks('links', 'observed', page);


  Future<List<LinkComment>> getLinkComments(int linkId) async {
    var items =
        await client.request('links', 'comments', api: [linkId.toString()]);
    return deserializeLinkComments(items);
  }
/*
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
    debugPrint(voteCount);
    var updatedLink = link.rebuild((b) => b
      ..voteCount = voteCount["vote_count"]
      ..voteCountPlus = voteCount["vote_count_plus"]
      ..voteState = LinkCommentVoteState.DOWN_VOTED);

    return normalizeLinkComment(updatedLink);
  }
*/
  Future<List<Related>> getRelatedLinks(int linkId) async {
    var items =
        await client.request('links', 'related', api: [linkId.toString()]);
      return deserializeRelatedLinks(items);
  }
}
