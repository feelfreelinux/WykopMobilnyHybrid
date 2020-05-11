import 'package:flutter/material.dart';
import 'package:owmflutter/models/models.dart' as Models;
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:owmflutter/utils/utils.dart';
import 'package:share/share.dart';

class RelatedWidget extends StatelessWidget {
  final Models.Related related;
  final int count;

  RelatedWidget({
    this.related,
    this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 12.0, right: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 25.0, bottom: 12.0),
            child: GestureDetector(
              onTap: () => _openUserDialog(context, related.author),
              child: AvatarWidget(author: related.author, size: 34.0),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      constraints: BoxConstraints.loose(
                        Size(MediaQuery.of(context).size.width - 78.0,
                            double.infinity),
                      ),
                      margin: EdgeInsets.only(left: 8.0, top: 0.0, right: 2.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                                left: 12.0,
                                right: 96.0 + _votePadding(related.voteCount),
                                top: 6.0,
                                bottom: 4.0),
                            child: GestureDetector(
                              onTap: () =>
                                  _openUserDialog(context, related.author),
                              child: Text(
                                related.author.login,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Utils.getAuthorColor(
                                      related.author.color, context),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Utils.backgroundGrey(context),
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () =>
                                      Utils.launchURL(related.url, context),
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(12, 9, 12, 4),
                                    child: Text(
                                      related.title,
                                      style: TextStyle(fontSize: 16.0),
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(
                                          bottom: 8.0, left: 12.0),
                                      child: Text(
                                        "źródło: ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () =>
                                          Utils.launchURL(related.url, context),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            bottom: 8.0, right: 6.0),
                                        child: Text(
                                          related.url
                                              .replaceAll('https://', '')
                                              .replaceAll('http://', '')
                                              .replaceAll('www.', '')
                                              .split('/')[0],
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () => Share.share(
                                          "${related.title}\r\n${related.url}"),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            bottom: 8.0,
                                            left: 4.0,
                                            right: 12.0),
                                        child: Text("Udostępnij"),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 5.0,
                      right: 0.0,
                      child: Row(
                        children: <Widget>[
                          AnimatedContainer(
                            duration: Duration(milliseconds: 400),
                            curve: Curves.easeInOutQuart,
                            padding: EdgeInsets.all(15.0 / 3.5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                  color: Theme.of(context).backgroundColor,
                                  width: 2.0),
                              color: Utils.voteBackgroundStateColor(
                                context,
                                isComment: true,
                                isSelected: false,
                                negativeIcon: false,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  right: 15.0 / 3.5, left: 15.0 / 3.5),
                              child: Text(
                                (related.voteCount > 0 ? "+" : "") +
                                    related.voteCount.toString(),
                                style: TextStyle(
                                  color: related.voteCount > 0
                                      ? Colors.green[800]
                                      : related.voteCount < 0
                                          ? Colors.red[800]
                                          : null,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          VoteButton(
                            isSelected: related.isVoted,
                            isComment: true,
                            onlyIcon: true,
                            onClicked: () {},
                          ),
                          VoteButton(
                            isSelected: related.isVoted,
                            isComment: true,
                            onlyIcon: true,
                            negativeIcon: true,
                            onClicked: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _openUserDialog(BuildContext context, Author author) {
    showDialog(
      context: context,
      builder: (_) => UserDialogWidget(author: author),
    );
  }

  double _votePadding(int i) {
    if (i < 10 && i > 0) return 15.0;
    if (i < 100 && i > 9) return 25.0;
    if (i < 1000 && i > 99) return 30.0;
    if (i > 999) return 40.0;
    return 0.0;
  }
}
