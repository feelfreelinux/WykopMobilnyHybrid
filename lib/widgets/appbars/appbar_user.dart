import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage/provider.dart';
import 'package:owmflutter/screens/screens.dart';
import 'package:owmflutter/store/store.dart';
import 'package:owmflutter/utils/utils.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'dart:async';

typedef void LoginCallback(String login, String token, Completer completer);

class AppbarUserWidget extends StatelessWidget {
  final double size;
  final EdgeInsets margin;

  AppbarUserWidget({
    this.size: 36.0,
    this.margin: const EdgeInsets.symmetric(horizontal: 8.0),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: StoreConnector<AppState, AuthState>(
        onInit: (store) => store.dispatch(syncStateWithApi()),
        converter: (store) => store.state.authState,
        builder: (context, authState) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                Utils.getPageSlideToUp(MainSettingsScreen()),
              );
            },
            child: Stack(
              children: <Widget>[
                Container(
                  width: size,
                  height: size,
                  padding: EdgeInsets.all(size / 4.5),
                  decoration: BoxDecoration(
                    color: Utils.backgroundGreyOpacity(context),
                    shape: BoxShape.circle,
                  ),
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                        Theme.of(context).iconTheme.color),
                    strokeWidth: size / 18.0,
                  ),
                ),
                Container(
                  width: size,
                  height: size,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: authState.loggedIn
                          ? AdvancedNetworkImage(
                              authState.avatarUrl,
                              useDiskCache: true,
                            )
                          : AssetImage(
                              'assets/avatar.png',
                            ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
