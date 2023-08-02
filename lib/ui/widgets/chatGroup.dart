// Importing the necessary packages
import 'package:flutter/material.dart';
// Importing the ChatMessage class
import 'message.dart';

// Creating a StatefulWidget for a group of chat messages
class ChatGroup extends StatefulWidget {
  // Defining a list of ChatMessage widgets as a final variable
  final List<ChatMessage> messages;

  // Constructor for the ChatGroup, requiring the list of messages
  const ChatGroup({Key? key, required this.messages}) : super(key: key);

  // Creating the state for the widget
  @override
  _ChatGroupState createState() => _ChatGroupState();
}

// Defining the state for the ChatGroup widget
class _ChatGroupState extends State<ChatGroup> {
  @override
  Widget build(BuildContext context) {
    // Building the widget tree
    return Container(
      // Setting the background color of the container
      color: Color(0xFF2D3034),
      // Using a ListView.builder to display the list of messages
      child: ListView.builder(
        itemCount: widget.messages.length,
        itemBuilder: (context, index) {
          // Getting the current message from the list of messages
          final message = widget.messages[index];
          // Returning a SizedBox with a fixed width and a Card containing the message as its child
          return SizedBox(
              width: 200,
              child: Card(color: Color(0xFF2D3034), child: message));
        },
        reverse: true,
      ),
    );
  }
}
