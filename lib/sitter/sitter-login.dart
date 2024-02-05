import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class SitterLogin extends StatelessWidget {
  const SitterLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    var email = TextEditingController();
    var Password = TextEditingController();
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: HexColor("F2DFB2"),
      body: Column(
        children: [
          SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new_sharp,
                ),
              ),
              Image.asset(
                'img/logo_brown.png',
                scale: 2,
              ),
              const SizedBox(
                height: 20,
                width: 50,
              ),
            ],
          ),


          Expanded(
            child: Container(
              decoration:  BoxDecoration(color: HexColor("F2DFB2")),
            ),
          ),
          Container(

            width: width,
            decoration:  BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 5,
                  offset: Offset(2, 0),
                )
              ],

                  color:HexColor("F2DFB2"),

              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
                child:
                     Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Form(
                        key:_formKey ,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                             Text(
                              'Welcome Back',
                              style: TextStyle(
                                  fontFamily: 'Katibeh',
                                  fontSize: 50,
                                  color: HexColor("7A5600")),
                            ),
                             Text(
                              'Happy to see you again!!',
                              style: TextStyle(
                                  fontFamily: 'Katibeh',
                                  fontSize: 25,
                                  color: HexColor("7A5600")),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: email,
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return '*this field is required';
                                } else {
                                  return null;
                                }
                              },
                              decoration:  InputDecoration(
                                filled: true,
                                fillColor: HexColor("F2DFB2"),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  borderSide: BorderSide(color: HexColor("7A5600")),
                                ),
                                hintStyle: TextStyle(
                                  color: HexColor("7A5600"),
                                  fontFamily: 'AbhayaLibre_regular',
                                  fontWeight: FontWeight.w600,
                                ),
                                hintText: 'Email',
                                border: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  borderSide: BorderSide(color: HexColor("7A5600")),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller:Password,
                              obscureText: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return '*this field is required';
                                } else {
                                  return null;
                                }
                              },
                              decoration:  InputDecoration(
                                filled: true,
                                fillColor: HexColor("F2DFB2"),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  borderSide: BorderSide(color: HexColor("7A5600")),
                                ),
                                hintStyle: TextStyle(
                                  color: HexColor("7A5600"),
                                  fontFamily: 'AbhayaLibre_regular',
                                  fontWeight: FontWeight.w600,
                                ),
                                hintText: 'Password',
                                border: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  borderSide: BorderSide(color: HexColor("7A5600")),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  style: const ButtonStyle(
                                      overlayColor:
                                      MaterialStatePropertyAll(Colors.grey)),
                                  onPressed: () {},
                                  child: const Text(
                                    'Forgot password?',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'AbhayaLibre',
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              width: width * 0.7,
                              height: 45,
                              child: ElevatedButton(
                                style:  ButtonStyle(
                                  overlayColor:
                                  const MaterialStatePropertyAll(Color(0xFFBFA05A)),
                                  backgroundColor:
                                  MaterialStatePropertyAll(HexColor("7A5600")),
                                ),
                                onPressed: () {

                                },
                                child: const Text(
                                  'Log in',
                                  style: TextStyle(
                                      fontFamily: 'AbhayaLibre_regular',
                                      color: Colors.white,
                                      fontSize: 20),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Don't have an account?",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'AbhayaLibre_regular',
                                      fontSize: 15),
                                ),


                                    InkWell(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(
                                      'Create Account',
                                      style: TextStyle(
                                          color: HexColor("7A5600"),
                                          fontFamily: 'AbhayaLibre',
                                          fontSize: 17),
                                    ),
                                  ),

                              ],
                            )
                          ],
                        ),
                      ),

                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
