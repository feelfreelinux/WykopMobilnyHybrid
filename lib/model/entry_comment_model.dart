import 'package:flutter/foundation.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/api/api.dart';

class EntryCommentModel extends ChangeNotifier {
  int _id;
  String _body;
  String _date;
  int _voteCount;
  Author _author;
  Embed _embed;
  bool _isVoted;

  int get id => _id;
  String get body => _body;
  String get date => _date;
  int get voteCount => _voteCount;
  Author get author => _author;
  Embed get embed => _embed;
  bool get isVoted => _isVoted;

  void setData(EntryComment comment) {
    _id = comment.id;
    _body = comment.body;
    _date = comment.date;
    _voteCount = comment.voteCount;
    _author = comment.author;
    _embed = comment.embed;
    _isVoted = comment.isVoted;
    notifyListeners();
  }

  Future<void> toggleVote() async {

  }
}