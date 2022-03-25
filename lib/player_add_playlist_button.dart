import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_music_player/player_model.dart';
import 'package:provider/provider.dart';

class AddPlaylistButton extends StatelessWidget {
  const AddPlaylistButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 54.0,
      onPressed: () async {
        context.read<PlayerModel>().addPlaylist();
      },
      icon: Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }
}
