import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:owmflutter/model/shadow_control_model.dart';
import 'package:provider/provider.dart';

class ShadowNotificationListener extends StatelessWidget {
  final Widget child;
  final bool hideOnAllTop;
  final ScrollController scrollController;

  ShadowNotificationListener({this.child, this.scrollController, this.hideOnAllTop = false});

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          
          var model = Provider.of<ShadowControlModel>(context, listen: false);
          model.updateNotificationState(scrollNotification.metrics.pixels,
              scrollNotification.metrics.maxScrollExtent, hideOnAllTop: hideOnAllTop, scrollDirection: scrollController != null ? scrollController.position.userScrollDirection : ScrollDirection.reverse);
          return false;
        },
        child: child,
      );
  
  }
}
