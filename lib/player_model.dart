import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PlayerModel with ChangeNotifier, DiagnosticableTreeMixin {
  int _count = 0;
  String _name = '';
  String _src = '';
  double _speed = 1.0;
  bool _playing = false;
  IconData _playIcon = Icons.play_arrow;
  double _max = 0.0;
  double _currentPosition = 0.0;

  AudioCache _player = AudioCache();
  AudioPlayer? _audioPlayer;

  int get count => _count;
  String get name => _name;
  String get src => _src;
  double get speed => _speed;
  bool get playing => _playing;
  IconData get playIcon => _playIcon;
  double get max => _max;
  double get currentPosition => _currentPosition;

  AudioCache get player => _player;
  AudioPlayer? get audioPlayer => _audioPlayer;

  void increment() {
    _count++;
    notifyListeners();
  }

  void setName(String name) {
    _name = name;
    notifyListeners();
  }

  void setSrc(String src) {
    if (_src == src) {
      return;
    }
    stop();
    _src = src;
    notifyListeners();
  }

  void setSpeed(double speed) {
    _audioPlayer!.setPlaybackRate(playbackRate: _speed);
    _speed = speed;
    notifyListeners();
  }

  void play() async {
    _audioPlayer = await player.play(src);

    _audioPlayer!.onDurationChanged.listen((Duration d) {
      _max = d.inSeconds.toDouble();
      notifyListeners();
    });

    _audioPlayer!.onAudioPositionChanged.listen((Duration p) {
      _currentPosition = p.inSeconds.toDouble();
      notifyListeners();
    });

    _playing = true;
    _playIcon = Icons.pause;
    notifyListeners();
  }

  void resume() async {
    _audioPlayer!.resume();
    _playing = true;
    _playIcon = Icons.pause;
    notifyListeners();
  }

  void pause() {
    _audioPlayer!.pause();
    _playing = false;
    _playIcon = Icons.play_arrow;
    notifyListeners();
  }

  void stop() {
    _audioPlayer?.stop();
    _audioPlayer = null;
    _playing = false;
    _playIcon = Icons.play_arrow;
    _currentPosition = 0;
    notifyListeners();
  }

  void seek(double value) {
    _audioPlayer!
        .seek(Duration(seconds: value.toInt()))
        .then((_) => _currentPosition = value);
  }

  void reset() {
    _audioPlayer!.seek(Duration(seconds: 0)).then((_) => _currentPosition = 0);
  }

  void next() {
    UnimplementedError();
  }

  void addPlaylist() {
    UnimplementedError();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('count', count));
    properties.add(StringProperty('name', name));
    properties.add(StringProperty('src', src));
    properties.add(DoubleProperty('speed', speed));
  }
}
