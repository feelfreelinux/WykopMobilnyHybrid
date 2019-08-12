import 'package:owmflutter/models/models.dart';

class ConversationData {
  List<PmMessage> messages;
  Author receiver;
  String lastUpdate;
  ConversationData({this.receiver, this.messages, this.lastUpdate});
}