import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mainproject/views/pageviews/page3.dart';

class Page2 extends StatelessWidget {
  const Page2({Key? key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor("F2DFB2"),
        body: Column(
          children: [
            // Curved Container with Image
            SizedBox(
              height: 300, // Adjust the height as needed
              child: Stack(
                children: [
                  ClipPath(
                    clipper: MyClipper(),
                    child: Container(
                      height: 755,
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                              "img/nayahand-drawn-illustration-people-with-pets_23-2148980837.jpg"),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Text Below Curved Container

            const SizedBox(
              height: 30,
            ),
            Text(
              "From paws to ",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: HexColor('#7A5600'),
                  fontFamily: 'AbhayaLibre',
                  fontSize: 35),
            ),
            Text(
              "paradise! ",
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
              "Easily locate and explore ",
              style: TextStyle(
                fontFamily: 'AbhayaLibre',
                fontSize: 18,
              ),
            ),
            const Text(
              "neighborhood pet shops and ",
              style: TextStyle(
                fontFamily: 'AbhayaLibre',
                fontSize: 18,
              ),
            ),
            const Text(
              "discover exclusive deals.",
              style: TextStyle(
                fontFamily: 'AbhayaLibre',
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 30,
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
                          color: i == 1 ? HexColor("#7A5600") : Colors.grey[400],
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
              MaterialPageRoute(builder: (context) => Page3()),
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

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(
        0, size.height - 45); // Increase the offset to increase curvature
    path.quadraticBezierTo(size.width / 2, size.height + 20, size.width,
        size.height - 45); // Adjust the control point
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
