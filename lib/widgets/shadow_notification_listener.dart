import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:owmflutter/model/shadow_control_model.dart';
import 'package:provider/provider.dart';

class ShadowNotificationListener extends StatefulWidget {
  final Widget child;
  final bool hideOnAllTop;
  final ScrollController scrollController;
  ShadowNotificationListener(
      {this.child, this.scrollController, this.hideOnAllTop = false});

  @override
  _ShadowNotificationListenerState createState() =>
      _ShadowNotificationListenerState();
}

class _ShadowNotificationListenerState
    extends State<ShadowNotificationListener> {
  ShadowControlModel model;

  @override
  void initState() {
    super.initState();
    model = Provider.of<ShadowControlModel>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (scrollNotification) {
        model.updateNotificationState(scrollNotification.metrics.pixels,
            scrollNotification.metrics.maxScrollExtent,
            hideOnAllTop: widget.hideOnAllTop,
            scrollDirection: widget.scrollController != null
                ? widget.scrollController.position.userScrollDirection
                : ScrollDirection.reverse);
        return false;
      },
      child: widget.child,
    );
  }
}
