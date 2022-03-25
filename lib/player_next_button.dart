import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_music_player/player_model.dart';
import 'package:provider/provider.dart';

class NextButton extends StatelessWidget {
  const NextButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 54.0,
      onPressed: () async {
        context.read<PlayerModel>().next();
      },
      icon: Icon(
        Icons.play_arrow,
        color: Colors.white,
      ),
    );
  }
}
