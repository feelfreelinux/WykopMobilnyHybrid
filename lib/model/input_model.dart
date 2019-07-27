import 'package:flutter/cupertino.dart';
import 'package:owmflutter/models/models.dart';

abstract class InputModel extends ChangeNotifier {
  Future<void> onInputSubmitted(InputData data);
}
