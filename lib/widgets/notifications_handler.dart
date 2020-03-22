import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:owmflutter/api/api.dart';
import 'package:owmflutter/keys.dart';
import 'package:owmflutter/model/auth_model.dart';
import 'package:owmflutter/model/notifications_count_model.dart';
import 'package:owmflutter/models/notification.dart' as Notif;

import 'package:background_fetch/background_fetch.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:owmflutter/screens/notifications.dart';
import 'package:owmflutter/utils/utils.dart';
import 'package:provider/provider.dart';

Future<void> sendNotification(
    {int count, Notif.Notification notification}) async {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      new FlutterLocalNotificationsPlugin();

  var initializationSettingsAndroid =
      new AndroidInitializationSettings('ic_wykopmobilny');
  var initializationSettingsIOS = new IOSInitializationSettings(
    onDidReceiveLocalNotification: (d, u, p, a) async => {},
  );
  var initializationSettings = new InitializationSettings(
    initializationSettingsAndroid,
    initializationSettingsIOS,
  );
  flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
    onSelectNotification: (notif) async => {
      OwmKeys.navKey.currentState.push(Utils.getPageTransition(NotificationsScreen(initialIndex: 1,)))
    },
  );

  var notifText;
  if (count != null) {
    notifText = "Masz $count nieprzeczytanych powiadomień";
  } else {
    notifText = notification.body;
  }

  var androidPlatformChannelSpecifics = AndroidNotificationDetails(
    '1',
    'OWMH',
    'Powiadomienia owmh',
    importance: Importance.Max,
    priority: Priority.High,
    ticker: 'ticker',
  );

  var iOSPlatformChannelSpecifics = IOSNotificationDetails();
  var platformChannelSpecifics = NotificationDetails(
      androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);

  await flutterLocalNotificationsPlugin.show(
    0,
    'Wykop Mobilny (H)',
    notifText,
    platformChannelSpecifics,
    payload: count != null ? 'multiple_notifs' : '',
  );
}

Future<int> fetchNotifications() async {
  var count = await api.notifications.getNotificationsCount();

  if (count > 1) {
    sendNotification(count: count);
  } else if (count == 1) {
    var notifications = await api.notifications.getNotifications(0);
    sendNotification(notification: notifications.firstWhere((e) => e.isNew));
  }

  return count;
}

void fetchNotificationsTask() async {
  await fetchNotifications();
  BackgroundFetch.finish("owmh");
}

class NotificationsHandler extends StatefulWidget {
  final Widget child;
  NotificationsHandler({Key key, this.child}) : super(key: key);

  @override
  _NotificationsHandlerState createState() => _NotificationsHandlerState();
}

class _NotificationsHandlerState extends State<NotificationsHandler> {
  var model = NotificationsCountModel()..loadNotifCount();

  @override
  void initState() {
    super.initState();
    initNotifs();
  }

  Future<void> initNotifs() async {
    var authProvider = Provider.of<AuthStateModel>(context, listen: false);
    await authProvider.syncCompleter.future;
    if (authProvider.loggedIn) {
      model.startBackgroundFetch();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NotificationsCountModel>.value(
      value: this.model,
      child: widget.child,
    );
  }
}
