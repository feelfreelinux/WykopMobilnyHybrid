import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:owmflutter/api/api.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/keys.dart';
import 'dart:async';

class PmScreen extends StatelessWidget {
  final Conversation conversation;
  PmScreen({this.conversation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Container(
              child: FutureBuilder<List<PmMessage>>(
                  future: api.pm.getMessages(conversation.author.login),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          reverse: true,
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            var message = snapshot.data[index];
                            return Text(message.body, textAlign: message.isSentFromUser ? TextAlign.right : TextAlign.left);
                          });
                    }
                    return Center(child: CircularProgressIndicator());
                  })),
    );
  }
}
