import 'package:flutter/material.dart';

class Callhistory extends StatefulWidget {
  const Callhistory({Key? key}) : super(key: key);

  @override
  State<Callhistory> createState() => _CallhistoryState();
}

class _CallhistoryState extends State<Callhistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: 25,
          itemBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: 75,
              child: ListTile(
                leading: const CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.indigo,
                ),
                title: const Text(
                  'SANDY',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.call,

                  ),
                ),
                // trailing:CircleAvatar(radius: 12,backgroundColor: Colors.indigo,
                //   child: Text("2",style: TextStyle(color: Colors.white,fontSize: 10),),
                // ),
              ),
            );
          }),
    );
  }
}
