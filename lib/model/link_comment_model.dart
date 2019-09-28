import 'package:flutter/foundation.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/api/api.dart';

class LinkCommentModel extends ChangeNotifier {
  int _id;
  String _body;
  String _date;
  int _voteCount;
  int _voteCountPlus;
  Author _author;
  Embed _embed;
  int _parentId;
  String _linkId;
  LinkCommentVoteState _voteState;

  int get id => _id;
  String get body => _body;
  String get date => _date;
  int get parentId => _parentId;
  int get voteCount => _voteCount;
  int get voteCountPlus => _voteCountPlus;
  Author get author => _author;
  Embed get embed => _embed;
  LinkCommentVoteState get voteState => _voteState;
  bool get isParentComment => _id == _parentId;

  void setData(LinkComment comment) {
    _id = comment.id;
    _body = comment.body;
    _date = comment.date;
    _voteCount = comment.voteCount;
    _author = comment.author;
    _embed = comment.embed;
    _parentId = comment.parentId;
    _linkId = comment.linkId;
    _voteCountPlus = comment.voteCountPlus;
    _voteState = comment.voteState;
    notifyListeners();
  }

  Future<void> voteUp() async {
    if (_voteState != LinkCommentVoteState.NOT_VOTED) {
      return voteRemove();
    }

    var res = await api.links.commentVoteUp(_id, _linkId);
    _voteCountPlus = res.votesPlus;
    _voteCount = res.votes;
    _voteState = res.state;
    notifyListeners();
  }

  Future<void> voteDown() async {
    if (_voteState != LinkCommentVoteState.NOT_VOTED) {
      return voteRemove();
    }
    var res = await api.links.commentVoteDown(_id, _linkId);

    _voteCountPlus = res.votesPlus;
    _voteCount = res.votes;
    _voteState = res.state;
    notifyListeners();
  }

  Future<void> voteRemove() async {
    var res = await api.links.commentVoteRemove(_id, _linkId);

    _voteCountPlus = res.votesPlus;
    _voteCount = res.votes;
    _voteState = res.state;
    notifyListeners();
  }
}
