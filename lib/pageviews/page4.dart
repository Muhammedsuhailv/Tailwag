import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mainproject/signup.dart';
import '../user-continueus.dart';

class Page4 extends StatelessWidget {
  const Page4({Key? key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor("F2DFB2"),
        body: Column(
          children: [
            // New Curved Container with Image
            SizedBox(
              height: screenHeight * 0.5,
              child: Stack(
                children: [
                  ClipPath(
                    clipper: MyNewClipper(),
                    child: Container(
                      height: screenHeight * 0.9,
                      decoration: BoxDecoration(
                        color: HexColor("#7A5600"),
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("img/nayapoochapage2young-cartoon-girl-working-small-petshop_74855-19950.jpg"),
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
              "Quick care & ",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: HexColor('#7A5600'),
                fontFamily: 'AbhayaLibre',
                fontSize: screenHeight * 0.07,
              ),
            ),
            Text(
              "Healing Begins",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: HexColor('#7A5600'),
                fontFamily: 'AbhayaLibre',
                fontSize: screenHeight * 0.07,
              ),
            ),
             SizedBox(
              height: screenHeight * 0.01,
            ),
             Text(
              "Expert care, loving hands, discover",
              style: TextStyle(
                fontFamily: 'AbhayaLibre',
                fontSize: screenHeight * 0.025,
              ),
            ),
             Text(
              "quality care at veterinary clinics.",
              style: TextStyle(
                fontFamily: 'AbhayaLibre',
                fontSize: screenHeight * 0.025,
              ),
            ),
             SizedBox(
              height: screenHeight * 0.04,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < 4; i++)
                  Text(
                    ".",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: screenHeight * 0.04,
                      color: i == 3 ? HexColor("#7A5600") : Colors.grey[400],
                    ),
                  ),
              ],
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ContinueAs()),
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

class MyNewClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - size.height * 0.1);
    path.quadraticBezierTo(
        size.width / 2, size.height + size.height * 0.05, size.width, size.height - size.height * 0.1);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
