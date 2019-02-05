import 'package:flutter/material.dart';
import 'package:owmflutter/api/api.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:owmflutter/screens/screens.dart';
import 'package:owmflutter/utils/utils.dart';

class ConversationsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<List<Conversation>>(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                var conversation = snapshot.data[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(Utils.getPageTransition(PmScreen(
                      conversation: conversation,
                    )));
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
                            conversation.author != null
                                ? AvatarWidget(
                                    author: conversation.author,
                                    size: 36.0,
                                  )
                                : Container(),
                            Flexible(
                              fit: FlexFit.tight,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: 12.0,
                                  right: 8.0,
                                ),
                                child: RichText(
                                    text: TextSpan(children: [
                                  TextSpan(
                                    text: conversation.author.login,
                                    style: TextStyle(
                                        fontSize: 13.5,
                                        height: 1.1,
                                        fontWeight: FontWeight.w500,
                                        color: Utils.getAuthorColor(
                                            conversation.author, context)),
                                  ),
                                  TextSpan(
                                    text: '\n' +
                                        Utils.getSimpleDate(
                                            conversation.lastUpdate),
                                    style: TextStyle(
                                      fontSize: 11.5,
                                      height: 1.3,
                                      color: Theme.of(context)
                                          .textTheme
                                          .caption
                                          .color,
                                    ),
                                  ),
                                ])),
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
                );
              },
            );
          }
          return Center(child: CircularProgressIndicator());
        },
        future: api.pm.getConversations(),
      ),
    );
  }
}
