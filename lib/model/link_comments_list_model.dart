import 'package:flutter/cupertino.dart';
import 'package:owmflutter/content_filters/content_filters.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/model/model.dart';

class LinkCommentListModels extends ListModel<LinkComment, LinkCommentModel> {
  final LoadNewItemsCallback<LinkComment> loadNewLinkComments;

  LinkCommentListModels({this.loadNewLinkComments, BuildContext context})
      : super(
            loadNewItems: (page) => OWMContentFilter.filterLinkComments(loadNewLinkComments(page), context),
            mapper: (e) => LinkCommentModel()..setData(e));
}
