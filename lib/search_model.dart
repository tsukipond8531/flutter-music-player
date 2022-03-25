import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SearchModel with ChangeNotifier, DiagnosticableTreeMixin {
  String _searchText = '';
  List<Map<String, String>> _files = [
    {'name': 'bd_mp3_001', 'src': 'bd_mp3/001.mp3'},
    {'name': 'bd_mp3_024', 'src': 'bd_mp3/024.mp3'},
    {'name': 'bd_mp3_201', 'src': 'bd_mp3/201.mp3'},
    {'name': 'bd_wav_001', 'src': 'bd_wav/001.wav'},
    {'name': 'bd_wav_024', 'src': 'bd_wav/024.wav'},
    {'name': 'bd_wav_201', 'src': 'bd_wav/201.wav'},
    {'name': 'cd_001', 'src': 'cd/001.wav'},
    {'name': 'cd_024', 'src': 'cd/024.wav'},
    {'name': 'cd_201', 'src': 'cd/201.wav'},
  ];

  String get searchText => _searchText;
  List<Map<String, String>> get files => _files;
  List<Map<String, String>> get filteredFiles =>
      _files.where((f) => f['name']!.contains(_searchText)).toList();

  void search(String charas) {
    _searchText = charas;
    notifyListeners();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
  }
}
