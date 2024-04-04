import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mainproject/views/pageviews/page2.dart';

class Page1 extends StatelessWidget {
  const Page1({Key? key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor("F2DFB2"),
        body: Column(
          children: [
            // New Curved Container with Image
            SizedBox(
              height: 325, // Increase the height as needed
              child: Stack(
                children: [
                  ClipPath(
                    clipper: MyNewClipper(),
                    child: Container(
                      height:
                          625, // Further increase the height to make the curved container taller
                      decoration: BoxDecoration(
                        color: HexColor(
                            "#7A5600"), // Change the color to your preference
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                              "img/nayapoochapage2young-cartoon-girl-working-small-petshop_74855-19950.jpg"), // Replace with your image path
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Text Below New Curved Container

            const SizedBox(
              height: 25,
            ),
            Text(
              "Trusty Sitters, ",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: HexColor('#7A5600'),
                  fontFamily: 'AbhayaLibre',
                  fontSize: 35),
            ),
            Text(
              "Happy Tails ",
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
              "Discover trusted pet sitters for ",
              style: TextStyle(
                fontFamily: 'AbhayaLibre_regular',
                fontSize: 18,
              ),
            ),
            const Text(
              "peace of mind when you're away.",
              style: TextStyle(
                fontFamily: 'AbhayaLibre_regular',
                fontSize: 18,
              ),
            ),
            // Text("discover exclusive deals.",style: TextStyle(),),
            const SizedBox(
              height: 27,
            ),
            Spacer(),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    for (int i = 0; i < 4; i++)
                      Text(
                        ".",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.height * 0.06,
                          color: i == 1 ? HexColor("#7A5600") : Colors.grey[400],
                        ),
                      ),
                  ],
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Page2(),
                        ));
                  },
                  style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all(HexColor("#7A5600")),
                  ),
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
         ])
      )
        );

  }
}

class MyNewClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(
        0, size.height - 50); // Adjust the offset to increase the curvature
    path.quadraticBezierTo(size.width / 4, size.height / 2, size.width / 2,
        size.height - 50); // Adjust the control points
    path.quadraticBezierTo((3 * size.width) / 4, size.height, size.width,
        size.height - 50); // Adjust the control points
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
// image: AssetImage("img/page4people-playing-with-their-pets_52683-38011.jpg"),
//
