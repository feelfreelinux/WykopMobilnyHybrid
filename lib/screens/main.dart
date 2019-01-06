import 'package:flutter/material.dart';
import 'package:owmflutter/screens/screens.dart';
import 'package:owmflutter/keys.dart';
import 'package:owmflutter/owm_glyphs.dart';
import 'package:owmflutter/widgets/widgets.dart';

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
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).primaryColor,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _iconButton(Icons.home, 0, "Strona główna"),
            _iconButton(Icons.add_box, 1, "Mikroblog"),
            _addNewButton(),
            _iconButton(Icons.loyalty, 2, "Mój Wykop"),
            _iconButton(Icons.mail, 3, "Powiadomienia", badge: 0),
          ],
        ),
      ),
    );
  }

  Widget _addNewButton() {
    return Container(
      margin: EdgeInsets.all(8.0),
      width: 36.0,
      height: 36.0,
      child: FloatingActionButton(
        child: Icon(
          Icons.create,
          size: 22.0,
        ),
        tooltip: "Dodaj",
        foregroundColor: Theme.of(context).primaryColor,
        backgroundColor: Theme.of(context).textTheme.caption.color,
        elevation: 0.0,
        onPressed: () {
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return NotLoggedWidget(
                icon: Icons.account_circle,
                fullText: "Dodawanie treści będzie możliwe po zalogowaniu.",
                child: Container(
                  padding: EdgeInsets.all(7.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(14.0),
                        child: Text(
                          "NAPISZ COŚ OD SIEBIE",
                          style: TextStyle(
                            fontSize: 13.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          _iconAddNewButton(OwmGlyphs.ic_buttontoolbar_wykop,
                              "ZNALEZISKO", () {}),
                          _iconAddNewButton(Icons.add_box, "WPIS", () {}),
                          _iconAddNewButton(Icons.mail, "WIADOMOŚĆ", () {}),
                        ],
                      ),
                      Container(
                        width: 34.0,
                        height: 34.0,
                        child: FloatingActionButton(
                          child: Icon(Icons.close),
                          foregroundColor: Theme.of(context).primaryColor,
                          backgroundColor:
                              Theme.of(context).textTheme.caption.color,
                          elevation: 0.0,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _iconAddNewButton(
      IconData icon, String title, VoidCallback onPressed) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          FloatingActionButton(
            elevation: 1.0,
            highlightElevation: 8.0,
            onPressed: onPressed,
            child: Icon(icon),
          ),
          GestureDetector(
            onTap: onPressed,
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 11.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _iconButton(IconData icon, num index, String tooltip,
      {num badge = 0}) {
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
