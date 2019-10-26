import 'package:flutter/material.dart';
import 'package:owmflutter/api/api.dart';
import 'package:owmflutter/model/model.dart';
import 'package:owmflutter/utils/utils.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:owmflutter/owm_glyphs.dart';
import 'package:provider/provider.dart';
import 'package:owmflutter/models/models.dart' as prefix0;

class NotificationsScreen extends StatelessWidget {
  final int initialIndex;
  NotificationsScreen({this.initialIndex = 0});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ShadowControlModel>(
      builder: (context) => ShadowControlModel(scrollDelayPixels: 4),
      child: DefaultTabController(
        length: 3,
        initialIndex: initialIndex,
        child: Scaffold(
          resizeToAvoidBottomPadding: false,
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
                  persistentHeaderBuilder: (newContext) => _header(),
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
                  persistentHeaderBuilder: (newContext) => _header(
                    group: () {
                      //TODO: implement group hashtag notifications
                      Scaffold.of(context).showSnackBar(
                          SnackBar(content: Text("Niezaimplementowane")));
                    },
                    isGroup:
                        false, //TODO: implement state hashtag notifications
                  ),
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

  Widget _header({VoidCallback group, bool isGroup: false}) {
    return Builder(
      builder: (context) {
        var notifModel =
            (Provider.of<ListModel<prefix0.Notification, NotificationModel>>(
                context,
                listen: false) as NotificationListModel);
        var notifsCount = notifModel.unreadNotifsCount;

        return Container(
          padding: EdgeInsets.only(
            top: 6.0,
            bottom: 10.0,
            left: 18.0,
            right: 16.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                notifsCount > 0
                    ? "$notifsCount " +
                        Utils.polishPlural(
                          count: notifsCount,
                          first: "nieprzeczytane",
                          many: "nieprzeczytanych",
                          other: "nieprzeczytane",
                        )
                    : "Wszystkie przeczytane",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).textTheme.body1.color,
                ),
              ),
              Row(
                children: <Widget>[
                  Visibility(
                    visible: group != null,
                    child: Tooltip(
                      message: isGroup
                          ? "Nie grupuj powiadomień"
                          : "Grupuj powiadomienia",
                      child: RoundIconButtonWidget(
                        icon: isGroup
                            ? Icons.format_list_numbered
                            : Icons.format_list_bulleted,
                        padding: EdgeInsets.symmetric(horizontal: 12.0),
                        onTap: group,
                      ),
                    ),
                  ),
                  Tooltip(
                    message: "Oznacz jako odczytane",
                    child: RoundIconButtonWidget(
                      icon: OwmGlyphs.ic_mark_read,
                      padding: EdgeInsets.all(0.0),
                      onTap: () {
                        if (group == null) {
                          notifModel.readDirectedNotifs();
                        } else {
                          notifModel.readHashNotifs();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
