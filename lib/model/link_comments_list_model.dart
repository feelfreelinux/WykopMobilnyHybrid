import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/model/model.dart';

class LinkCommentListModels extends ListModel<LinkComment, LinkCommentModel> {
  final LoadNewItemsCallback<LinkComment> loadNewLinkComments;

  LinkCommentListModels({this.loadNewLinkComments})
      : super(
            loadNewItems: loadNewLinkComments,
            mapper: (e) => LinkCommentModel()..setData(e));
}
