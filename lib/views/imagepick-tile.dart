import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ImagePickTile extends StatelessWidget {
  String title;
  String subtitile;
  VoidCallback onPressed;
  ImagePickTile(
      {required this.title,
        required this.subtitile,
        required this.onPressed,
        super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      leading: Image.asset(
        'img/png-clipart-gray-message-icon-computer-icons-document-button-save-copy-miscellaneous-angle-removebg-preview.png',
        scale: 10,
      ),
      title: Text(
        title,
        style: const TextStyle(
            color: Color(0xFF7A5600),
            fontFamily: 'AbhayaLibre_regular',
            fontSize: 18,
            fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        subtitile,
        style: const TextStyle(
            color: Colors.grey, fontFamily: 'AbhayaLibre_regular'),
      ),
    );
  }
}
