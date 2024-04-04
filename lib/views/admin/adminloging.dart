import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mainproject/controller/adminCntl.dart';

import 'adminbottomnavbar.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({Key? key}) : super(key: key);

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  var pass = true;
  var cpass = true;
  var username = TextEditingController();
  var email = TextEditingController();
  var password = TextEditingController();
  var conformpassword = TextEditingController();

  AdminController adminController = AdminController(FirebaseAuth.instance);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor("F2DFB2"),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            children: [
              Container(
                height: 35,
                width: 55,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
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
                            BorderRadius.only(topRight: Radius.circular(155)),
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
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [HexColor("#BFA05A"), HexColor("#D8B053")]),
                      borderRadius: BorderRadius.only(
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
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Welcome Back",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Katibeh',
                                  fontSize: 50,
                                  color: HexColor("#604401")),
                            ),
                            Text(
                              "Happy to see you again!!",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Katibeh',
                                  fontSize: 25,
                                  color: HexColor("#604401")),
                            ),
                            SizedBox(
                              height: 22,
                            ),
                            Container(
                                alignment: Alignment.centerLeft,
                                height: 48,
                                width: 261,
                                child: TextField(
                                  controller: email,
                                  decoration: InputDecoration(
                                      hintText: "admin@gmail.com",
                                      hintStyle: TextStyle(
                                          color: HexColor("#7A5600"),
                                          fontFamily: 'AbhayaLibre_regular',
                                          fontWeight: FontWeight.w300),
                                      filled: true,
                                      fillColor: HexColor("#F2DFB2"),
                                      enabledBorder: OutlineInputBorder(),
                                      focusedBorder: OutlineInputBorder()),
                                )),
                            SizedBox(
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
                                      hintText: "admin123",
                                      hintStyle: TextStyle(
                                          color: HexColor("#7A5600"),
                                          fontFamily: 'AbhayaLibre_regular',
                                          fontWeight: FontWeight.w300),
                                      filled: true,
                                      fillColor: HexColor("#F2DFB2"),
                                      enabledBorder: OutlineInputBorder(),
                                      focusedBorder: OutlineInputBorder()),
                                )),
                            SizedBox(
                              height: 18,
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SizedBox(
                                  width: 45,
                                ),
                                InkWell(
                                  child: Text(
                                    "Forgot password?",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'AbhayaLibre',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 18,
                            ),
                            InkWell(

                                onTap: () {
                                  adminController.adminLogin(
                                      email.text, password.text, context);
                                },

                              child: Container(
                                height: 48,
                                width: 261,
                                decoration: BoxDecoration(
                                    color: HexColor("#7A5600"),
                                    borderRadius: BorderRadius.circular(6)),
                                alignment: Alignment.center,
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'AbhayaLibre_regular',
                                      fontSize: 20),
                                ),
                              ),
                            ),

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
