import 'package:flutter/material.dart';
import 'package:owmflutter/api/api.dart';
import 'package:owmflutter/model/model.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:owmflutter/owm_glyphs.dart';
import 'package:provider/provider.dart';

class NotificationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ShadowControlModel>(
      builder: (context) => ShadowControlModel(),
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppbarTabsWidget(
            tabs: <Widget>[
              Tab(text: "Wiadomości"),
              Tab(text: "Powiadomienia"),
              Tab(text: "Tagi"),
            ],
          ),
          body: TabBarView(
            children: [
              NotLoggedWidget(
                icon: Icons.mail,
                text: "Prywatne wiadomości",
                child: ConversationsList(),
              ),
              NotLoggedWidget(
                icon: Icons.notifications,
                text: "Powiadomienia",
                child: NotificationsList(
                  builder: (context) => NotificationListModel(
                    loadNewNotifications: (page) =>
                        api.notifications.getNotifications(page),
                  ),
                ),
              ),
              NotLoggedWidget(
                icon: OwmGlyphs.ic_navi_my_wykop,
                text: "Obserwowane tagi",
                child: NotificationsList(
                  builder: (context) => NotificationListModel(
                    loadNewNotifications: (page) =>
                        api.notifications.getHashtagNotifications(page),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
