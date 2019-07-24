import 'package:flutter/material.dart';
import 'package:owmflutter/widgets/pm/message.dart';

class PmWidget extends StatefulWidget {
  final AsyncSnapshot snapshot;
  final ValueChanged<bool> appbarShadow;
  final ValueChanged<bool> inputShadow;

  const PmWidget({
    @required this.snapshot,
    this.appbarShadow,
    this.inputShadow,
  });

  _PmWidgetState createState() => _PmWidgetState();
}

class _PmWidgetState extends State<PmWidget> {
  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (scrollNotification) {
        if (scrollNotification is ScrollUpdateNotification) {
          if (scrollNotification.metrics.pixels <
              scrollNotification.metrics.maxScrollExtent) {
            widget.appbarShadow(true);
            widget.inputShadow(true);
          }
          if (scrollNotification.metrics.pixels >=
              scrollNotification.metrics.maxScrollExtent) {
            widget.appbarShadow(false);
          }
          if (scrollNotification.metrics.pixels <=
              scrollNotification.metrics.minScrollExtent) {
            widget.inputShadow(false);
          }
        }
        return;
      },
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
