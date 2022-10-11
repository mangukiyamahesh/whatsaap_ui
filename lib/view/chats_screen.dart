import 'package:flutter/material.dart';

import '../data.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({Key? key}) : super(key: key);

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.message),
      ),
      body: ListView.builder(
        itemCount: 20,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return ListTile(
            leading: InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(
                      insetPadding: EdgeInsets.only(bottom: height * 0.275),
                      child: Container(
                        height: height * 0.42,
                        width: height * 0.1,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          image: DecorationImage(
                              image: NetworkImage(
                                data[index]['image'],
                              ),
                              fit: BoxFit.cover),
                        ),
                      ),
                    );
                  },
                );
              },
              child: CircleAvatar(
                radius: height * 0.03,
                backgroundImage: NetworkImage(data[index]['image']),
              ),
            ),
            title: Text(
              data[index]['title'],
              maxLines: 1,
            ),
            subtitle: Text(data[index]['category']),
            trailing: Text(data[index]['rating']['count'].toString()),
          );
        },
      ),
    );
  }
}
