import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class ShadowControlModel extends ChangeNotifier {
  final bool reverse;
  final double scrollDelayPixels;
  bool _showInputShadow = true;
  bool _showTopShadow = false;
  bool _showSubbarShadow = false;

  bool get showInputShadow => _showInputShadow;
  bool get showTopShadow => _showTopShadow;
  bool get showSubbarShadow => _showSubbarShadow;

  ShadowControlModel({this.reverse: false, this.scrollDelayPixels: 10}) {
    if (this.reverse) {
      _showInputShadow = false;
      _showTopShadow = true;
    } else {
      _showInputShadow = true;
      _showTopShadow = false;
    }
  }

  updateNotificationState(double scrollPixels, double maxScrollExtent, {bool hideOnAllTop = false, ScrollDirection scrollDirection = ScrollDirection.reverse}) {
    if (scrollPixels > scrollDelayPixels && scrollPixels < maxScrollExtent) {
      if (!hideOnAllTop && _showTopShadow == false && scrollDirection == ScrollDirection.idle) {
        return;
      }
      
      if (!hideOnAllTop && scrollDirection == ScrollDirection.forward) {
        if (_showTopShadow == true) {
          _showTopShadow = false;
          _showSubbarShadow = true;
          notifyListeners();
        } 
        return;
      }

      if (_showInputShadow != true || showTopShadow != true) {
        _showTopShadow = true;
        _showInputShadow = true;
        notifyListeners();
      }
      return;
    }
    if (scrollPixels >= maxScrollExtent) {
      if (this.reverse) {
        if (_showTopShadow != false) {
          _showTopShadow = false;
          _showSubbarShadow = false;
          notifyListeners();
        }
      } else {
        if (_showInputShadow != false) {
          _showInputShadow = false;
          notifyListeners();
        }
      }

      return;
    }
    if (scrollPixels <= maxScrollExtent) {
      if (this.reverse) {
        if (_showInputShadow != false) {
          _showInputShadow = false;
          notifyListeners();
        }
      } else {
        if (showTopShadow != false || _showSubbarShadow != false) {
          _showTopShadow = false;
          _showSubbarShadow = false;
          notifyListeners();
        }
      }
      return;
    }
    return;
  }
}
