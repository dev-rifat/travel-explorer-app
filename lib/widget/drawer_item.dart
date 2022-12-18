import 'package:flutter/material.dart';

Widget DrawerItem(title, onClick) {
  return InkWell(
    onTap: onClick,
    child: Text(
      title,
      style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
    ),
  );
}
