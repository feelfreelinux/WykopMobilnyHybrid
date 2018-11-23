import 'package:flutter/material.dart';
import 'package:owmflutter/screens/screens.dart';
import 'package:owmflutter/owm_glyphs.dart';
// import 'package:owmflutter/widgets/bottom_navigation_dot_bar.dart';

class MainScreen extends StatefulWidget {

  @override
    State<StatefulWidget> createState() {
      return _MainScreenState();
    }
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final List<Widget> _children = [HomeScreen(), Text('todo xD'), MikroblogScreen(), Text('TODO'), Text('TODO') ];
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _children[_currentIndex],
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
                onPressed: () => this.setState(() { this._currentIndex = 0; }),
                color: Color(_currentIndex == 0 ? 0xff3c84c1 : 0xff666666),
              ),
              IconButton(
                icon: Icon(OwmGlyphs.ic_navi_my_wykop),
                onPressed: () => this.setState(() { this._currentIndex = 1; }),
                color: Color(_currentIndex == 1 ? 0xff3c84c1 : 0xff666666),
              ),
              IconButton(
                icon: Icon(OwmGlyphs.ic_navi_mirkoblog),
                onPressed: () => this.setState(() { this._currentIndex = 2; }),
                color: Color(_currentIndex == 2 ? 0xff3c84c1 : 0xff666666),
              ),
              IconButton(
                icon: Icon(OwmGlyphs.ic_navi_favourite),
                onPressed: () => this.setState(() { this._currentIndex = 3; }),
                color: Color(_currentIndex == 3 ? 0xff3c84c1 : 0xff666666),
              ),
              IconButton(
                icon: Icon(OwmGlyphs.ic_navi_messages),
                onPressed: () => this.setState(() { this._currentIndex = 4; }),
                color: Color(_currentIndex == 4 ? 0xff3c84c1 : 0xff666666),
              ),
            ],
          ),
        )));
    //         bottomNavigationBar:
    //     BottomNavigationDotBar(items: <BottomNavigationDotBarItem>[
    //   BottomNavigationDotBarItem(
    //     icon: OwmGlyphs.ic_navi_links,
    //   ),
    //   BottomNavigationDotBarItem(
    //       icon: OwmGlyphs.ic_navi_my_wykop, onTap: () {}),
    //   BottomNavigationDotBarItem(
    //       icon: OwmGlyphs.ic_navi_mirkoblog, onTap: () {}),
    //   BottomNavigationDotBarItem(
    //       icon: OwmGlyphs.ic_navi_favourite, onTap: () {}),
    //   BottomNavigationDotBarItem(
    //       icon: OwmGlyphs.ic_navi_messages, onTap: () {}),
    // ]));
  }
}
