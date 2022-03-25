import 'package:flutter/material.dart';
import 'package:flutter_music_player/about_seika.dart';
import 'package:flutter_music_player/bluetooth_page.dart';
import 'package:flutter_music_player/config.dart';
import 'package:flutter_music_player/how_to_use_page.dart';
import 'package:flutter_music_player/mylist_page.dart';
import 'package:flutter_music_player/player_model.dart';
import 'package:flutter_music_player/search_model.dart';
import 'package:flutter_music_player/search_page.dart';
import 'package:provider/provider.dart';

import 'player_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => PlayerModel()),
      ChangeNotifierProvider(create: (_) => SearchModel())
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '聖歌プレイヤー',
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('en', ''),
          Locale('ja', ''),
        ],
        theme: ThemeData(primaryColor: themeColor),
        initialRoute: '/search',
        routes: {
          '/player': (context) => PlayerPage(),
          '/search': (context) => SearchPage(),
          '/mylist': (context) => MylistPage(),
          '/aboutSeika': (context) => AboutSeikaPage(),
          '/howToUse': (context) => HowToUsePage(),
          '/bluetooth': (context) => BluetoothPage(),
        });
  }
}
