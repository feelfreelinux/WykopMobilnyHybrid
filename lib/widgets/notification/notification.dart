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
          builder: (context, markAsRead) => GestureDetector(
                onTap: () {
                  markAsRead();
                  WykopNavigator.handleUrl(context, notification.url);
                },
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 12.0,
                        horizontal: 18.0,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          AvatarWidget(
                            author: notification.author,
                            size: 36.0,
                          ),
                          Flexible(
                            fit: FlexFit.tight,
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: 12.0,
                                right: 8.0,
                              ),
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: notification.body.substring(
                                          0, notification.body.indexOf(' ')),
                                      style: TextStyle(
                                        fontSize: 13.5,
                                        height: 1.1,
                                        fontWeight: FontWeight.w500,
                                        color: Utils.getAuthorColor(
                                            notification.author, context),
                                      ),
                                    ),
                                    TextSpan(
                                      text: notification.body
                                          .substring(
                                              notification.body.indexOf(' '),
                                              notification.body.length)
                                          .replaceAll('\n', ' '),
                                      style: TextStyle(
                                        fontSize: 13.5,
                                        height: 1.1,
                                        color: Theme.of(context)
                                            .textTheme
                                            .headline
                                            .color,
                                      ),
                                    ),
                                    TextSpan(
                                      text: '\n' +
                                          Utils.getSimpleDate(
                                              notification.date),
                                      style: TextStyle(
                                        fontSize: 11.5,
                                        height: 1.3,
                                        color: Theme.of(context)
                                            .textTheme
                                            .caption
                                            .color,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 10,
                            height: 10,
                            margin: EdgeInsets.only(
                              top: 4.0,
                            ),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: notification.isNew
                                  ? Colors.green
                                  : Colors.transparent,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 68.0,
                        right: 18.0,
                      ),
                      child: Divider(
                        height: 1.0,
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
