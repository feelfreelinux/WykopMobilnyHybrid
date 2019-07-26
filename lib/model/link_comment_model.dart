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
  LinkCommentVoteState _voteState;

  int get id => _id;
  String get body => _body;
  String get date => _date;
  int get voteCount => _voteCount;
  int get voteCountPlus => _voteCountPlus;
  Author get author => _author;
  Embed get embed => _embed;
  LinkCommentVoteState get voteState => _voteState;

  void setData(LinkComment comment) {
    _id = comment.id;
    _body = comment.body;
    _date = comment.date;
    _voteCount = comment.voteCount;
    _author = comment.author;
    _embed = comment.embed;
    _voteCountPlus = comment.voteCountPlus;
    _voteState = comment.voteState;
    notifyListeners();
  }

  Future<void> toggleVote() async {

  }
}