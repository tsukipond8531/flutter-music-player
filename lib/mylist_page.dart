import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music_player/config.dart';

import 'drawer.dart';

class MylistPage extends StatelessWidget {
  const MylistPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: drawer(context),
      body: Container(
        color: themeColor,
        child: ListView(
          children: [
            ListTile(
                title: Text(
              'test',
              style: TextStyle(color: Colors.white),
            ))
          ],
        ),
      ),
    );
  }
}
