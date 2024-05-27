import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram Clone',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Instagram',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Billabong',
            fontSize: 32.0,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add_box_outlined, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.favorite_border, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.chat_bubble_outline, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: [
          PostWidget(
            username: 'user1',
            userImage: 'https://via.placeholder.com/150',
            postImage: 'https://via.placeholder.com/600',
            caption: 'Beautiful day!',
          ),
          PostWidget(
            username: 'user2',
            userImage: 'https://via.placeholder.com/150',
            postImage: 'https://via.placeholder.com/600',
            caption: 'Enjoying the beach!',
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Activity',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}

class PostWidget extends StatelessWidget {
  final String username;
  final String userImage;
  final String postImage;
  final String caption;

  PostWidget({
    required this.username,
    required this.userImage,
    required this.postImage,
    required this.caption,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(userImage),
          ),
          title: Text(username, style: TextStyle(fontWeight: FontWeight.bold)),
          trailing: Icon(Icons.more_vert),
        ),
        Image.network(postImage),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(Icons.favorite_border),
              SizedBox(width: 16.0),
              Icon(Icons.chat_bubble_outline),
              SizedBox(width: 16.0),
              Icon(Icons.send),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: username,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: ' $caption'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
