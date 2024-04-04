import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class splash extends StatelessWidget {
  const splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () {
      if (context != null && context.mounted) {
        Navigator.of(context).pushReplacementNamed('//');
      }
    });
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("img/Splash screen (2)0.png"))),
      ),
    );
  }
}
