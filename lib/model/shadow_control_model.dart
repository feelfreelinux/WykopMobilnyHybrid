import 'package:flutter/foundation.dart';

class ShadowControlModel extends ChangeNotifier {
  final bool reverse;
  final double scrollDelayPixels;
  bool _showInputShadow = true;
  bool _showTopShadow = false;

  bool get showInputShadow => _showInputShadow;
  bool get showTopShadow => _showTopShadow;

  ShadowControlModel({this.reverse: false, this.scrollDelayPixels: 10}) {
    if (this.reverse) {
      _showInputShadow = false;
      _showTopShadow = true;
    } else {
      _showInputShadow = true;
      _showTopShadow = false;
    }
  }

  updateNotificationState(double scrollPixels, double maxScrollExtent) {
    if (scrollPixels > scrollDelayPixels && scrollPixels < maxScrollExtent) {
      if (_showInputShadow != true || showTopShadow != true) {
        print("middle");
        _showTopShadow = true;
        _showInputShadow = true;
        notifyListeners();
      }
      return;
    }
    if (scrollPixels >= maxScrollExtent) {
      if (this.reverse) {
        if (_showTopShadow != false) {
          print("bottom");
          _showTopShadow = false;
          notifyListeners();
        }
      } else {
        if (_showInputShadow != false) {
          print("bottom");
          _showInputShadow = false;
          notifyListeners();
        }
      }

      return;
    }
    if (scrollPixels <= maxScrollExtent) {
      if (this.reverse) {
        if (_showInputShadow != false) {
          print("top");
          _showInputShadow = false;
          notifyListeners();
        }
      } else {
        if (showTopShadow != false) {
          print("top");
          _showTopShadow = false;
          notifyListeners();
        }
      }
      return;
    }
    return;
  }
}
