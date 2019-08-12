import 'package:flutter/material.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/widgets/pm/message.dart';
import 'package:owmflutter/widgets/widgets.dart';

class PmWidget extends StatefulWidget {
  final List<PmMessage> messages;

  const PmWidget({
    @required this.messages,
  });

  _PmWidgetState createState() => _PmWidgetState();
}

class _PmWidgetState extends State<PmWidget> {
  @override
  Widget build(BuildContext context) {
    return ShadowNotificationListener(
          child: ListView.builder(
        reverse: true,
        itemCount: widget.messages.length,
        itemBuilder: (context, index) {
          var message = widget.messages.reversed.toList()[index];
          return MessageWidget(message: message);
        },
      ),
    );
  }
}
