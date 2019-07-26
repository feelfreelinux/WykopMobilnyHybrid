import 'package:flutter/foundation.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/api/api.dart';

class NotificationModel extends ChangeNotifier {
  int _id;
  String _body;
  String _date;
  String _itemId;
  String _url;
  String _type;
  bool _isNew;
  Author _author;

  int get id => _id;
  String get body => _body;
  String get date => _date;
  String get itemId => _itemId;
  String get url => _url;
  String get type => _type;
  bool get isNew => _isNew;
  Author get author => _author;

  void setData(Notification notification) {
    _id = notification.id;
    _body = notification.body;
    _date = notification.date;
    _itemId = notification.itemId;
    _url = notification.url;
    _type = notification.type;
    _isNew = notification.isNew;
    _author = notification.author;

    notifyListeners();
  }

  void markAsRead() {
    _isNew = false;
    notifyListeners();
  }
}