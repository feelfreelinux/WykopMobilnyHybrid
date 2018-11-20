import 'package:flutter/material.dart';
import 'package:owmflutter/screens/screens.dart';
import 'package:owmflutter/store/store.dart';
import 'package:flutter_redux/flutter_redux.dart';

class AppbarUserWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: StoreConnector<AppState, AuthState>(
            onInit: (store) => store.dispatch(syncStateWithApi()),
            converter: (store) => store.state.authState,
            builder: (context, authState) {
              return InkWell(
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
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Container(
                        width: 1,
                        height: 1,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(authState.loggedIn
                                    ? authState.avatarUrl
                                    : "https://www.wykop.pl/cdn/c3397992/avatar_def,q80.png")))),
                  ));
            }));
  }
}
