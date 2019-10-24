import 'package:flutter/foundation.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/model/model.dart';

class EntryCommentsListModel extends ListModel<EntryComment, EntryCommentModel> {
  final LoadNewItemsCallback<EntryComment> loadNewComments;

  EntryCommentsListModel({this.loadNewComments})
      : super(
            loadNewItems: loadNewComments,
            mapper: (e) => EntryCommentModel()..setData(e));
}
