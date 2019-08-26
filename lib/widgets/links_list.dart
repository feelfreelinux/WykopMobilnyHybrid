import 'dart:async';
import 'package:flutter/material.dart';
import 'package:owmflutter/model/model.dart';
import 'package:owmflutter/models/link.dart';
import 'package:owmflutter/widgets/item_list.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:provider/provider.dart';

class LinksList extends ItemList<Link, LinkModel> {
  LinksList({ModelBuilder<LinkListModel> builder, Widget header})
      : super(
          builder: builder,
          header: header,
          buildChildren: (context) => NewLinkWidget(),
        );
}
