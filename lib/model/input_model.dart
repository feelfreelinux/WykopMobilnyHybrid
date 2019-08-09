import 'package:flutter/cupertino.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/widgets/widgets.dart';

abstract class InputModel extends ChangeNotifier {
  var inputBarKey = new GlobalKey<InputBarWidgetState>();
  Future<void> onInputSubmitted(InputData data);
}
