import 'package:flutter/material.dart';

import 'messages.dart';

class MessageHeader {
  final String sender;
  final String subject;
  final String lastMessage;
  final String date;
  final String avatarUrl;

  MessageHeader({
    required this.sender,
    required this.subject,
    required this.lastMessage,
    required this.date,
    required this.avatarUrl,
  });
}

class MessageList extends StatelessWidget {
  final List<MessageHeader> messageHeaders = [
    MessageHeader(
      sender: 'John Doe',
      subject: 'Hello',
      lastMessage: 'Quisiera saber si tienes disponibilidad para el 15 de mayo',
      date: '13:51 PM',
      avatarUrl:
          'https://www.portalminero.com/wp/wp-content/uploads/subidos/notasprensa/13786_5f6358865e75d.jpg',
    ),
    MessageHeader(
      sender: 'Jane Smith',
      subject: 'Información revisada',
      lastMessage: 'Gracias por la informacion, la revisare y te aviso.',
      date: '12:14 PM',
      avatarUrl:
          'https://www.portalminero.com/wp/wp-content/uploads/subidos/notasprensa/13786_5f6358865e75d.jpg',
    ),
    MessageHeader(
      sender: 'Mike Johnson',
      subject: 'Recuerda la reunión',
      lastMessage:
          'Recuerda que tenemos una reunión el 15 de mayo a las 10:00 AM',
      date: '11:30 AM',
      avatarUrl:
          'https://www.portalminero.com/wp/wp-content/uploads/subidos/notasprensa/13786_5f6358865e75d.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis mensajes'),
      ),
      body: ListView.builder(
        itemCount: messageHeaders.length,
        itemBuilder: (BuildContext context, int index) {
          final messageHeader = messageHeaders[index];
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
                backgroundImage: NetworkImage(messageHeader.avatarUrl),
              ),
              title: Text(
                messageHeader.sender,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(messageHeader.subject),
                  Text(messageHeader.lastMessage,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis),
                ],
              ),
              trailing: Text(messageHeader.date),
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
