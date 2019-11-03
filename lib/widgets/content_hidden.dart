import 'package:flutter/cupertino.dart';
import 'package:owmflutter/app.dart';
import 'package:owmflutter/widgets/widgets.dart';

class ContentHiddenWidget extends StatelessWidget {
  final VoidCallback onTap;
  ContentHiddenWidget({this.onTap});
  @override
  Widget build(BuildContext context) {
    if (owmSettings.hideExpandContent) return Container();
    return GestureDetector(
        onTap: onTap,
        child: Column(
                children: [Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Text("Pokaz ukrytą treść", style: TextStyle(fontSize: 16),),
            )
          ),
          DividerWidget()],
        ),
      );
    
  }
}