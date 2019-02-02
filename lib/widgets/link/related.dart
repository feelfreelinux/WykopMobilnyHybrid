import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage/flutter_advanced_networkimage.dart';
import 'package:owmflutter/models/models.dart' as Models;
import 'package:owmflutter/widgets/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:owmflutter/store/store.dart';
import 'package:owmflutter/utils/utils.dart';

class RelatedWidget extends StatelessWidget {
  final int id;
  final int count;
  RelatedWidget({
    this.id,
    this.count,
  });

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Models.Related>(
      key: Key(id.toString()),
      converter: (store) => store.state.entitiesState.relatedLinks[id],
      builder: (context, related) {
        return Container(
          width: MediaQuery.of(context).size.width - (count > 1 ? 48.0 : 32.0),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.withOpacity(0.16),
              width: 0.6,
            ),
            borderRadius: BorderRadius.circular(14.0),
          ),
          margin: EdgeInsets.symmetric(
            horizontal: 8.0,
          ),
          padding: EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 12.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _drawHeader(context, related),
              _drawTitle(context, related),
              _drawLinkFavicon(context, related.url),
            ],
          ),
        );
      },
    );
  }

  Widget _drawHeader(BuildContext context, dynamic related) {
    return Row(
      children: <Widget>[
        AvatarWidget(
          author: related.author,
          size: 26.0,
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 8.0,
            ),
            child: Text(
              related.author.login,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Utils.getAuthorColor(related.author, context),
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        StoreConnector<AppState, VoidCallback>(
          // TODO add voting support for related
          converter: (state) => () => {},
          builder: (context, callback) => VoteButton(
              onlyIcon: true,
              isSelected: related.isVoted,
              onClicked: () {
                callback();
              }),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 8.0,
          ),
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
        StoreConnector<AppState, VoidCallback>(
          // TODO add voting support for related
          converter: (state) => () => {},
          builder: (context, callback) => VoteButton(
              negativeIcon: true,
              onlyIcon: true,
              isSelected: related.isVoted,
              onClicked: () {
                callback();
              }),
        ),
      ],
    );
  }

  Widget _drawTitle(BuildContext context, dynamic related) {
    return GestureDetector(
      onTap: () => Utils.launchURL(related.url),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 8.0,
        ),
        child: Text(
          related.title,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }

  Widget _drawLinkFavicon(BuildContext context, String link) {
    return GestureDetector(
      onTap: () => Utils.launchURL(link),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Image(
              image: AdvancedNetworkImage(
                'http://s2.googleusercontent.com/s2/favicons?domain_url=' +
                    link,
              ),
              height: 10.0,
              width: 10.0,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 6.0,
              ),
              child: Text(
                link
                    .replaceAll('https://', '')
                    .replaceAll('http://', '')
                    .replaceAll('www.', '')
                    .split('/')[0],
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 12.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
