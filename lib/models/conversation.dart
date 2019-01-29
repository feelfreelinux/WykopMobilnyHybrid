import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:owmflutter/api/api.dart';
import 'package:owmflutter/models/models.dart';

part 'conversation.g.dart';

abstract class Conversation
    implements Built<Conversation, ConversationBuilder> {
  factory Conversation([updates(ConversationBuilder b)]) = _$Conversation;
  String get lastUpdate;

  Author get author;

  factory Conversation.mapFromResponse(ConversationResponse response) {
    return _$Conversation._(
      lastUpdate: response.lastUpdate,
      author: response.receiver != null
          ? Author.fromResponse(response: response.receiver)
          : null,
    );
  }

  Conversation._();
  static Serializer<Conversation> get serializer => _$conversationSerializer;
}
