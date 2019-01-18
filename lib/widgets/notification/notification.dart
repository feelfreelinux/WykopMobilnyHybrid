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
    return Padding(
        key: Key(notificationId.toString()),
        padding: EdgeInsets.only(top: 0.0, bottom: 3.0),
        child: StoreConnector<AppState, Models.Notification>(
            converter: (store) =>
                store.state.entitiesState.notifications[notificationId],
            builder: (context, notification) {
              return Stack(children: [
                Material(
                    color: Theme.of(context).cardColor,
                    elevation: 0.0,
                    child: StoreConnector<AppState, VoidCallback>(
                      converter: (store) => () => store
                          .dispatch(markNotificationAsRead(notification.id)),
                      builder: (context, markAsRead) => GestureDetector(
                            onTap: () {
                              markAsRead();
                              WykopNavigator.handleUrl(
                                  context, notification.url);
                            },
                            child: Column(children: [
                              Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: AvatarWidget(
                                        author: notification.author, size: 40),
                                  ),
                                  new Flexible(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: new Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          RichText(
                                              softWrap: true,
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                      text: notification.body
                                                          .substring(
                                                              0,
                                                              notification.body
                                                                  .indexOf(
                                                                      ' ')),
                                                      style: TextStyle(
                                                          color: Utils
                                                              .getAuthorColor(
                                                                  notification
                                                                      .author,
                                                                  context))),
                                                  TextSpan(
                                                      text: notification.body
                                                          .substring(
                                                              notification.body
                                                                  .indexOf(' '),
                                                              notification
                                                                  .body.length),
                                                      style: TextStyle(
                                                          color:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .headline
                                                                  .color))
                                                ],
                                              ))
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 0),
                                child: Divider(
                                  height: 1.0,
                                ),
                              ),
                            ]),
                          ),
                    )),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: notification.isNew
                        ? Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                                color: Colors.greenAccent,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0))))
                        : Container(),
                  ),
                ),
              ]);
            }));
  }
}
