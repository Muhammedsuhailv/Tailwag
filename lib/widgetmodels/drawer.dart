import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

Widget buildDrawerItem(IconData icon, String title) {
  return Card(
    color: HexColor("F2DFB2"),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5),
    ),
    child: ListTile(
      leading: Icon(
        icon,
        size: 30,
        color: Colors.black,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    ),
  );
}