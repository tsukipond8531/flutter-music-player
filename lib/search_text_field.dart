import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music_player/search_model.dart';
import 'package:provider/provider.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration:
          InputDecoration(border: OutlineInputBorder(), labelText: '検索'),
      onChanged: context.read<SearchModel>().search,
    );
  }
}
