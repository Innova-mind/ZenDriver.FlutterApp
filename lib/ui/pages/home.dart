import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Zendriver',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Zendriver'),
      ),
      body: ListView(
        children: <Widget>[
          PostWidget(
            avatarUrl: 'https://acortar.link/XhyCog',
            username: 'Carlos Manrique',
            imageUrl: 'https://i.ytimg.com/vi/kRElHS0_5yw/maxresdefault.jpg',
            caption: 'At our company, Mina MG, we are looking for experienced and committed truck drivers to join our team. If you love the road and enjoy the freedom to travel, this is your opportunity to be part of a leading organization in the logistics industry.',
          ),
          PostWidget(
            avatarUrl: 'https://acortar.link/lCqHA1',
            username: 'Jesus Perez',
            imageUrl: 'https://acortar.link/AW9aCm',
            caption: 'Hello everyone! Our company is looking for highly skilled trailer drivers who are passionate about driving. If you are passionate about the world of transportation, this is your chance to join our team!',
          ),
          // Agrega más widgets de publicaciones según sea necesario
        ],
      ),
    );
  }
}

class PostWidget extends StatefulWidget {
  final String avatarUrl;
  final String username;
  final String imageUrl;
  final String caption;

  const PostWidget({
    required this.avatarUrl,
    required this.username,
    required this.imageUrl,
    required this.caption,
  });

  @override
  _PostWidgetState createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  bool isLiked = false;

  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(
                backgroundImage: NetworkImage(widget.avatarUrl),
                radius: 20,
              ),
              SizedBox(width: 10),
              Text(
                widget.username,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Image.network(widget.imageUrl),
          SizedBox(height: 10),
          Text(widget.caption),
          SizedBox(height: 10),
          Row(
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.favorite,
                  color: isLiked ? Colors.red : Colors.black,
                ),
                onPressed: toggleLike,
              ),
              SizedBox(width: 5),
              Text('Like'),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: <Widget>[
              CircleAvatar(
                backgroundImage: NetworkImage('https://acortar.link/qJG307'),
                radius: 15,
              ),
              SizedBox(width: 10),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Add a comment...',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Icon(Icons.send),
            ],
          ),
        ],
      ),
    );
  }
}
