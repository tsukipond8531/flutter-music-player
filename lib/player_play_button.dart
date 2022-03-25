import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music_player/player_model.dart';
import 'package:provider/provider.dart';

class PlayButton extends StatelessWidget {
  const PlayButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 74.0,
      onPressed: () async {
        if (context.read<PlayerModel>().playing) {
          context.read<PlayerModel>().pause();
        } else {
          if (context.read<PlayerModel>().audioPlayer == null) {
            context.read<PlayerModel>().play();
          } else {
            context.read<PlayerModel>().resume();
          }
        }
      },
      icon: Icon(
        context.watch<PlayerModel>().playIcon,
        color: Colors.white,
      ),
    );
  }
}
