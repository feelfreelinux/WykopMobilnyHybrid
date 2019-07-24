import 'package:flutter/material.dart';
import 'package:owmflutter/models/models.dart' as Models;
import 'package:owmflutter/widgets/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:owmflutter/store/store.dart';
import 'package:owmflutter/utils/utils.dart';
import 'package:owmflutter/navigator/navigator.dart';

class NotificationWidget extends StatelessWidget {
  final int notificationId;
  NotificationWidget({this.notificationId});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Models.Notification>(
      key: Key(notificationId.toString()),
      converter: (store) =>
          store.state.entitiesState.notifications[notificationId],
      builder: (context, notification) {
        return StoreConnector<AppState, VoidCallback>(
          converter: (store) =>
              () => store.dispatch(markNotificationAsRead(notification.id)),
          builder: (context, markAsRead) => InkWell(
            onTap: () {
              markAsRead();
              WykopNavigator.handleUrl(context, notification.url);
            },
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    top: 6.0,
                    bottom: 6.0,
                    left: 14.0,
                    right: 18.0,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Visibility(
                        visible: notification.author != null,
                        child: AvatarWidget(
                          author: notification.author,
                          size: 52.0,
                        ),
                      ),
                      Flexible(
                        fit: FlexFit.tight,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 10.0,
                            right: 8.0,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              RichText(
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: notification.body.substring(
                                          0, notification.body.indexOf(' ')),
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        height: 1.1,
                                        fontWeight: FontWeight.w500,
                                        color: notification.author != null
                                            ? Utils.getAuthorColor(
                                                notification.author, context)
                                            : Theme.of(context)
                                                .textTheme
                                                .headline
                                                .color,
                                      ),
                                    ),
                                    TextSpan(
                                      text: notification.body
                                          .substring(
                                              notification.body.indexOf(' '),
                                              notification.body.length)
                                          .replaceAll('\n', ' '),
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        height: 1.1,
                                        color: Theme.of(context)
                                            .textTheme
                                            .headline
                                            .color,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                Utils.getSimpleDate(notification.date),
                                style: TextStyle(
                                  fontSize: 12.0,
                                  height: 1.3,
                                  color:
                                      Theme.of(context).textTheme.caption.color,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Visibility(
                        visible: notification.isNew,
                        child: Container(
                          width: 14.0,
                          height: 14.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
