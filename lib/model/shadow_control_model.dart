import 'package:flutter/foundation.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/api/api.dart';

class ShadowControlModel extends ChangeNotifier {
  bool _showInputShadow = true;
  bool _showTopShadow = false;

  bool get showInputShadow => _showInputShadow;
  bool get showTopShadow => _showTopShadow;

  ShadowControlModel();

  updateNotificationState(double scrollPixels, double maxScrollExtent) {
    if (scrollPixels > 10 && scrollPixels < maxScrollExtent) {
      if (_showInputShadow != true || showTopShadow != true) {
        print("middle");
        _showTopShadow = true;
        _showInputShadow = true;
        notifyListeners();
      }
      return;
    }
    if (scrollPixels >= maxScrollExtent) {
      if (_showInputShadow != false) {
        print("bottom");
        _showInputShadow = false;
        notifyListeners();
      }
      return;
    }
    if (scrollPixels <= maxScrollExtent) {
      if (showTopShadow != false) {
        print("top");
        _showTopShadow = false;
        notifyListeners();
      }
      return;
    }
    return;
  }
}
