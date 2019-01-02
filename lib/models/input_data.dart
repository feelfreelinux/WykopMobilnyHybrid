import 'dart:io';

class InputData {
  final String body;
  final String url;
  final File file;
  InputData({this.body, this.url = "", this.file});
}
