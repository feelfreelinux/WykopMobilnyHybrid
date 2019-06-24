import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage/flutter_advanced_networkimage.dart';
import 'package:owmflutter/api/api.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/utils/utils.dart';
import 'package:owmflutter/keys.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:owmflutter/store/store.dart';
import 'dart:async';

class PmScreen extends StatelessWidget {
  final Conversation conversation;
  PmScreen({this.conversation});

  @override
  Widget build(BuildContext context) {
    return _SystemPadding(
      child: Scaffold(
        bottomNavigationBar: StoreConnector<AppState, dynamic>(
            converter: (store) =>
                (Completer completer, InputData inputData) => {},
            builder: (context, callback) => InputBarWidget((inputData) {
                  var completer = Completer();
                  callback(completer, inputData);
                  return completer.future;
                })),
        appBar: AppbarNormalWidget(
            leading: PmUserAppBar(author: conversation.author),
            title: 'Konwersacja z ' + conversation.author.login),
        body: Container(
            child: FutureBuilder<List<PmMessage>>(
                future: api.pm.getMessages(conversation.author.login),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    debugPrint(snapshot.error.toString());
                  }
                  if (snapshot.hasData) {
                    return ListView.builder(
                        reverse: true,
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          var message = snapshot.data.reversed.toList()[index];
                          return new PmMessageWidget(message: message);
                        });
                  }
                  return Center(child: CircularProgressIndicator());
                })),
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

class PmMessageWidget extends StatelessWidget {
  const PmMessageWidget({
    Key key,
    @required this.message,
  }) : super(key: key);

  final PmMessage message;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          mainAxisAlignment: message.isSentFromUser
              ? MainAxisAlignment.end
              : MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Container(
                  constraints: BoxConstraints.loose(
                      Size(MediaQuery.of(context).size.width, double.infinity)),
                  decoration: BoxDecoration(
                      color: message.isSentFromUser
                          ? Theme.of(context).accentColor
                          : Theme.of(context).cardColor,
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: message.isSentFromUser
                          ? CrossAxisAlignment.end
                          : CrossAxisAlignment.start,
                      children: [
                        BodyWidget(
                          body: message.body,
                          ellipsize: false,
                          padding: EdgeInsets.all(0),
                        ),
                        Text(
                          Utils.getSimpleDate(message.date),
                          style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.display1.color),
                        )
                      ],
                    ),
                  )),
            )
          ],
        ));
  }
}

class PmUserAppBar extends StatelessWidget {
  final Author author;
  PmUserAppBar({@required this.author});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 12.0,
      ),
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AdvancedNetworkImage(
                this.author.avatar,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
