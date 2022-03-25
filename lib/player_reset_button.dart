import 'package:flutter/cupertino.dart';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_music_player/player_model.dart';
import 'package:provider/provider.dart';

class ResetButton extends StatelessWidget {
  const ResetButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        iconSize: 54.0,
        onPressed: () async {
          context.read<PlayerModel>().reset();
        },
        icon: Transform(
          transform: Matrix4.rotationY(math.pi),
          child: Icon(
            Icons.play_arrow,
            color: Colors.white,
          ),
        ));
  }
}
