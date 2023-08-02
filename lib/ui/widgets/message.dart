// Importing the necessary package
import 'package:flutter/material.dart';

// Creating a StatelessWidget for a chat message
class ChatMessage extends StatelessWidget {
  // Declaring the name, text, and avatar parameters as final variables
  final String name;
  final String text;
  final String avatar;

  // Constructor for the ChatMessage, requiring the name, text, and avatar parameters
  ChatMessage({
    required this.name,
    required this.text,
    required this.avatar,
  }) : super();

  // Building the widget tree
  @override
  Widget build(BuildContext context) {
    // Returning a Card widget with a Row containing the avatar and message details
    return Card(
      color: Color(0xFF2D3034),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Using a CircleAvatar widget to display the avatar image
          CircleAvatar(
            backgroundImage: AssetImage(avatar),
            radius: 24,
          ),
          SizedBox(width: 8),
          // Using an Expanded widget to allow the Column to take up the remaining space in the Row
          Expanded(
            // Using a Column to display the name and message text
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Displaying the name in bold text
                Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
                // Using a Container with padding to display the message text
                Container(
                  color: Color(0xFF272727),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      text,
                      style: TextStyle(color: Color(0xFF7F8D9A)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
