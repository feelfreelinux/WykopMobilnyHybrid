import 'dart:async';
import 'package:flutter/material.dart';
import 'package:owmflutter/model/model.dart';
import 'package:owmflutter/models/entry.dart';
import 'package:owmflutter/models/models.dart' as prefix0;
import 'package:owmflutter/widgets/item_list.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:provider/provider.dart';

class NotificationsList extends ItemList<prefix0.Notification, NotificationModel> {
  NotificationsList({ModelBuilder<NotificationListModel> builder, Widget header})
      : super(
          builder: builder,
          header: header,
          buildChildren: (context) => NotificationWidget(),
        );
}
