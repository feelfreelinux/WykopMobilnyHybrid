import 'package:flutter/foundation.dart';
import 'package:owmflutter/model/input_model.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/api/api.dart';

class EntryModel extends InputModel {
  int _id;
  String _body;
  String _date;
  int _voteCount;
  Author _author;
  Embed _embed;
  bool _isVoted;
  List<EntryComment> _comments = [];
  List<Voter> _upvoters = [];
  int _commentsCount;
  bool _loading = false;

  int get id => _id;
  String get body => _body;
  String get date => _date;
  int get voteCount => _voteCount;
  Author get author => _author;
  Embed get embed => _embed;
  bool get isVoted => _isVoted;
  int get commentsCount => _commentsCount;
  bool get isLoading => _loading;
  List<EntryComment> get comments => _comments;
  List<Voter> get upvoters => _upvoters;

  void setData(Entry entry) {
    _id = entry.id;
    _body = entry.body;
    _date = entry.date;
    _voteCount = entry.voteCount;
    _author = entry.author;
    _embed = entry.embed;
    _comments = entry.comments.toList();
    _isVoted = entry.isVoted;
    _commentsCount = entry.commentsCount;
    notifyListeners();
  }

  Future<void> updateEntry() async {
    if (!_loading) {
      _loading = true;
      // notifyListeners();

      var entry = await api.entries.getEntry(_id);
      _loading = false;
      setData(entry);
    }
  }

  void setId(int id) {
    _id = id;
  }

  void voteToggle() async {
    if (!_isVoted) {
      _voteCount = await api.entries.voteUp(_id);
      _isVoted = true;
    } else {
      _voteCount = await api.entries.voteDown(_id);
      _isVoted = false;
    }
    notifyListeners();
  }

  Future<void> loadUpVoters() async {
    _upvoters = await api.entries.getEntryUpVoters(_id);
    print(_upvoters);
    notifyListeners();
  }

  @override
  Future<void> onInputSubmitted(InputData data) async {
    _comments.add(await api.entries.addEntryComment(_id, data));
    notifyListeners();
    updateEntry();
  }
}