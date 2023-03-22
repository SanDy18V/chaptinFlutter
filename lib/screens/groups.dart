import 'package:flutter/material.dart';

class Groups extends StatefulWidget {
  const Groups({Key? key}) : super(key: key);

  @override
  State<Groups> createState() => _GroupsState();
}

class _GroupsState extends State<Groups> {
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
                  backgroundColor: Colors.indigo,
                ),
                title: Text(
                  'SANDY',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                ),
                trailing: CircleAvatar(
                  radius: 12,

                  child: Text(
                    "2",
                    style: TextStyle( fontSize: 10),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
