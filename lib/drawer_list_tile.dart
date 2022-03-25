import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'config.dart';

Container drawerListTile(icon, title, onTap) {
  return Container(
    decoration:
        BoxDecoration(border: Border(bottom: BorderSide(color: Colors.white))),
    child: ListTile(
        leading: Icon(
          icon,
          color: Colors.white,
        ),
        title: Text(title, style: drawerListTileTextStyle),
        onTap: onTap),
  );
}
