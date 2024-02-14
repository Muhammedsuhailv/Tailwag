import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mainproject/pageviews/page3.dart';
import 'package:mainproject/pageviews/page4.dart';
import 'package:mainproject/signup.dart';

class Page3 extends StatelessWidget {
  const Page3({Key? key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor("F2DFB2"),
        body: Column(
          children: [
            Container(
              height: 270,
              decoration: BoxDecoration(
                  color: HexColor("#7A5600"),
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.elliptical(300, 150),
                  ),
                  image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                          "img/nayeepooocha'page3emotional-support-animal-concept-illustration_114360-19462.jpg"))),

            ),
            SizedBox(
              height: 50,
            ),
            Text(
              "The lovely spa ",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: HexColor('#7A5600'),
                  fontFamily: 'AbhayaLibre',
                  fontSize: 35),
            ),
            Text(
              "day!",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: HexColor('#7A5600'),
                  fontFamily: 'AbhayaLibre',
                  fontSize: 35),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              "Discover pet groomers for ultimate",
              style: TextStyle(
                fontFamily: 'AbhayaLibre',
                fontSize: 18,
              ),
            ),
            const Text(
              "pampering moments and give your",
              style: TextStyle(
                fontFamily: 'AbhayaLibre',
                fontSize: 18,
              ),
            ),
            const Text(
              "furry friend the TLC they deserve.",
              style: TextStyle(
                fontFamily: 'AbhayaLibre',
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: SizedBox(width:MediaQuery.of(context).size.width-50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    for (int i = 0; i < 4; i++)
                      Text(
                        ".",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.height * 0.06,
                          color: i == 2 ? HexColor("#7A5600") : Colors.grey[400],
                        ),
                      ),
                  ],
                ),
              ),
            ),


          ],
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Page4()),
            );
          },
          backgroundColor: HexColor("#7A5600"),
          child: const Icon(
            Icons.arrow_circle_right_outlined,
            color: Colors.white,
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(45)),

        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}
