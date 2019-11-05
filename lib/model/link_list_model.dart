import 'package:flutter/widgets.dart';
import 'package:owmflutter/content_filters/content_filters.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/model/model.dart';

class LinkListModel extends ListModel<Link, LinkModel> {
  final LoadNewItemsCallback<Link> loadNewLinks;

  LinkListModel({this.loadNewLinks, BuildContext context})
      : super(
            loadNewItems: (page) => OWMContentFilter.filterLinks(loadNewLinks(page), context),
            mapper: (e) => LinkModel()..setData(e));
}
