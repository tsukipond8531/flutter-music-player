import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_music_player/config.dart';
import 'package:flutter_music_player/player_model.dart';
import 'package:flutter_music_player/search_model.dart';
import 'package:flutter_music_player/search_text_field.dart';
import 'package:provider/provider.dart';

import 'drawer.dart';

class SearchPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.searchPage),
      ),
      drawer: drawer(context),
      body: Container(
          color: themeColor,
          child: Column(
            children: [
              SearchTextField(),
              Flexible(
                child: ListView(
                  children: context
                      .watch<SearchModel>()
                      .filteredFiles
                      .map((file) => ListTile(
                            title: Text(
                              file['name']!,
                              style: TextStyle(color: Colors.white),
                            ),
                            onTap: () {
                              context.read<PlayerModel>().setSrc(file['src']!);
                              context
                                  .read<PlayerModel>()
                                  .setName(file['name']!);
                              Navigator.pushReplacementNamed(
                                  context, '/player');
                            },
                          ))
                      .toList(),
                ),
              )
            ],
          )),
    );
  }
}
