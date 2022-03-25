import 'package:flutter/material.dart';
import 'package:flutter_music_player/drawer_list_tile.dart';

import 'config.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

IconButton closeMenuButton(context) {
  return IconButton(
    onPressed: () {
      Navigator.pop(context);
    },
    icon: Icon(
      Icons.close,
      color: Colors.white,
      size: 30.0,
    ),
    hoverColor: Colors.transparent,
  );
}

Drawer drawer(context) {
  return Drawer(
    child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
        color: drawerColor,
        child: ListView(
          children: [
            Row(
              children: [
                Spacer(),
                closeMenuButton(context),
              ],
            ),
            drawerListTile(
                Icons.play_arrow, AppLocalizations.of(context)!.playPage, () {
              Navigator.pushReplacementNamed(context, '/player');
            }),
            drawerListTile(
                Icons.search, AppLocalizations.of(context)!.searchPage, () {
              Navigator.pushReplacementNamed(context, '/search');
            }),
            drawerListTile(Icons.music_note,
                AppLocalizations.of(context)!.myListPage, () {}),
            drawerListTile(
                Icons.menu_book, AppLocalizations.of(context)!.aboutSeikaPage,
                () {
              Navigator.pushReplacementNamed(context, '/aboutSeika');
            }),
            drawerListTile(
                Icons.edit, AppLocalizations.of(context)!.howToUsePage, () {
              Navigator.pushReplacementNamed(context, '/howToUse');
            }),
            drawerListTile(
                Icons.bluetooth, AppLocalizations.of(context)!.bluetoothPage,
                () {
              Navigator.pushReplacementNamed(context, '/bluetooth');
            }),
          ],
        )),
  );
}
