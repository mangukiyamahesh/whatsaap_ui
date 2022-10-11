import 'package:flutter/material.dart';
import 'package:whatsapp_ui/view/calls_screen.dart';
import 'package:whatsapp_ui/view/status_screen.dart';

import 'chats2.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: Text("WhatsApp"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
          PopupMenuButton(
            //icon: Icon(Icons.add),
            onSelected: (value) {},
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(child: Text("New Group")),
                PopupMenuItem(child: Text("New broadcast")),
                PopupMenuItem(child: Text("Linked devices")),
                PopupMenuItem(child: Text("Starred messages")),
                PopupMenuItem(child: Text("Payments")),
                PopupMenuItem(child: Text("Settings")),
              ];
            },
          )
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.camera_alt,
                size: 20,
                color: Colors.white,
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: TabBar(
                  controller: tabController,
                  labelPadding: EdgeInsets.symmetric(vertical: 10),
                  tabs: [
                    Text("CHATS"),
                    Text("STATUS"),
                    Text("CALLS"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          Chats(),
          StatusScreen(),
          CallsScreen(),
        ],
      ),
    );
  }
}
