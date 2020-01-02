import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:owmflutter/model/entry_comment_model.dart';
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
  bool _isFavorite;
  bool _isExpanded;
  bool _isNsfw;
  List<EntryCommentModel> _comments = [];
  List<Voter> _upvoters = [];
  int _commentsCount;
  bool _loading = false;
  String _violationUrl;

  int get id => _id;
  String get body => _body;
  String get date => _date;
  int get voteCount => _voteCount;
  Author get author => _author;
  Embed get embed => _embed;
  bool get isExpanded => _isExpanded;
  bool get isFavorite => _isFavorite;
  bool get isVoted => _isVoted;
  bool get isNsfw => _isNsfw;
  int get commentsCount => _commentsCount;
  bool get isLoading => _loading;
  String get violationUrl => _violationUrl;

  List<EntryCommentModel> get comments => _comments;
  List<Voter> get upvoters => _upvoters.reversed.toList();

  void setData(Entry entry) {
    _id = entry.id;
    _body = entry.body;
    _date = entry.date;
    _voteCount = entry.voteCount;
    _author = entry.author;
    _embed = entry.embed;
    _isExpanded = entry.isExpanded;
    _comments =
        entry.comments.map((e) => EntryCommentModel()..setData(e)).toList();
    _isVoted = entry.isVoted;
    _isNsfw = (entry.body ?? "").contains("#nsfw") ?? false;
    _isFavorite = entry.isFavorite;
    _commentsCount = entry.commentsCount;
    _violationUrl = entry.violationUrl;
    notifyListeners();
  }

  Future<void> delete() async {
    await api.entries.deleteEntry(_id);
    _body = "[Wpis usunięty]";
    notifyListeners();
  }

  void expand() {
    _isExpanded = true;
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

    loadUpVoters();
  }

  void favoriteToggle() async {
    _isFavorite = await api.entries.markFavorite(_id);
    notifyListeners();
  }

  Future<void> loadUpVoters() async {
    _upvoters = await api.entries.getEntryUpVoters(_id);
    notifyListeners();
  }

  @override
  Future<void> onInputSubmitted(InputData data) async {
    _comments.add(EntryCommentModel()
      ..setData(await api.entries.addEntryComment(_id, data)));
    notifyListeners();
    updateEntry();
  }
}
