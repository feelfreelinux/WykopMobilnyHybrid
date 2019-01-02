import 'package:flutter/material.dart';

/*
 * Shows a user in mikroblog text. Each user has its own colors assigned.
 */
class UserWidget extends StatelessWidget {
  final String user;
  UserWidget(this.user);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text('@'),
          Text(
            this.user,
            style: TextStyle(
              color: Colors.blueAccent,
            ),
          ),
        ],
      ),
    );
  }
}
