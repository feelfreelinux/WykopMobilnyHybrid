import 'package:flutter/material.dart';
import 'package:owmflutter/widgets/pm/message.dart';
import 'package:owmflutter/widgets/widgets.dart';

class PmWidget extends StatefulWidget {
  final AsyncSnapshot snapshot;

  const PmWidget({
    @required this.snapshot,
  });

  _PmWidgetState createState() => _PmWidgetState();
}

class _PmWidgetState extends State<PmWidget> {
  @override
  Widget build(BuildContext context) {
    return ShadowNotificationListener(
      child: ListView.builder(
        reverse: true,
        itemCount: widget.snapshot.data.length,
        itemBuilder: (context, index) {
          var message = widget.snapshot.data.reversed.toList()[index];
          return MessageWidget(message: message);
        },
      ),
    );
  }
}
