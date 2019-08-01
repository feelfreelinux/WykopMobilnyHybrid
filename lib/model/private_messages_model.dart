import 'package:owmflutter/model/model.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/api/api.dart';

class PrivateMessagesModel extends InputModel {
  List<PmMessage> _messages;
  bool _loading = false;
  Author _receiver;

  Author get receiver => _receiver;
  bool get isLoading => _loading;
  List<PmMessage> get messages => _messages;
  
  final String receiverNickname;
  PrivateMessagesModel({this.receiverNickname});


  @override
  Future<void> onInputSubmitted(InputData data) {
    // TODO: implement onInputSubmitted
    return null;
  }

  Future<void> loadMessages() async {
    _loading = true;
    notifyListeners();
    
    var conversation = await api.pm.getConversation(this.receiverNickname);
    _messages = conversation.messages;
    _receiver = conversation.receiver;
    _loading = false;
    notifyListeners();
  }
}