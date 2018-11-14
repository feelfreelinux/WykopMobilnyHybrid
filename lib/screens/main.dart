import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:owmflutter/store/store.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:owmflutter/screens/screens.dart';
import 'package:owmflutter/owm_glyphs.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MikroblogScreen(),
        floatingActionButton: new FloatingActionButton(
          child: const Icon(OwmGlyphs.ic_pen),
          onPressed: () {},
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        bottomNavigationBar: BottomAppBar(
            child: new Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: new Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(OwmGlyphs.ic_navi_links),
                onPressed: () {},
                color: Color(0xff666666),
              ),
              IconButton(
                icon: Icon(OwmGlyphs.ic_navi_my_wykop),
                onPressed: () {},
                color: Color(0xff666666),
              ),
              IconButton(
                icon: Icon(OwmGlyphs.ic_navi_mirkoblog),
                onPressed: () {},
                color: Color(0xff3c84c1),
              ),
              IconButton(
                icon: Icon(OwmGlyphs.ic_navi_favourite),
                onPressed: () {},
                color: Color(0xff666666),
              ),
              IconButton(
                icon: Icon(OwmGlyphs.ic_navi_messages),
                onPressed: () {},
                color: Color(0xff666666),
              ),
            ],
          ),
        )));
  }
}
