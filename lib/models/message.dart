import 'package:zendriver/models/user.dart';

class Message {
  final int id;
  final String content;
  final User emitter;
  final User receiver;
  final DateTime createdAt;

  Message({
    required this.id,
    required this.content,
    required this.emitter,
    required this.receiver,
    required this.createdAt,
  });

  Message.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        content = json['content'],
        emitter = User.fromJson(json['emitter']),
        receiver = User.fromJson(json['receiver']),
        createdAt = DateTime.parse(json['createdAt']);

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'content': content,
      'emitterId': emitter.id,
      'emitter': emitter.toJson(),
      'receiverId': receiver.id,
      'receiver': receiver.toJson(),
      'createdAt': createdAt.toString(),
    };
  }
}
