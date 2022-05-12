import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_i_chat_app/constants.dart';
import 'package:project_i_chat_app/widgets/message_bubble.dart';

class MessagesStream extends StatelessWidget {
  MessagesStream({Key key, @required this.firestore}) {
    getCurrentUser();
  }

  final _auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore;
  User currentUser;

  void getCurrentUser() async {
    try {
      final user = await this._auth.currentUser;
      if (user != null) {
        this.currentUser = user;
        print(
            'email from getCurrentUser in chat_screen ${this.currentUser.email}');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: firestore.collection('messages').orderBy('timestamp').snapshots(),
      builder: (context, snapshot) {
        List<MessageBubble> messageWidgets = [];
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        final messages = snapshot.data.docs.reversed;
        for (var message in messages) {
          final messageText = message.get('text');
          final messageSender = message.get('sender');

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
            reverse: true,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            children: messageWidgets,
          ),
        );
      },
    );
  }
}
