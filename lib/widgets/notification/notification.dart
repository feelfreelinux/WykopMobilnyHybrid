import 'package:flutter/material.dart';
import 'package:owmflutter/model/model.dart';
import 'package:owmflutter/models/models.dart' as prefix0;
import 'package:owmflutter/widgets/widgets.dart';
import 'package:owmflutter/utils/utils.dart';
import 'package:owmflutter/navigator/navigator.dart';
import 'package:provider/provider.dart';

class NotificationWidget extends StatelessWidget {
  NotificationWidget();

  @override
  Widget build(BuildContext context) {
    return Consumer<NotificationModel>(
      builder: (context, model, _) => Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: () async {
            model.markAsRead();
            (Provider.of<ListModel<prefix0.Notification, NotificationModel>>(context, listen: false) as NotificationListModel).updateNotifCount();
            WykopNavigator.handleUrl(context, model.url);
          },
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                    top: 6.0, bottom: 6.0, left: 14.0, right: 18.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Visibility(
                      visible: model.author != null,
                      child: AvatarWidget(author: model.author, size: 52.0),
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: model.author != null ? 10.0 : 4.0,
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
                                    text: model.body
                                        .substring(0, model.body.indexOf(' ')),
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      height: 1.1,
                                      fontWeight: FontWeight.w500,
                                      color: model.author != null
                                          ? Utils.getAuthorColor(
                                              model.author.color, context)
                                          : Theme.of(context)
                                              .textTheme
                                              .headline
                                              .color,
                                    ),
                                  ),
                                  TextSpan(
                                    text: model.body
                                        .substring(model.body.indexOf(' '),
                                            model.body.length)
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
                              Utils.getSimpleDate(model.date),
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
                      visible: model.isNew,
                      child: Container(
                        width: 14.0,
                        height: 14.0,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.green),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
