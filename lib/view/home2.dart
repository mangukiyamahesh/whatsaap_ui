import 'package:flutter/material.dart';
import 'package:whatsapp_ui/view/calls_screen.dart';
import 'package:whatsapp_ui/view/chats_screen.dart';
import 'package:whatsapp_ui/view/status_screen.dart';

class Home1 extends StatefulWidget {
  const Home1({Key? key}) : super(key: key);

  @override
  State<Home1> createState() => _Home1State();
}

class _Home1State extends State<Home1> with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('WhatsApp'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
          PopupMenuButton(
            onSelected: (value) {},
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: Text('New Group'),
                ),
                PopupMenuItem(
                  child: Text('New Broadcast'),
                ),
                PopupMenuItem(
                  child: Text('Linked devices'),
                ),
                PopupMenuItem(
                  child: Text('Starred messages'),
                ),
                PopupMenuItem(
                  child: Text('Payments'),
                ),
                PopupMenuItem(
                  child: Text('Settings'),
                ),
              ];
            },
          ),
        ],
        bottom: TabBar(
          controller: tabController,
          labelPadding: EdgeInsets.symmetric(vertical: height * 0.02),
          tabs: [
            Text('CHATS'),
            Text('STATUS'),
            Text('CALLS'),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          ChatsScreen(),
          StatusScreen(),
          CallsScreen(),
        ],
      ),
    );
  }
}
