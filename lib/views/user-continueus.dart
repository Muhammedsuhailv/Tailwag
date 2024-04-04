import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mainproject/views/signup.dart';
import 'package:mainproject/views/admin/adminloging.dart';
import 'package:mainproject/views/sitter/sitter-signup.dart';


class ContinueAs extends StatelessWidget {
  const ContinueAs({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: HexColor("F2DFB2"),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text(
              "You're ?",
              style: TextStyle(
                  fontFamily: 'AbhayaLibre', color: HexColor("7A5600"), fontSize: 25),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: width / 2,
              child: ElevatedButton(
                style:  ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(HexColor("7A5600"))),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>  UserSignUpPage(),
                    ),
                  );
                },
                child: const Text(
                  'Pet Owner',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'AbhayaLibre',
                      fontSize: 20),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: width / 2,
              child: ElevatedButton(
                style:  ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(HexColor("7A5600"))),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>  const SitterSignup(),
                    ),
                  );
                },
                child: const Text(
                  'Sitter',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'AbhayaLibre',
                      fontSize: 20),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: width / 2,
              child: ElevatedButton(
                style:  ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(HexColor("7A5600"))),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AdminLogin(),
                    ),
                  );
                },
                child: const Text(
                  'Admin',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'AbhayaLibre',
                      fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
