import 'package:flutter/material.dart';
import 'package:owmflutter/api/api.dart';
import 'package:owmflutter/widgets/pm/pm.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/keys.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:owmflutter/store/store.dart';
import 'package:owmflutter/widgets/pm/uset_appbar.dart';
import 'dart:async';

class PmScreen extends StatefulWidget {
  final Conversation conversation;

  PmScreen({this.conversation});

  _PmScreenState createState() => _PmScreenState();
}

class _PmScreenState extends State<PmScreen>
    with SingleTickerProviderStateMixin {
  bool appbarShadow = true;
  bool inputShadow = false;

  _appbarShadow(bool visible) {
    if (visible != appbarShadow)
      setState(() {
        appbarShadow = visible;
      });
  }

  _inputShadow(bool visible) {
    if (visible != inputShadow)
      setState(() {
        inputShadow = visible;
      });
  }

  @override
  Widget build(BuildContext context) {
    final mqData = MediaQuery.of(context);
    final mqDataNew = mqData.copyWith(textScaleFactor: 1.0);
    return _SystemPadding(
      child: MediaQuery(
        data: mqDataNew,
        child: Scaffold(
          bottomNavigationBar: StoreConnector<AppState, dynamic>(
            converter: (store) =>
                (Completer completer, InputData inputData) => {},
            builder: (context, callback) => InputBarWidget(
              (inputData) {
                var completer = Completer();
                callback(completer, inputData);
                return completer.future;
              },
              key: OwmKeys.inputBarKey,
              iconsColor: Colors.deepOrange,
              shadow: inputShadow,
              hintText: "Napisz wiadomość",
            ),
          ),
          resizeToAvoidBottomPadding: false,
          appBar: AppbarNormalWidget(
            shadow: appbarShadow,
            leading: AppBarButton(
              icon: Icons.arrow_back,
              onTap: () => Navigator.of(context).pop(),
              iconSize: 28.0,
              iconColor: Colors.deepOrange,
            ),
            center: UserAppBar(
              conversation: widget.conversation,
              onTap: () {
                //TODO: Dodać przekierowanie do profilu
              },
            ),
          ),
          body: FutureBuilder<List<PmMessage>>(
            future: api.pm.getMessages(widget.conversation.author.login),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                debugPrint(snapshot.error.toString());
              }
              if (snapshot.hasData) {
                return PmWidget(
                  snapshot: snapshot,
                  appbarShadow: _appbarShadow,
                  inputShadow: _inputShadow,
                );
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}

class _SystemPadding extends StatelessWidget {
  final Widget child;

  _SystemPadding({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return new AnimatedContainer(
        padding: mediaQuery.viewInsets,
        duration: const Duration(milliseconds: 150),
        child: child);
  }
}
