import 'package:flutter/material.dart';
import 'package:zendriver/models/message.dart';
import 'package:zendriver/services/message_service.dart';

import '../../models/user.dart';
import '../../services/login_service.dart';

class Messages extends StatefulWidget {
  final int emitterId;
  final int receiverId;

  const Messages({Key? key, required this.emitterId, required this.receiverId})
      : super(key: key);

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages>
    with SingleTickerProviderStateMixin {
  TextEditingController messageController = TextEditingController();
  List<Message>? messages;
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  late AnimationController _animationController;
  late Tween<Offset> _offsetTween;
  User? emitter;

  MessageService httpHelper = MessageService();
  LoginService loginService = LoginService();

  Future initialize() async {
    emitter = await loginService.getUserById(widget.emitterId);
    List<Message> fetchedMessages = await httpHelper
        .searchByEmitterIdAndReceiverId(widget.emitterId, widget.receiverId);
    setState(() {
      messages = fetchedMessages;
      emitter = emitter;
    });
  }

  @override
  void initState() {
    initialize();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _offsetTween =
        Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero);
    super.initState();
  }

  void _sendMessage(String message) async {
    if (message.isNotEmpty) {
      SaveMessageRequest messageRequest = SaveMessageRequest(
        emitterId: widget.receiverId,
        receiverId: widget.emitterId,
        content: message,
      );
      await httpHelper.addMessage(messageRequest);
      List<Message> fetchedMessages = await httpHelper
          .searchByEmitterIdAndReceiverId(widget.emitterId, widget.receiverId);
      setState(() {
        messages = fetchedMessages;
      });
      messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(emitter == null
                  ? 'https://static.vecteezy.com/system/resources/thumbnails/009/292/244/small/default-avatar-icon-of-social-media-user-vector.jpg'
                  : emitter!.imageUrl),
            ),
            const SizedBox(width: 8),
            Text(emitter == null
                ? ''
                : '${emitter!.firstName} ${emitter!.lastName}'),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: AnimatedList(
              key: messages == null ? null : _listKey,
              reverse: true,
              initialItemCount: messages?.length ?? 0,
              itemBuilder: (BuildContext context, int index,
                  Animation<double> animation) {
                final message = messages![index];
                final isCurrentUser = message.emitter.id == widget.receiverId;

                return SlideTransition(
                  position: animation.drive(_offsetTween),
                  child: Align(
                    alignment: isCurrentUser
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.all(8.0),
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color: isCurrentUser ? Colors.blue : const Color.fromARGB(255, 59, 141, 63),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Text(
                        message.content,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            color: Colors.grey[200],
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: messageController,
                    onSubmitted:
                        _sendMessage, // Llama a _sendMessage al presionar Enter
                    decoration: const InputDecoration(
                      hintText: 'Escribe un mensaje...',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () => _sendMessage(messageController.text
                      .trim()), // Llama a _sendMessage al presionar el botón de enviar
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
