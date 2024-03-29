import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'controllel/BackendServices.dart';
import 'controllel/BackendServices.dart';
import 'controllel/BackendServices.dart';
import 'login.dart';
import 'otpfirstscreen.dart';

class UserSignUpPage extends StatefulWidget {
  const UserSignUpPage({super.key});

  @override
  State<UserSignUpPage> createState() => _UserSignUpPageState();
}

class _UserSignUpPageState extends State<UserSignUpPage> {
  @override
  var pass = true;

  var cpass = true;

  var username = TextEditingController();

  var email = TextEditingController();

  var password = TextEditingController();

  var conformpassword = TextEditingController();

  BackendServiecs backendServiecs = BackendServiecs();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor("F2DFB2"),
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            children: [
              Container(
                height: 35,
                width: 55,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(175),
                        topRight: Radius.circular(5)),
                    color: HexColor("BFA05A")),
              ),
              Positioned(
                  top: 35,
                  child: Container(
                    height: 210,
                    width: 135,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.only(topRight: Radius.circular(155)),
                        color: HexColor("BFA05A")),
                  )),
              Positioned(
                left: 165,
                top: 75,
                child: Column(
                  children: [
                    Image.asset(
                      "img/logosignup and login logo logo logo.png",
                      width: 130,
                    )
                  ],
                ),
              ),
              Positioned(
                  top: 65,
                  child: Column(
                    children: [
                      Image.asset(
                        "img/playful-terrier-pup-with-blue-background-focus-generated-by-ai__2_-removebg-preview 1.png",
                        width: 225,
                      ),
                    ],
                  )),
              Positioned(
                top: 215,
                child: Container(
                  height: 445,
                  width: 359,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [HexColor("#BFA05A"), HexColor("#D8B053")]),
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(29),
                          topLeft: Radius.circular(35))),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 0.0, top: 15, right: 33),
                        child: Image.asset(
                          "img/zzitsfeets.png",
                          width: 89,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 260.0, top: 15, right: 3),
                        child: Transform.rotate(
                          angle:
                              -5.5708, // Angle in radians for 90 degrees rotation
                          child: Image.asset("img/zzitsfeets.png", width: 89),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 290.0, top: 195),
                        child: Transform.rotate(
                          angle:
                              -5.5708, // Angle in radians for 90 degrees rotation
                          child: Image.asset("img/zzitsfeets.png", width: 89),
                        ),
                      ),
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Start with us!",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Katibeh',
                                  fontSize: 29,
                                  color: HexColor("#604401")),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                                alignment: Alignment.centerLeft,
                                height: 48,
                                width: 261,
                                child: TextField(
                                  controller: username,
                                  decoration: InputDecoration(
                                      hintText: "Username",
                                      hintStyle: TextStyle(
                                          color: HexColor("#7A5600"),
                                          fontFamily: 'AbhayaLibre_regular',
                                          fontWeight: FontWeight.w300),
                                      filled: true,
                                      fillColor: HexColor("#F2DFB2"),
                                      enabledBorder: const OutlineInputBorder(),
                                      focusedBorder: const OutlineInputBorder()),
                                )),
                            const SizedBox(
                              height: 22,
                            ),
                            Container(
                                alignment: Alignment.centerLeft,
                                height: 48,
                                width: 261,
                                child: TextField(
                                  controller: email,
                                  decoration: InputDecoration(
                                      hintText: "Email",
                                      hintStyle: TextStyle(
                                          color: HexColor("#7A5600"),
                                          fontFamily: 'AbhayaLibre_regular',
                                          fontWeight: FontWeight.w300),
                                      filled: true,
                                      fillColor: HexColor("#F2DFB2"),
                                      enabledBorder: const OutlineInputBorder(),
                                      focusedBorder: const OutlineInputBorder()),
                                )),
                            const SizedBox(
                              height: 22,
                            ),
                            Container(
                                alignment: Alignment.centerLeft,
                                height: 48,
                                width: 261,
                                child: TextField(
                                  obscureText: pass,
                                  controller: password,
                                  decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              pass = !pass;
                                            });
                                          },
                                          icon: Icon(
                                            pass
                                                ? Icons.visibility_off
                                                : Icons.visibility,
                                            color: HexColor("#7A5600"),
                                          )),
                                      hintText: "Password",
                                      hintStyle: TextStyle(
                                          color: HexColor("#7A5600"),
                                          fontFamily: 'AbhayaLibre_regular',
                                          fontWeight: FontWeight.w300),
                                      filled: true,
                                      fillColor: HexColor("#F2DFB2"),
                                      enabledBorder: const OutlineInputBorder(),
                                      focusedBorder: const OutlineInputBorder()),
                                )),
                            const SizedBox(
                              height: 18,
                            ),
                            Container(
                                alignment: Alignment.centerLeft,
                                height: 48,
                                width: 261,
                                child: TextField(
                                  obscureText: cpass,
                                  controller: conformpassword,
                                  decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              cpass = !cpass;
                                            });
                                          },
                                          icon: Icon(
                                            cpass
                                                ? Icons.visibility_off
                                                : Icons.visibility,
                                            color: HexColor("#7A5600"),
                                          )),
                                      hintText: "Conform password",
                                      hintStyle: TextStyle(
                                          color: HexColor("#7A5600"),
                                          fontFamily: 'AbhayaLibre_regular',
                                          fontWeight: FontWeight.w300),
                                      filled: true,
                                      fillColor: HexColor("#F2DFB2"),
                                      enabledBorder: const OutlineInputBorder(),
                                      focusedBorder: const OutlineInputBorder()),
                                )),
                            const SizedBox(
                              height: 18,
                            ),
                            InkWell(
                              onTap: () {
                                backendServiecs.signUp(username.text,email.text,password.text,context);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const OtpScreen(),
                                    ));
                              },
                              child: Container(
                                height: 48,
                                width: 261,
                                decoration: BoxDecoration(
                                    color: HexColor("#7A5600"),
                                    borderRadius: BorderRadius.circular(6)),
                                alignment: Alignment.center,
                                child: const Text(
                                  "Sign up",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'AbhayaLibre_regular',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 8.0, left: 2),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Already have an account?",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'AbhayaLibre_regular',
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 3.0),
                                    child: TextButton(
                                      style: const ButtonStyle(
                                          minimumSize: MaterialStatePropertyAll(
                                              Size(2, 5))),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => const Login()));
                                      },
                                      child: Text("Login",
                                          style: TextStyle(
                                            color: HexColor("#604401"),
                                            fontFamily: 'AbhayaLibre',
                                          )),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
