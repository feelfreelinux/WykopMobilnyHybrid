import 'package:flutter/foundation.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/api/api.dart';

class LinkModel extends ChangeNotifier {
  int _id;
  String _title;
  String _description;
  String _tags;
  String _sourceUrl;
  int _relatedCount;
  String _preview;
  bool _isHot;
  bool _canVote;
  String _date;
  int _voteCount;
  Author _author;
  List<LinkComment> _comments;
  int _commentsCount;
  List<Related> _relatedLinks;

  int get id => _id;
  String get date => _date;
  int get voteCount => _voteCount;
  Author get author => _author;
  String get title => _title.replaceAll('&quot;', '"').replaceAll('&amp;', '&');
  String get description =>
      _description.replaceAll('&quot;', '"').replaceAll('&amp;', '&');
  String get sourceUrl => _sourceUrl;
  String get tags => _tags;
  int get relatedCount => _relatedCount;
  String get preview => _preview;
  List<Related> get relatedLinks => _relatedLinks;
  bool get isHot => _isHot;
  bool get canVote => _canVote;

  int get commentsCount => _commentsCount;
  List<LinkComment> get comments => _comments;

  void setData(Link link) {
    _id = link.id;
    _date = link.date;
    _voteCount = link.voteCount;
    _author = link.author;
    _description = link.description;
    _title = link.title;
    _sourceUrl = link.sourceUrl;
    _tags = link.tags;
    _relatedCount = link.relatedCount;
    _preview = link.preview;
    _isHot = link.isHot;
    _canVote = link.canVote;
    _relatedLinks = [];
    _comments = [];
    _commentsCount = link.commentsCount;
    notifyListeners();
  }

  void setId(int id) {
    _id = id;
  }

  Future<void> loadComments() async {
    var allComents = await api.links.getLinkComments(id);
    _comments = allComents;/*.where((e) => e.id == e.parentId)
      ..forEach(
        (c) {
          c.children.addAll(
            allComents.where((e) => e.parentId == c.id && e.id != c.id),
          );
        },
      );*/
    _relatedLinks = await api.links.getRelatedLinks(id);
    notifyListeners();
  }
}
