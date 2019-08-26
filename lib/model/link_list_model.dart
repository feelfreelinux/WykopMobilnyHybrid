import 'package:flutter/foundation.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/model/model.dart';

class LinkListModel extends ListModel<Link, LinkModel> {
  final LoadNewItemsCallback<Link> loadNewLinks;

  LinkListModel({this.loadNewLinks})
      : super(
            loadNewItems: loadNewLinks,
            mapper: (e) => LinkModel()..setData(e));
}
