import 'package:flutter/material.dart';
import 'package:owmflutter/screens/screens.dart';
import 'package:owmflutter/store/store.dart';
import 'package:owmflutter/utils/utils.dart';
import 'package:flutter_redux/flutter_redux.dart';

typedef void LoginCallback(String login, String token);

class AppbarUserWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
      child: StoreConnector<AppState, AuthState>(
        onInit: (store) => store.dispatch(syncStateWithApi()),
        converter: (store) => store.state.authState,
        builder: (context, authState) {
          return InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {
              Navigator.of(context).push(
                Utils.getPageTransition(
                  MainSettingsScreen(),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(authState.loggedIn
                      ? authState.avatarUrl
                      : "https://www.wykop.pl/cdn/c3397992/avatar_def,q80.png"),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
