import 'package:flutter/material.dart';

class GreatDialogWidget extends StatefulWidget {
  final Widget child;
  final EdgeInsets margin;
  final EdgeInsets padding;

  GreatDialogWidget({this.child, this.margin, this.padding});

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
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
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
            margin: widget.margin ?? EdgeInsets.all(18.0),
            decoration: BoxDecoration(
              color: Theme.of(context).dialogBackgroundColor,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Padding(
              padding: widget.padding ?? EdgeInsets.all(18.0),
              child: widget.child,
            ),
          ),
        ),
      ),
    );
  }
}
