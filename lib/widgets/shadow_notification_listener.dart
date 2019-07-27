import 'package:flutter/material.dart';
import 'package:owmflutter/model/shadow_control_model.dart';
import 'package:provider/provider.dart';

class ShadowNotificationListener extends StatelessWidget {
  final Widget child;

  ShadowNotificationListener({this.child});

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          var model = Provider.of<ShadowControlModel>(context, listen: false);
          model.updateNotificationState(scrollNotification.metrics.pixels,
              scrollNotification.metrics.maxScrollExtent);
          return false;
        },
        child: child,
      );
  
  }
}
