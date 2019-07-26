import 'package:flutter/material.dart';
import 'package:owmflutter/api/api.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:owmflutter/screens/screens.dart';
import 'package:owmflutter/utils/utils.dart';

class ConversationsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Conversation>>(
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              var conversation = snapshot.data[index];
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    Utils.getPageTransition(
                      PmScreen(conversation: conversation),
                    ),
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
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
                            visible: conversation.author != null,
                            child: AvatarWidget(
                              author: conversation.author,
                              size: 52.0,
                            ),
                          ),
                          Flexible(
                            fit: FlexFit.tight,
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: 12.0,
                                right: 8.0,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    conversation.author.login,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      height: 1.1,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    Utils.getSimpleDate(
                                        conversation.lastUpdate),
                                    style: TextStyle(
                                      fontSize: 14.0,
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
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
      future: api.pm.getConversations(),
    );
  }
}
