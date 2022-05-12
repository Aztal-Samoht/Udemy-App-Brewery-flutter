import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_i_chat_app/constants.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({key, this.sender, this.text, this.isMe})
      : super(key: key);

  final String text;
  final String sender;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              sender,
              style: TextStyle(color: Colors.black54, fontSize: 12),
              textAlign: TextAlign.end,
            ),
          ),
          Material(
            elevation: 5,
            borderRadius: isMe ? kBubbleBorderSelf : kBubbleBorderOther,
            color: isMe ? Colors.blue : Colors.lightBlueAccent,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 15, color: isMe ? Colors.white : Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
