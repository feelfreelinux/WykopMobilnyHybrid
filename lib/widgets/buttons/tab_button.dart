import 'package:flutter/material.dart';
import 'package:owmflutter/utils/utils.dart';

class TabButtonWidget extends StatelessWidget {
  final int index;
  final int currentIndex;
  final String text;
  final VoidCallback onTap;
  final double fontSize;
  final bool isSelected;

  TabButtonWidget({
    this.index,
    this.currentIndex,
    @required this.text,
    this.fontSize = 14,
    this.isSelected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Tooltip(
        message: text,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(20),
          highlightColor: Colors.transparent,
          child: AnimatedContainer(
            duration: Duration(milliseconds: 100),
            padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 6.0),
            decoration: BoxDecoration(
                color: isSelected ?? currentIndex == index
                    ? Utils.backgroundGreyOpacity(context)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(20)),
            child: Text(
              text,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: fontSize,
                  color: currentIndex == index
                      ? Theme.of(context).textTheme.body1.color
                      : Theme.of(context).textTheme.caption.color),
            ),
          ),
        ),
      ),
    );
  }
}
