import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_i_chat_app/constants.dart';
import 'package:project_i_chat_app/widgets/message_bubble.dart';

class MessagesStream extends StatelessWidget {
  const MessagesStream({
    Key key,
    @required FirebaseFirestore db,
    @required this.currentUser,
  })  : _firestore = db,
        super(key: key);

  final FirebaseFirestore _firestore;
  final User currentUser;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('messages').snapshots(),
      builder: (context, snapshot) {
        List<MessageBubble> messageWidgets = [];
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        final messages = snapshot.data.docs;
        for (var message in messages) {
          final messageText = message.get('text');
          final messageSender = message.get('sender');
          final messageNumber = message.get('messageNumber');

          // print(currentUser.email == messageSender);
          // print(
          //     'currentUser: ${currentUser.email}\n      printing the contents of message number $messageNumber: $messageSender said "$messageText"\n\n');

          messageWidgets.add(MessageBubble(
            isMe: currentUser.email == messageSender,
            sender: messageSender,
            text: messageText,
          ));
        }

        return Expanded(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            children: messageWidgets,
          ),
        );
      },
    );
  }
}
