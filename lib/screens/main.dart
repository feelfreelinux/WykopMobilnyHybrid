import 'package:flutter/material.dart';
import 'package:owmflutter/screens/screens.dart';
import 'package:owmflutter/keys.dart';

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
    MikroblogScreen(),
    MyWykopScreen(),
    NotificationsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      key: OwmKeys.mainScaffoldKey,
      body: _children[_currentIndex],
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(
          Icons.create,
          color: Theme.of(context).accentColor,
        ),
        onPressed: () {},
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Theme.of(context).primaryColor,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _iconButton(Icons.home, 0, "Strona główna"),
            _iconButton(Icons.add_box, 1, "Mikroblog"),
            _iconButton(Icons.loyalty, 2, "Mój Wykop"),
            _iconButton(Icons.mail, 3, "Powiadomienia", badge: 0),
          ],
        ),
      ),
    );
  }

  Widget _iconButton(IconData icon, num index, String tooltip, {num badge = 0}) {
    return IconButton(
      icon: Stack(
        children: <Widget>[
          Icon(
            icon,
            size: 26.0,
          ),
          Positioned(
            top: 0,
            right: 0,
            child: badge != 0
                ? Container(
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: 1.0,
                      horizontal: 3.0,
                    ),
                    child: Text(
                      badge.toString(),
                      style: TextStyle(
                        fontSize: 8.0,
                        color: Colors.white,
                      ),
                    ),
                  )
                : Container(),
          ),
        ],
      ),
      color: _currentIndex == index
          ? Theme.of(context).accentColor
          : Theme.of(context).textTheme.caption.color,
      onPressed: () => this.setState(() {
            this._currentIndex = index;
          }),
      tooltip: tooltip,
    );
  }
}
