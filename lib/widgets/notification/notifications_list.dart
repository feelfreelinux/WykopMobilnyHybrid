import 'dart:async';
import 'package:flutter/material.dart';
import 'package:owmflutter/model/model.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:provider/provider.dart';

class NotificationsList extends StatefulWidget {
  final dynamic builder;
  final Widget header;

  NotificationsList({this.builder, this.header});

  @override
  NotificationsListState createState() {
    return new NotificationsListState();
  }
}

class NotificationsListState extends State<NotificationsList>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
      child: ChangeNotifierProvider<NotificationListModel>(
        builder: widget.builder,
        child: Consumer<NotificationListModel>(
          builder: (context, model, _) => RefreshIndicator(
            onRefresh: () => model.refresh(),
            child: model.isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : InfiniteList(
                    header: widget.header,
                    loadData: (completer) async {
                      await model.loadMoreNotifications();
                    },
                    itemCount: model.notifications.length,
                    itemBuilder: (context, index) {
                      return ChangeNotifierProvider<NotificationModel>(
                        builder: (context) => NotificationModel()
                          ..setData(model.notifications[index]),
                        child: NotificationWidget(),
                      );
                    },
                  ),
          ),
        ),
      ),
    );
  }
}
