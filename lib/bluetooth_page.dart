import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_music_player/config.dart';

import 'drawer.dart';

class BluetoothPage extends StatelessWidget {
  const BluetoothPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.bluetoothPage),
      ),
      drawer: drawer(context),
      body: Container(color: themeColor),
    );
  }
}
