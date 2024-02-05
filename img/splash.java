import 'package:flutter/material.dart';
class splash extends StatelessWidget {
  const splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2),(){
      if(context!= null&&context.mounted){
        Navigator.of(context).pushReplacementNamed('signup');
      }
    });
    return Scaffold(
body: Container(height: double.infinity,width: double.infinity,decoration: BoxDecoration(image: DecorationImage(fit:BoxFit.cover,image: AssetImage("img/mvs.png"))),),
    );
  }
}
