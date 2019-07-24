import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage/provider.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/utils/utils.dart';

class UserAppBar extends StatelessWidget {
  final Conversation conversation;
  final double size;
  final VoidCallback onTap;

  UserAppBar({
    @required this.conversation,
    this.size = 38.0,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 4.0),
          child: GestureDetector(
            onTap: onTap,
            child: Stack(
              children: <Widget>[
                Container(
                  width: size,
                  height: size,
                  padding: EdgeInsets.all(size / 4.5),
                  decoration: BoxDecoration(
                    color: Utils.backgroundGreyOpacity(context),
                    shape: BoxShape.circle,
                  ),
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                        Theme.of(context).iconTheme.color),
                    strokeWidth: size / 18.0,
                  ),
                ),
                Container(
                  width: size,
                  height: size,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AdvancedNetworkImage(conversation.author.avatar),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                conversation.author.login,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                Utils.getSimpleDate(conversation.lastUpdate),
                style: TextStyle(
                  height: 1.2,
                  color: Theme.of(context).textTheme.caption.color,
                  fontSize: 13.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
