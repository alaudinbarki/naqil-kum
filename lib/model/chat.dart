import 'package:cloud_firestore/cloud_firestore.dart';

class Chat {
  final String chatId;
  final String senderId;
  final String receiverId;
  final String senderImageUrl;
  final String receiverImageUrl;
  final String senderName;
  final String receiverName;
  final String content;
  final String id;
  final int type;
  final DateTime timeStamp;

  Chat({
    required this.senderId,
    required this.receiverId,
    required this.senderImageUrl,
    required this.receiverImageUrl,
    required this.senderName,
    required this.receiverName,
    required this.content,
    required this.chatId,
    required this.type,
    required this.timeStamp,
    required this.id,
  });

  Chat.withoutId(
      {required String senderId,
      required String receiverId,
      required String senderImageUrl,
      required String receiverImageUrl,
      required String senderName,
      required String receiverName,
      required String content,
        required int type,
      required String chatId})
      : this(
            chatId: chatId,
            senderId: senderId,
            senderName: senderName,
            receiverId: receiverId,
            senderImageUrl: senderImageUrl,
            receiverImageUrl: receiverImageUrl,
            receiverName: receiverName,
            content: content,
            type:type,
            id: '',
            timeStamp: DateTime(1700));

  factory Chat.fromJson(Map<String, dynamic> json, String id) {
    final senderId = json['senderId'];
    final chatId = json['chat_id'];
    final receiverId = json['receiverId'];
    final senderImageUrl = json['senderImageUrl'];
    final receiverImageUrl = json['receiverImageUrl'];
    final senderName = json['senderName'];
    final receiverName = json['receiverName'];
    final content = json['content'];
    final type=json.containsKey('type')?json['type']:0;
    final Timestamp createdAtTimestamp = json['time_stamp'];
    final DateTime timeStamp = createdAtTimestamp.toDate();
    return Chat(
        senderId: senderId,
        receiverId: receiverId,
        senderImageUrl: senderImageUrl,
        receiverImageUrl: receiverImageUrl,
        senderName: senderName,
        receiverName: receiverName,
        content: content,
        chatId: chatId,
        timeStamp: timeStamp,
        type: type,
        id: id);
  }

  Map<String, dynamic> toJson(FieldValue fieldValue) => {
        'senderId': senderId,
        'receiverId': receiverId,
        'type':type,
        'senderImageUrl': senderImageUrl,
        'receiverImageUrl': receiverImageUrl,
        'senderName': senderName,
        'receiverName': receiverName,
        'content': content,
        'chat_id': chatId,
        'time_stamp': fieldValue
      };

  Chat copyWith({String? content, DateTime? timestamp}) => Chat(
      senderId: senderId,
      receiverId: receiverId,
      senderImageUrl: senderImageUrl,
      receiverImageUrl: receiverImageUrl,
      senderName: senderName,
      receiverName: receiverName,
      type: type,
      content: content ?? this.content,
      chatId: chatId,
      timeStamp: timestamp ?? timeStamp,
      id: id);

  @override
  String toString() {
    return 'Chat{chatId: $chatId, senderId: $senderId, receiverId: $receiverId, senderImageUrl: $senderImageUrl, receiverImageUrl: $receiverImageUrl, senderName: $senderName, receiverName: $receiverName, content: $content, id: $id, timeStamp: $timeStamp,type:$type}';
  }
}
