import 'package:flutter/material.dart';
import 'package:mainproject/views/fish/fishmain.dart';
import 'package:mainproject/views/sitter/editprofile.dart';

import 'package:mainproject/views/spalshscreen.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:mainproject/views/pageviews/allpageview.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const splash(),
        '//': (context) => const pageview(),
        '/update': (context) => SitterEditProfile()
      },
      initialRoute: '/',
// home: FishMain(),
    );
  }
}
