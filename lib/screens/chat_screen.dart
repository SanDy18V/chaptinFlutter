import 'package:flutter/material.dart';

class ChatList extends StatefulWidget {
  const ChatList({Key? key}) : super(key: key);

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: 25,
          itemBuilder: (BuildContext context, int index) {
            return const SizedBox(
              height: 75,
              child: ListTile(
                leading: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.white70,
                    backgroundImage:
                        AssetImage("assets/img/Naruto-Background-PNG.png")),
                title: Text(
                  'SANDY',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                ),
                trailing: CircleAvatar(
                  radius: 12,
                  // backgroundColor: Colors.indigo,
                  child: Text(
                    "2",
                    style: TextStyle( fontSize: 10),
                  ),
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(

        elevation: 12,
        onPressed: () {
          // add your code here
        },
        child: const Icon(Icons.message),
      ),
    );
  }
}
