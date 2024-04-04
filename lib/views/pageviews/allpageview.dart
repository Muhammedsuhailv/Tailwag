import 'package:flutter/material.dart';
import 'package:mainproject/views/pageviews/page1.dart';
import 'package:mainproject/views/pageviews/page2.dart';
import 'package:mainproject/views/pageviews/page3.dart';
import 'package:mainproject/views/pageviews/page4.dart';

//
class pageview extends StatefulWidget {
  const pageview({Key? key}) : super(key: key);

  @override
  State<pageview> createState() => _pageviewState();
}

class _pageviewState extends State<pageview> {

  final PageController _controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.lime,
      body:Container(height: double.infinity,width: double.infinity,
        color: Colors.lime,
        child: PageView(children: const [
          Page1(),
          Page2(),
          Page3(),
          Page4()
        ],)
            ),
    );
  }
}
