import 'package:flutter/material.dart';
import 'package:owmflutter/model/model.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/widgets/item_list.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:provider/provider.dart';

class FakeInputModel extends InputModel  {
  @override
  Future<void> onInputSubmitted(InputData data) {
  }
}

class EntryCommentsList extends ItemList<EntryComment, EntryCommentModel> {
  EntryCommentsList({ModelBuilder<EntryCommentsListModel> builder, Widget header, WidgetBuilder persistentHeaderBuilder})
      : super(
          builder: builder,
          persistentHeaderBuilder: persistentHeaderBuilder,
          header: header,
          buildChildren: (context) => ChangeNotifierProvider<InputModel>(
            builder: (context) => FakeInputModel(),
            child: EntryCommentWidget(relation: AuthorRelation.Author, entryId: 0)),
        );
}
