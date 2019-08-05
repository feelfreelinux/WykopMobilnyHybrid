import 'package:flutter/material.dart';
import 'package:owmflutter/utils/utils.dart';

class TabButtonWidget extends StatelessWidget {
  final int index;
  final int currentIndex;
  final String text;
  final VoidCallback onTap;

  TabButtonWidget({
    @required this.index,
    @required this.currentIndex,
    @required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 6.0),
          decoration: BoxDecoration(
              color: currentIndex == index
                  ? Utils.backgroundGreyOpacity(context)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(20)),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w700,
                color: currentIndex == index
                    ? Theme.of(context).textTheme.body1.color
                    : Theme.of(context).textTheme.caption.color),
          ),
        ),
      ),
    );
  }
}
