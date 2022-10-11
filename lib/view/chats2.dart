import 'package:flutter/material.dart';

import '../data.dart';

class Chats extends StatefulWidget {
  const Chats({Key? key}) : super(key: key);

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
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
            leading: InkResponse(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(
                      insetPadding: EdgeInsets.only(bottom: height * 0.3),
                      child: Container(
                        height: height * 0.4,
                        width: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              data[index]['image'],
                            ),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              height: height * 0.06,
                              color: Colors.white,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(
                                    Icons.message_outlined,
                                    color: Colors.teal,
                                  ),
                                  Icon(
                                    Icons.call,
                                    color: Colors.teal,
                                  ),
                                  Icon(
                                    Icons.videocam_sharp,
                                    color: Colors.teal,
                                  ),
                                  Icon(
                                    Icons.info_outline,
                                    color: Colors.teal,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  data[index]['image'],
                ),
                radius: height * 0.032,
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
