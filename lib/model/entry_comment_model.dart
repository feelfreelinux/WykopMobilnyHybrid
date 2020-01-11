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
  bool _isExpanded;
  List<Voter> _upvoters;
  String _violationUrl;
  String _app;

  int get id => _id;
  String get body => _body;
  String get date => _date;
  int get voteCount => _voteCount;
  Author get author => _author;
  Embed get embed => _embed;
  bool get isExpanded => _isExpanded;
  bool get isVoted => _isVoted;
  String get violationUrl => _violationUrl;
  String get app => _app;

  List<Voter> get upvoters => _upvoters.reversed.toList();

  void expand() {
    _isExpanded = true;
    notifyListeners();
  }
  void setData(EntryComment comment) {
    _id = comment.id;
    _body = comment.body;
    _date = comment.date;
    _voteCount = comment.voteCount;
    _author = comment.author;
    _embed = comment.embed;
    _isVoted = comment.isVoted;
    _isExpanded = comment.isExpanded;
    _violationUrl = comment.violationUrl;
    _app = comment.app;
    notifyListeners();
  }

  Future<void> delete() async {
    await api.entries.deleteComment(_id);
    _body = "[Komentarz usunięty]";
    notifyListeners();
  }
  
  Future<void> loadUpVoters() async {
    _upvoters = await api.entries.getCommentUpVoters(_id);
    notifyListeners();
  }

  Future<void> toggleVote() async {
    if (!_isVoted) {
      _voteCount = await api.entries.voteComemntUp(_id);
      _isVoted = true;
    } else {
      _voteCount = await api.entries.voteCommentDown(_id);
      _isVoted = false;
    }
    notifyListeners();
  }
}