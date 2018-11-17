import 'package:flutter/material.dart';
import 'package:owmflutter/screens/screens.dart';

class AppbarUserWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () {
Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (BuildContext context,
                        Animation<double> animation,
                        Animation<double> secondaryAnimation) {
                      return LoginScreen();
                    },
                    transitionsBuilder:
                        (context, animation1, animation2, child) {
                      return FadeTransition(
                        opacity: Tween<double>(begin: 0, end: 1)
                            .animate(animation1),
                        child: child,
                      );
                    },
                    transitionDuration: Duration(milliseconds: 400),
                  ),
                );        },
        child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Container(
          width: 1,
          height: 1,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(
              "https://www.wykop.pl/cdn/c3397992/avatar_def,q80.png")))),
            )
          ),
    );
  }
}