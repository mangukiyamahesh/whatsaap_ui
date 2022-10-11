import 'package:flutter/material.dart';

import '../data.dart';

class StatusScreen extends StatefulWidget {
  const StatusScreen({Key? key}) : super(key: key);

  @override
  State<StatusScreen> createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final widget = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: widget * 0.05, vertical: height * 0.01),
            child: Row(
              children: [
                CircleAvatar(
                  radius: height * 0.035,
                  backgroundColor: Colors.grey,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: widget * 0.04),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'My Status',
                        style: TextStyle(
                            fontSize: height * 0.025,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: height * 0.002,
                      ),
                      Text(
                        'Yesterday',
                        style: TextStyle(
                            fontSize: height * 0.02,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Icon(
                  Icons.more_horiz,
                  color: Colors.teal,
                ),
              ],
            ),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: widget * 0.05),
            child: Text(
              'Recent updates',
              style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w400,
                  fontSize: height * 0.019),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: data.length,
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(vertical: height * 0.02),
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    radius: height * 0.035,
                    backgroundColor: Colors.grey,
                    backgroundImage: NetworkImage(
                      data[index]['image'],
                    ),
                  ),
                  title: Text(data[index]['title'], maxLines: 1),
                  subtitle: Text(data[index]['id'].toString()),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CircleAvatar(
            radius: height * 0.032,
            child: Icon(Icons.edit),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.camera_alt),
          ),
        ],
      ),
    );
  }
}
