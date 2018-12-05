import 'package:flutter/material.dart';
import 'package:owmflutter/screens/screens.dart';

/**
 * Shows a user in mikroblog text. Each user has its own colors assigned.
 */
class UserWidget extends StatelessWidget {
  final String user;
  UserWidget(this.user);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {},
        child: Container(
            margin: EdgeInsets.only(top: 0.4, bottom: 1.0),
            padding:
                EdgeInsets.only(left: 5.5, top: 1.0, right: 5.5, bottom: 2.0),
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.red,
                  Colors.orange,
                  Colors.yellow,
                  Colors.green,
                  Colors.blue,
                  Colors.purple
                ]),
                borderRadius: BorderRadius.circular(20.0)),
            child: Text('@' + this.user,
                style: TextStyle(color: Colors.white, fontSize: 13.0))));
  }
}
