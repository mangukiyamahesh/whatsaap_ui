import 'package:flutter/material.dart';
import 'package:whatsapp_ui/data.dart';

class CallsScreen extends StatefulWidget {
  const CallsScreen({Key? key}) : super(key: key);

  @override
  State<CallsScreen> createState() => _CallsScreenState();
}

class _CallsScreenState extends State<CallsScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView.builder(
        itemCount: 20,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              radius: height * 0.035,
              backgroundImage: NetworkImage(
                data[index]['image'],
              ),
            ),
            title: Text(
              data[index]['title'],
              maxLines: 1,
            ),
            subtitle: Text(
              data[index]['rating']['rate'].toString(),
            ),
            trailing: Icon(Icons.videocam),
          );
        },
      ),
    );
  }
}
