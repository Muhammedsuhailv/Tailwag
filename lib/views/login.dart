import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mainproject/views/bottomnavigationbars.dart';
import 'package:mainproject/views/signup.dart';

import '../controller/BackendServices.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(155)),
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
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 45.0),
                          child: Column(
                            children: [
                              const SizedBox(
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
                              const SizedBox(
                                height: 22,
                              ),
                              TextField(


                                controller: email,
                                decoration: InputDecoration(
                                  isDense: true,
                                    hintText: "email",
                                    hintStyle: TextStyle(
                                        color: HexColor("#7A5600"),
                                        fontFamily: 'AbhayaLibre_regular',
                                        fontWeight: FontWeight.w300),
                                    filled: true,
                                    fillColor: HexColor("#F2DFB2"),
                                    enabledBorder: const OutlineInputBorder(),
                                    focusedBorder: const OutlineInputBorder()),
                              ),
                              const SizedBox(
                                height: 22,
                              ),
                              TextField(

                                obscureText: pass,
                                controller: password,
                                decoration: InputDecoration(
                                    isDense: true,

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
                              ),
                              const SizedBox(
                                height: 18,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  const SizedBox(
                                    width: 45,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      backendServiecs.forGott(
                                          email.text, password.text, context);
                                    },
                                    child: const Text(
                                      "Forgot password?",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'AbhayaLibre',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 18,
                              ),
                              InkWell(
                                onTap: () {
                                  backendServiecs.login(
                                      email.text, password.text, context);
                                },
                                child: Container(
                                  height: 48,
                                  width: 261,
                                  decoration: BoxDecoration(
                                      color: HexColor("#7A5600"),
                                      borderRadius: BorderRadius.circular(6)),
                                  alignment: Alignment.center,
                                  child: const Text(
                                    "Login",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'AbhayaLibre_regular',
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
                                      "Dont have an account?",
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
                                                  builder: (context) =>
                                                      const UserSignUpPage()));
                                        },
                                        child: Text("Signup",
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
