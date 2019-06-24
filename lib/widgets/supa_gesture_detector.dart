import 'package:flutter/material.dart';
import 'dart:async';

/// Fix over GestureDetector that allows to nest multiple gesture detectors
class SupaGestureDetector extends StatefulWidget {
  final Widget child;
  final VoidCallback onTap;
  final VoidCallback onDoubleTap;
  final VoidCallback onLongPress;

  SupaGestureDetector(
      {@required this.child, this.onDoubleTap, this.onTap, this.onLongPress});
  _SupaGestureDetectorState createState() => _SupaGestureDetectorState();
}

class _SupaGestureDetectorState extends State<SupaGestureDetector> {
  static const int tapSlop = 16;
  static const int longPressTrigger = 500;
  static const int doubleTapInterval = 300;
  bool isActive = true;
  bool disable = false;

  Duration lastDownClickTimestamp;
  Duration lastTapTimestamp;

  Offset lastDownPosition;

  Timer tapTimer;
  Timer longPressTimer;

  // Used to detect between taps and scrolls
  bool exceededTouchSlop(Offset position) =>
      position.dy < lastDownPosition.dy + tapSlop &&
      position.dy > lastDownPosition.dy - tapSlop;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: !isActive
          ? null
          : () {
              widget.onTap();
            },
      onDoubleTap: !isActive
          ? null
          : () {
              widget.onDoubleTap();
            },
      onLongPress: !isActive
          ? null
          : () {
              widget.onLongPress();
            },
      child: ActiveGestureDetectorWidget(
          onActiveStateChanged: (active) {
            setState(() {
              isActive = active;
              if (!active) {
                disable = true;
              }
            });
          },
          child: widget.child),
    );
  }

  void enable() {
    setState(() {
      this.disable = false;
    });
  }
}

typedef void DeactiveDetectorCallback(bool);

class ActiveGestureDetectorWidget extends InheritedWidget {
  const ActiveGestureDetectorWidget({
    Key key,
    @required this.onActiveStateChanged,
    @required Widget child,
  }) : super(key: key, child: child);

  final DeactiveDetectorCallback onActiveStateChanged;
  void changeState(bool state) {
    onActiveStateChanged(state);
  }

  static ActiveGestureDetectorWidget of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(ActiveGestureDetectorWidget);
  }

  @override
  bool updateShouldNotify(ActiveGestureDetectorWidget old) => false;
}
