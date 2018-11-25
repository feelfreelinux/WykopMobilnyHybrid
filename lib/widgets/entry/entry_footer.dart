import 'package:flutter/material.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/owm_glyphs.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:owmflutter/screens/screens.dart';

class EntryFooterWidget extends StatelessWidget {
  final Entry entry;
  EntryFooterWidget({this.entry});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36.0,
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FooterIconButton(
              icon: OwmGlyphs.ic_buttontoolbar_share,
              onClicked: () {},
            ),
            FavoriteButton(
              onClicked: () {},
            ),
            Expanded(child: Container()),
            CommentsButton(
              count: entry.commentsCount,
              onClicked: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (BuildContext context,
                        Animation<double> animation,
                        Animation<double> secondaryAnimation) {
                      return EntryScreen(entryId: entry.id);
                    },
                    transitionsBuilder:
                        (context, animation1, animation2, child) {
                      return FadeTransition(
                        opacity: Tween<double>(begin: 0.0, end: 1.0)
                            .animate(animation1),
                        child: child,
                      );
                    },
                    transitionDuration: Duration(milliseconds: 400),
                  ),
                );
              },
            )
          ]),
    );
  }
}
