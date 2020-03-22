import 'package:flutter/material.dart';
import 'package:owmflutter/model/profile_related_model.dart';
import 'package:owmflutter/utils/utils.dart';
import 'package:share/share.dart';
import 'package:provider/provider.dart';

class ProfileRelatedWidget extends StatelessWidget {
  ProfileRelatedWidget();

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileRelatedModel>(
      builder: (context, model, _) => Container(
        key: Key(model.id.toString()),
        decoration: BoxDecoration(
          color: Utils.backgroundGrey(context),
          borderRadius: BorderRadius.circular(14.0),
        ),
        margin: EdgeInsets.symmetric(horizontal: 14.0, vertical: 6.0),
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _drawHeader(context, model),
            _drawLinkFavicon(context, model.url, model.title),
          ],
        ),
      ),
    );
  }

  Widget _drawHeader(BuildContext context, ProfileRelatedModel related) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: GestureDetector(
              onTap: () => Utils.launchURL(related.url, context),
              child: Text(
                related.title,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 6.0),
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 2.0,
                  offset: Offset(0.0, 1.0),
                )
              ],
              color: Utils.backgroundCommentButton(context),
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
        ],
      ),
    );
  }

  Widget _drawLinkFavicon(BuildContext context, String link, String title) {
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
          onTap: () => Share.share(title + "\r\n" + link),
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
