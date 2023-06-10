import 'package:zendriver/models/user.dart';

class Message {
  final int id;
  final String content;
  final int emitterId;
  final User emitter;
  final int receiverId;
  final User receiver;
  final DateTime createdAt;

  Message({
    required this.id,
    required this.content,
    required this.emitterId,
    required this.emitter,
    required this.receiverId,
    required this.receiver,
    required this.createdAt,
  });

  Message.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        content = json['content'],
        emitterId = json['emitterId'],
        emitter = User.fromJson(json['emitter']),
        receiverId = json['receiverId'],
        receiver = User.fromJson(json['receiver']),
        createdAt = DateTime.parse(json['createdAt']);

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'content': content,
      'emitterId': emitterId,
      'emitter': emitter.toJson(),
      'receiverId': receiverId,
      'receiver': receiver.toJson(),
      'createdAt': createdAt.toString(),
    };
  }
}
