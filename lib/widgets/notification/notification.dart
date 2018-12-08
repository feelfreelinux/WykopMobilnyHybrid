import 'package:flutter/material.dart';
import 'package:owmflutter/models/models.dart' as Models;
import 'package:owmflutter/widgets/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:owmflutter/store/store.dart';
import 'package:flutter_advanced_networkimage/flutter_advanced_networkimage.dart';

class NotificationWidget extends StatelessWidget {
  final int notificationId;
  NotificationWidget({this.notificationId});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 0.0, bottom: 3.0),
        child: Material(
            color: Theme.of(context).cardColor,
            elevation: 0.0,
            child: StoreConnector<AppState, Models.Notification>(
                converter: (store) =>
                    store.state.entitiesState.notifications[notificationId],
                builder: (context, notification) {
                  return Text(notification.body);
                })));
  }
}
