import 'package:flutter/material.dart';

class DirectMessages extends StatefulWidget {
  static const String id = 'DirectMessages';

  @override
  _DirectMessagesState createState() => _DirectMessagesState();
}

class _DirectMessagesState extends State<DirectMessages> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Direct Messages"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context), // Go back to the previous screen
        ),
      ),
      body: ListView.builder(
        itemCount: 10, // Replace 10 with actual number of message threads
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              // Placeholder profile image
              backgroundImage: NetworkImage('https://picsum.photos/200'),
            ),
            title: Text("Username $index"),
            subtitle: Text("Last message..."),
            onTap: () {
              // Navigate to individual chat screen
            },
          );
        },
      ),
    );
  }
}
