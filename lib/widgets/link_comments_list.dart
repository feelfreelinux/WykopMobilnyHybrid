import 'package:flutter/material.dart';
import 'package:owmflutter/model/model.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/widgets/item_list.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:provider/provider.dart';

class LinkCommentsList extends ItemList<LinkComment, LinkCommentModel> {
  LinkCommentsList(
      {ModelBuilder<LinkCommentListModels> builder,
      Widget header,
      WidgetBuilder persistentHeaderBuilder})
      : super(
          builder: builder,
          persistentHeaderBuilder: persistentHeaderBuilder,
          header: header,
          buildChildren: (context) => ChangeNotifierProvider<InputModel>(
            builder: (context) => FakeInputModel(),
            child:
                LinkCommentWidget(relation: AuthorRelation.Author, linkId: 0),
          ),
        );
}
