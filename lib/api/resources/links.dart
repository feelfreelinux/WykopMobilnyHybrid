import 'package:owmflutter/api/api.dart';
import 'package:built_collection/built_collection.dart';
import 'package:owmflutter/api/api.dart' as prefix0;
import 'package:owmflutter/models/models.dart';
import 'package:flutter/material.dart';

// Used for vote up, vote down and vote cancel responses
class VoteStateResponse {
  final int votesPlus;
  final int votes;
  final LinkCommentVoteState state;
  VoteStateResponse({this.votes, this.votesPlus, this.state});
}

class BuryReason {
  static const DUPLICATE = 1;
  static const SPAM = 2;
  static const FAKE_INFO = 3;
  static const NOT_APPROPRIATE_CONTENT = 4;
  static const INVALID = 5;
}


enum LinkVoteState {
  DIGGED,
  BURIED,
  NONE,  
}

class DigResponse {
  final int digs;
  final int buries;
  final LinkVoteState state;
  DigResponse({this.digs, this.buries, this.state});
}

class UpcomingSort {
  static const SORTBY_COMMENTS = "comments";
  static const SORTBY_VOTES = "votes";
  static const SORTBY_DATE = "date";
  static const SORTBY_ACTIVE = "active";
}

class LinksApi extends ApiResource {
  LinksApi(ApiClient client) : super(client);


  Future<List<Link>> _getLinks(String resource, String endpoint, int page) async {
      var items = await client
        .request(resource, endpoint, named: {'page': page.toString()});
    return client.deserializeList(LinkResponse.serializer, items).map((f) => Link.mapFromResponse(f)).toList();
  }

  Future<List<Link>> getUpcoming(String sortBy, int page) async {
      var items = await client
        .request('links', 'upcoming', named: {'page': page.toString(), 'sort': sortBy});
    return client.deserializeList(LinkResponse.serializer, items).map((f) => Link.mapFromResponse(f)).toList();
  }

  Future<List<Link>> getPromotedNew(int page) => _getLinks('links', 'promoted', page);

  Future<List<Link>> getFavoriteNew(int page) => _getLinks('links', 'observed', page);

  Future<List<LinkComment>> getLinkComments(int linkId) async {
    var items =
        await client.request('links', 'comments', api: [linkId.toString()]);
    return deserializeLinkComments(items);
  }

  Future<bool> markFavorite(int id) async {
    var res = await client.request('links', 'favorite', api: [id.toString()]);
    return res["user_favorite"] as bool;
  }

  Future<DigResponse> voteUp(String linkId) async {
    var voteCount = await client.request('links', 'voteup',
        api: [linkId]);

    return DigResponse(digs: voteCount["digs"], buries: voteCount["buries"], state: LinkVoteState.DIGGED);
  }

  Future<DigResponse> voteRemove(String linkId) async {
    var voteCount = await client.request('links', 'voteremove',
        api: [linkId]);

    return DigResponse(digs: voteCount["digs"], buries: voteCount["buries"], state: LinkVoteState.NONE);
  }

  Future<DigResponse> voteDown(String linkId, int reason) async {
    var voteCount = await client.request('links', 'votedown',
        api: [linkId, reason.toString()]);

    return DigResponse(digs: voteCount["digs"], buries: voteCount["buries"], state: LinkVoteState.BURIED);
  }

  Future<VoteStateResponse> commentVoteUp(int linkCommentId, String linkId) async {
    var voteCount = await client.request('links', 'commentvoteup',
        api: [linkId, linkCommentId.toString()]);

    return VoteStateResponse(votes: voteCount["vote_count"], votesPlus: voteCount["vote_count_plus"], state: LinkCommentVoteState.UP_VOTED);
  }

  Future<VoteStateResponse> commentVoteRemove(int linkCommentId, String linkId) async {
    var voteCount = await client.request('links', 'commentvotecancel',
        api: [linkId, linkCommentId.toString()]);

    return VoteStateResponse(votes: voteCount["vote_count"], votesPlus: voteCount["vote_count_plus"], state: LinkCommentVoteState.NOT_VOTED);
  }

  Future<VoteStateResponse> commentVoteDown(int linkCommentId, String linkId) async {
    var voteCount = await client.request('links', 'CommentVoteDown',
        api: [linkId, linkCommentId.toString()]);

    return VoteStateResponse(votes: voteCount["vote_count"], votesPlus: voteCount["vote_count_plus"], state: LinkCommentVoteState.DOWN_VOTED);
  }

  Future<List<Related>> getRelatedLinks(int linkId) async {
    var items =
        await client.request('links', 'related', api: [linkId.toString()]);
      return deserializeRelatedLinks(items);
  }
}
