import 'package:flutter/material.dart';

import '../../models/message.dart';
import '../../services/message_service.dart';
import 'messages.dart';

String formatDate(DateTime fecha) {
  String hora = fecha.hour.toString().padLeft(2, '0');
  String minutos = fecha.minute.toString().padLeft(2, '0');
  String periodo = fecha.hour < 12 ? 'AM' : 'PM';
  
  return '$hora:$minutos $periodo';
}


class MessageList extends StatefulWidget {
  const MessageList({Key? key}) : super(key: key);
  @override
  State<MessageList> createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  List<Message>? messages;
  MessageService httpHelper = MessageService();

  Future initialize() async {
    messages = List.empty();
    messages = await httpHelper.searchLastMessagesByUserId(2);
    setState(() {
      messages = messages;
    });
  }

  @override
  void initState() {
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis mensajes'),
      ),
      body: ListView.builder(
        itemCount: messages!.length,
        itemBuilder: (BuildContext context, int index) {
          final messageHeader = messages![index];
          return Container(
            decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey,
                  ),
                  top: BorderSide(
                    color: Colors.grey,
                  ),
                  left: BorderSide(color: Colors.grey),
                  right: BorderSide(color: Colors.grey),
                ),
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                color: Colors.white),
            margin: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(messages![index].emitter.imageUrl),
              ),
              title: Text(
                messages![index].emitter.firstName + ' ' + messages![index].emitter.lastName,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(messages![index].content,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis),
                ],
              ),
              trailing: Text(formatDate(messages![index].createdAt)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Messages(),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
