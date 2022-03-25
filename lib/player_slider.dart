import 'package:flutter/material.dart';
import 'package:flutter_music_player/player_model.dart';
import 'package:provider/provider.dart';

class PlayerSlider extends StatelessWidget {
  const PlayerSlider({Key? key}) : super(key: key);

  SliderTheme playerSlider(context, slider) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
          activeTrackColor: Colors.white,
          inactiveTrackColor: Colors.white,
          thumbColor: Colors.white),
      child: slider,
    );
  }

  @override
  Widget build(BuildContext context) {
    return playerSlider(
      context,
      Slider(
          value: context.read<PlayerModel>().currentPosition,
          min: 0,
          max: context.read<PlayerModel>().max,
          onChanged: (value) {
            context.read<PlayerModel>().seek(value);
          }),
    );
  }
}
