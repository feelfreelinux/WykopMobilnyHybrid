import 'package:flutter/material.dart';
import 'package:owmflutter/screens/screens.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeScreen(),
    MyWykopScreen(),
    MikroblogScreen(),
    NotificationsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      floatingActionButton: FloatingActionButton(
        child: Icon(FontAwesomeIcons.pen, size: 20.0,),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 12.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _iconButton(FontAwesomeIcons.home, 0, "Strona główna"),
              _iconButton(FontAwesomeIcons.userTag, 1, "Mój Wykop"),
              _iconButton(FontAwesomeIcons.solidPlusSquare, 2, "Mikroblog"),
              _iconButton(FontAwesomeIcons.solidEnvelope, 3, "Powiadomienia"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _iconButton(IconData icon, num index, String tooltip) {
    return IconButton(
      iconSize: 20.0,
      icon: Icon(icon),
      color: Color(_currentIndex == index ? 0xff3c84c1 : 0xff666666),
      onPressed: () => this.setState(() {
            this._currentIndex = index;
          }),
      tooltip: tooltip,
    );
  }
}
