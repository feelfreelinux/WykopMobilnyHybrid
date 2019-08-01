import 'package:owmflutter/models/models.dart';

class ConversationData {
  List<PmMessage> messages;
  Author receiver;
  ConversationData({receiver, messages});
}