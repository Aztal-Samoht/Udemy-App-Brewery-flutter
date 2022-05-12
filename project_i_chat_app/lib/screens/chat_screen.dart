import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../widgets/message_stream.dart';

class ChatScreen extends StatefulWidget {
  static String id = '/chat';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final messageTextController = TextEditingController();
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  User loggedInUser;
  String message;
  int messageNumber = 0;
  List<Widget> textList = [];

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await this._auth.currentUser;
      if (user != null) {
        this.loggedInUser = user;
        print(this.loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  // void getMessages() async {
  //   final messages = await _firestore.collection('messages').get();
  //   print('messages.runtimeType: ${messages.runtimeType}');
  //   print('messages.data(): ${messages.data()}');
  //   print('messages: ${messages}');
  // for (var message in messages.data()) {
  //   print(message.data().cast());
  // }
  // final otherMessages = await _firestore.collection('messages').get();
  // print('otherMessages: ${otherMessages.runtimeType}');
  // final snapshot = await _firestore.collection('messages').doc('0').get();
  // print('snapshot: ${snapshot.runtimeType}');
  // print(snapshot.data()['text']);
  // final query = messages.where('sender', isEqualTo: 'r@r.com');
  // print('query: ${query.runtimeType}');

  // print(await query.get().data()['text']);
  // messages.data();
  // otherMessages.data();
  // snapshot.data().forEach();
  // }
  //
  // Future<List<Widget>> messagesStream() async {
  //   List<Widget> textList = [];
  //   await for (var snapshot in _firestore.collection('messages').snapshots()) {
  //     for (var message in snapshot.docs) {
  //       textList.add(Text(message.data()['text']));
  //       print(message.data()['text']);
  //     }
  //     print("-----------------------");
  //   }
  //   return textList;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                _auth.signOut();
                Navigator.pop(context);
              }),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MessagesStream(db: _firestore),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: messageTextController,
                      onChanged: (value) {
                        message = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      _firestore
                          .collection('messages')
                          .doc(messageNumber.toString())
                          .set({
                        'sender': loggedInUser.email,
                        'text': message,
                        'messageNumber': messageNumber,
                      });
                      messageTextController.clear();
                      messageNumber++;
                      //Implement send functionality.
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
