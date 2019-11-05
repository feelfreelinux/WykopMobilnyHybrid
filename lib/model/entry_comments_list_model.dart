import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:owmflutter/content_filters/content_filters.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/model/model.dart';

class EntryCommentsListModel extends ListModel<EntryComment, EntryCommentModel> {
  final LoadNewItemsCallback<EntryComment> loadNewComments;

  EntryCommentsListModel({this.loadNewComments, BuildContext context})
      : super(
            loadNewItems: (page) => OWMContentFilter.filterEntryComments(loadNewComments(page), context),
            mapper: (e) => EntryCommentModel()..setData(e));
}
