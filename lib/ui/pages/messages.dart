import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class Messages extends StatefulWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> with SingleTickerProviderStateMixin {
  TextEditingController _messageController = TextEditingController();
  List<String> _messages = [];
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  late AnimationController _animationController;
  late Tween<Offset> _offsetTween;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _offsetTween = Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero);
  }

  void _sendMessage(String message) {
    if (message.isNotEmpty) {
      setState(() {
        _messages.insert(0, message);
        _listKey.currentState?.insertItem(0);
      });
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://garciaalonso.com.ar/wp-content/uploads/2019/01/dr-gustavo-ezequiel-gutierrez.jpg'),
            ),
            const SizedBox(width: 8),
            const Text('Juan Jaramillo'),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: AnimatedList(
              key: _listKey,
              reverse: true,
              initialItemCount: _messages.length,
              itemBuilder: (BuildContext context, int index, Animation<double> animation) {
                return SlideTransition(
                  position: animation.drive(_offsetTween),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      margin: const EdgeInsets.all(8.0),
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Text(
                        _messages[index],
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
                    controller: _messageController,
                    onSubmitted: _sendMessage, // Llama a _sendMessage al presionar Enter
                    decoration: const InputDecoration(
                      hintText: 'Escribe un mensaje...',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () => _sendMessage(_messageController.text.trim()), // Llama a _sendMessage al presionar el botón de enviar
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
