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
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).primaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _iconButton(Icons.home, 0, "Strona główna"),
            _iconButton(Icons.add_box, 1, "Mikroblog"),
            _iconCreateButton(),
            _iconButton(Icons.loyalty, 2, "Mój Wykop"),
            _iconButton(Icons.mail, 3, "Powiadomienia"),
          ],
        ),
      ),
    );
  }

  Widget _iconCreateButton() {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).textTheme.caption.color.withOpacity(0.3),
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        IconButton(
          iconSize: 22.0,
          icon: Icon(Icons.create),
          color: Theme.of(context).textTheme.caption.color,
          onPressed: () {},
          tooltip: "Dodaj nowy",
        ),
      ],
    );
  }

  Widget _iconButton(IconData icon, num index, String tooltip) {
    return IconButton(
      iconSize: 26.0,
      icon: Icon(icon),
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
