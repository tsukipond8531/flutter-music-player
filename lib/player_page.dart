import 'package:flutter_music_player/player_add_playlist_button.dart';
import 'package:flutter_music_player/player_next_button.dart';
import 'package:flutter_music_player/player_play_button.dart';
import 'package:flutter_music_player/player_model.dart';
import 'package:flutter_music_player/player_reset_button.dart';
import 'package:provider/provider.dart';
import 'package:flutter_music_player/config.dart';
import 'package:flutter_music_player/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music_player/player_slider.dart';

class PlayerPage extends StatelessWidget {
  OutlinedButton speedButton(BuildContext context, double _speed) {
    return OutlinedButton(
      onPressed: () {
        context.read<PlayerModel>().setSpeed(_speed);
      },
      child: Text((_speed * 100).toString() + '%'),
      style: OutlinedButton.styleFrom(
          primary: Colors.white, backgroundColor: Colors.grey),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        drawer: drawer(context),
        body: Container(
            color: themeColor,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Center(
                    child: Text(
                      '${context.watch<PlayerModel>().name}',
                      style: TextStyle(color: Colors.white, fontSize: 24.0),
                    ),
                  ),
                  Center(
                    child: PlayerSlider(),
                  ),
                  Container(
                    height: 100.0,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ResetButton(),
                          PlayButton(),
                          NextButton(),
                          AddPlaylistButton()
                        ]),
                  ),
                  Wrap(
                    spacing: 10,
                    children: [
                      speedButton(context, 0.9),
                      speedButton(context, 1.0),
                    ],
                  ),
                ],
              ),
            )));
  }
}
