import 'package:chat/screens/Login%20Screen.dart';
import 'package:chat/screens/callhistoryscr.dart';
import 'package:chat/screens/chat_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/google_signin.dart';
import 'groups.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controller = Get.find<Firebasecontroller>();

  @override
  void initState() {
    // print(controller.customer);
    // print(controller.idToken);
    // print(controller.accessToken);
    // TODO: implement initSt ate
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: Drawer(
          width: 250,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              SizedBox(
                height: 300,
                child: DrawerHeader(
                  decoration: const BoxDecoration(
                    color: Colors.indigo,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Account Details',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.white70,
                          backgroundImage: AssetImage(
                              "assets/img/Naruto-Background-PNG.png")),
                      SizedBox(
                        height: 20,
                      ),
                      Text("Name",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Home'),
                onTap: () {
                  // TODO: Navigate to the home screen.
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Settings'),
                onTap: () {
                  // TODO: Navigate to the settings screen.
                },
              ),
            ],
          ),
        ),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                toolbarHeight: 95,
                title: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Scaffold.of(context).openDrawer();
                      },
                      child: const Icon(Icons.account_circle_rounded),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Chat Box",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                floating: true,
                pinned: true,
                snap: true,
                bottom: const TabBar(
                  indicatorColor: Colors.white70,
                  splashFactory: NoSplash.splashFactory,
                  tabs: <Tab>[
                    Tab(icon: Icon(Icons.message_outlined), text: "Chats"),
                    Tab(icon: Icon(Icons.groups), text: "Groups"),
                    Tab(icon: Icon(Icons.call), text: "Calls"),
                  ], // <-- total of 2 tabs
                ),
                actions: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.camera_outlined)),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
                  IconButton(
                      onPressed: () {
                        controller.logout();
                      },
                      icon: const Icon(Icons.more_vert)),
                ],
                // backgroundColor: Colors.indigo,
              ),
            ];
          },
          body: const TabBarView(
            children: [ChatList(), Groups(), Callhistory()],
          ),
        ),
      ),
    );
  }
}
