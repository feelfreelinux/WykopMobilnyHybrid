import 'package:async/async.dart';
import 'package:flutter/foundation.dart';
import 'dart:async';

class BaseModel extends ChangeNotifier {
  List<CancelableOperation> operations = List();

  Future<T> scheduleFuture<T>(Future<T> future) async {
    var operation = CancelableOperation.fromFuture(future);
    operations.add(operation);

    operation.value.whenComplete(() => operations.remove(operation));
    return await operation.value;
  }

  @override
  void dispose() {
    operations.forEach((e) => e.cancel());
    super.dispose();
  }
}
