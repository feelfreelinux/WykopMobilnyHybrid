import 'package:flutter/material.dart';
import 'package:owmflutter/models/models.dart' as Models;
import 'package:owmflutter/widgets/widgets.dart';
import 'package:owmflutter/utils/utils.dart';

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
      width: MediaQuery.of(context).size.width - (count > 1 ? 48.0 : 32.0),
      decoration: BoxDecoration(
        color: Utils.backgroundGrey(context),
        borderRadius: BorderRadius.circular(14.0),
      ),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _drawHeader(context, related),
          _drawTitle(context, related),
          _drawLinkFavicon(context, related.url),
        ],
      ),
    );
  }

  Widget _drawHeader(BuildContext context, Models.Related related) {
    return Row(
      children: <Widget>[
        related?.author != null ? AvatarWidget(
          author: related.author,
          size: 26.0,
          borderColor: Utils.backgroundGrey(context),
        ) : Container(),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: related?.author != null ? Text(
              related.author.login,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Utils.getAuthorColor(related.author.color, context),
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
              ),
            ) : Container(),
          ),
        ),
        VoteButton(
          onlyIcon: true,
          isSelected: related.isVoted,
          isComment: true,
          onClicked: () {}, //TODO: glosy powiazanych
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            (related.voteCount > 0 ? "+" : "") + related.voteCount.toString(),
            style: TextStyle(
              color: related.voteCount > 0
                  ? Colors.green[800]
                  : related.voteCount < 0 ? Colors.red[800] : null,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        VoteButton(
          negativeIcon: true,
          onlyIcon: true,
          isSelected: related.isVoted,
          isComment: true,
          onClicked: () {}, //TODO: glosy powiazanych
        ),
      ],
    );
  }

  Widget _drawTitle(BuildContext context, Models.Related related) {
    return GestureDetector(
      onTap: () => Utils.launchURL(related.url, context),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: Text(related.title, overflow: TextOverflow.ellipsis),
      ),
    );
  }

  Widget _drawLinkFavicon(BuildContext context, String link) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        GestureDetector(
          onTap: () => Utils.launchURL(link, context),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(25 / 3.5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 2.0,
                      offset: Offset(0.0, 1.0),
                    )
                  ],
                  color: Utils.voteBackgroundStateColor(
                    context,
                    isComment: true,
                    isSelected: false,
                    negativeIcon: false,
                  ),
                ),
                child: Image(
                  image: NetworkImage(
                    'http://s2.googleusercontent.com/s2/favicons?domain_url=' +
                        link,
                  ),
                  height: 10.0 * 1.19,
                  width: 10.0 * 1.19,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.0),
                child: Text(
                  link
                      .replaceAll('https://', '')
                      .replaceAll('http://', '')
                      .replaceAll('www.', '')
                      .split('/')[0],
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 12.0),
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          //TODO: udostepnienie powiazanych
          child: Container(
            padding: EdgeInsets.all(21 / 3.5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 2.0,
                  offset: Offset(0.0, 1.0),
                )
              ],
              color: Utils.voteBackgroundStateColor(
                context,
                isComment: true,
                isSelected: false,
                negativeIcon: false,
              ),
            ),
            child: Icon(Icons.share, size: 12.0 * 1.19),
          ),
        )
      ],
    );
  }
}
