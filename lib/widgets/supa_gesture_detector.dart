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
  static const int doubleTapInterval = 200;
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
    return Listener(
      onPointerUp: !isActive
          ? null
          : (p) {
              if (!this.disable) {
                if (exceededTouchSlop(p.position)) {
                  // Trigger double tap only if lastest tap happened in lastest doubleTapInterval
                  if (lastTapTimestamp != null &&
                      p.timeStamp.inMilliseconds <
                          lastTapTimestamp.inMilliseconds + doubleTapInterval) {
                    if (tapTimer != null) {
                      setState(() {
                        tapTimer.cancel();
                        tapTimer = null;
                        if (isActive & !disable) {
                          widget.onDoubleTap();
                        }
                        enable();
                      });
                    }
                  }
                  setState(() {
                    lastTapTimestamp = p.timeStamp;
                    // Wait a doubleTapInterval to be able to detect a double tap
                    this.tapTimer = new Timer(
                        const Duration(milliseconds: doubleTapInterval), () {
                      if (isActive && !disable) widget.onTap();
                      enable();
                    });
                    this.longPressTimer.cancel();
                  });
                }
              }
              if (!isActive)
                setState(() {
                  this.disable = false;
                });
            },
      onPointerDown: (p) {
        if (!isActive)
          setState(() {
            this.disable = true;
          });
        setState(() {
          // Save initial positions, used to detect if finger moved during tap / longpress
          this.lastDownClickTimestamp = p.timeStamp;
          this.lastDownPosition = p.position;

          // Start the long press timer. Can get cancelled by move and tap events
          this.longPressTimer =
              new Timer(const Duration(milliseconds: longPressTrigger), () {
            setState(() {
              this.longPressTimer = null;
            });

            if (isActive && !disable) widget.onLongPress();
            enable();
          });
        });
      },
      onPointerMove: !isActive
          ? null
          : (p) {
              // Cancel long press timer when scroll is detected
              if (this.longPressTimer != null &&
                  !exceededTouchSlop(p.position)) {
                setState(() {
                  this.longPressTimer?.cancel();
                  this.longPressTimer = null;
                });
              }
            },
      child: ActiveGestureDetectorWidget(
          onActiveStateChanged: (active) {
            setState(() {
              isActive = active;
              if (!active) {
                disable = true;
                this.tapTimer?.cancel();
                this.longPressTimer?.cancel();
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
