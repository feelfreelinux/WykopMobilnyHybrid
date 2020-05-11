import 'package:flutter/material.dart';

class GreatDialogWidget extends StatefulWidget {
  final Widget child;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final bool isScrolled;

  GreatDialogWidget({
    this.child,
    this.margin,
    this.padding,
    this.isScrolled = true,
  });

  _GreatDialogWidgetState createState() => _GreatDialogWidgetState();
}

class _GreatDialogWidgetState extends State<GreatDialogWidget>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    animation = CurvedAnimation(parent: controller, curve: Curves.elasticInOut);
    controller.addListener(() => setState(() {}));
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: animation,
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).dialogBackgroundColor,
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black38,
                  blurRadius: 8.0,
                  offset: Offset(0.0, 1.0),
                )
              ],
            ),
            margin: widget.margin ??
                EdgeInsets.symmetric(horizontal: 22.0, vertical: 14.0),
            child: ClipRRect(
              clipBehavior: Clip.hardEdge,
              borderRadius: BorderRadius.circular(20.0),
              child: widget.isScrolled
                  ? SingleChildScrollView(
                      child: Container(
                        padding: widget.padding ?? EdgeInsets.all(18.0),
                        decoration: BoxDecoration(
                          color: Theme.of(context).dialogBackgroundColor,
                        ),
                        child: widget.child,
                      ),
                    )
                  : Container(
                      padding: widget.padding ?? EdgeInsets.all(18.0),
                      decoration: BoxDecoration(
                        color: Theme.of(context).dialogBackgroundColor,
                      ),
                      child: widget.child,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
