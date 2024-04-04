import 'package:flutter/material.dart';
import 'dart:async';
import 'package:hexcolor/hexcolor.dart';

import '../controller/BackendServices.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController digit1Controller = TextEditingController();
  final TextEditingController digit2Controller = TextEditingController();
  final TextEditingController digit3Controller = TextEditingController();
  final TextEditingController digit4Controller = TextEditingController();

  late Timer _timer;
  int _secondsRemaining = 300; // Set the initial timer value to 5 minutes
  BackendServiecs backendServiecs = BackendServiecs();
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          // Stop the timer when it reaches zero
          _timer.cancel();
        }
      });
    });
  }

  String formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    String minutesStr = minutes < 10 ? '0$minutes' : '$minutes';
    String secondsStr =
        remainingSeconds < 10 ? '0$remainingSeconds' : '$remainingSeconds';
    return '$minutesStr:$secondsStr';
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("F2DFB2"),
      appBar: AppBar(
        backgroundColor: HexColor("F2DFB2"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon:
              const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black),
        ),
        title: Image.asset("img/Tailwag.png", width: 91),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 25),
            const Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Verification Code",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                  SizedBox(height: 10),
                  Text(
                    "We have sent the code verification to",
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.w500),
                  ),
                  Row(
                    children: [
                      Text(
                        "your number ",
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "+01 65841542265",
                        style: TextStyle(fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 35),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildDigitTextField(digit1Controller),
                buildDigitTextField(digit2Controller),
                buildDigitTextField(digit3Controller),
                buildDigitTextField(digit4Controller),
              ],
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.center,
              child: Text("TIME ADD ${formatTime(_secondsRemaining)}"),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                // backendServiecs.verifyOTP(digit1Controller.text);

                showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  backgroundColor: Colors.transparent,
                  builder: (context) => Container(
                    height: 415,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFFf2dfb2), // Top color
                          Colors.white, // Bottom color
                        ],
                      ),
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(25)),
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 6,
                          width: 75,
                          color: const Color(
                              0xFFdfe2eb), // Color for the top rectangle
                          margin: const EdgeInsets.only(
                              top: 8), // Adjust the top margin as needed
                        ),
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              height: 210,
                              width: 240,
                              margin: const EdgeInsets.only(top: 30),
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                                color: Colors.white,
                                border: Border(
                                  top: BorderSide(
                                      color: Color(0x61000000), width: 5.0),
                                  right: BorderSide(
                                      color: Color(0x61000000), width: 5.0),
                                  left: BorderSide(
                                      color: Color(0x61000000), width: 5.0),
                                ),
                              ), // Adjust the top margin as needed
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  const ClipOval(
                                    child: CircleAvatar(
                                      radius: 50,
                                      backgroundColor: Colors.black12,
                                      child: Icon(
                                        Icons.person,
                                        size: 55,
                                        color: Colors.black12,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    height: 20,
                                    width: 130,
                                    decoration: BoxDecoration(
                                        color: Colors.black12,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  )
                                ],
                              ),
                            ),
                            const Positioned(
                                top: 10,
                                left: 205,
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Colors.white,
                                  child: Icon(
                                    Icons.check_circle,
                                    color: Colors.black54,
                                    size: 30,
                                  ),
                                ))
                          ],
                        ),
                        SingleChildScrollView(
                          padding: const EdgeInsetsDirectional.only(
                            start: 20,
                            end: 20,
                            bottom: 30,
                          ),
                          child: Column(
                            // Your content goes here
                            children: [
                              const SizedBox(
                                height: 3,
                              ),
                              const Text(
                                "Register Successfully",
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Text(
                                "Congratulation! your account already created.",
                                style: TextStyle(
                                  color: HexColor("A7A9B7"),
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                "Please login to get amazing experience.",
                                style: TextStyle(
                                  color: HexColor("A7A9B7"),
                                ),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 50,
                                  width: 285,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: Colors.brown,
                                  ),
                                  child: const Text(
                                    "Go to Homepage",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 285,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.brown,
                  ),
                  child: const Text(
                    "Submit",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),
            const Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Didn’t receive the code? ",
                      style: TextStyle(color: Colors.grey)),
                  Text(
                    "Resend",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),

            // Custom Number Keyboard
            CustomNumberKeyboard(
              onTextInput: (value) {
                if (value == 'back') {
                  if (digit4Controller.text.isNotEmpty) {
                    digit4Controller.clear();
                  } else if (digit3Controller.text.isNotEmpty) {
                    digit3Controller.clear();
                  } else if (digit2Controller.text.isNotEmpty) {
                    digit2Controller.clear();
                  } else if (digit1Controller.text.isNotEmpty) {
                    digit1Controller.clear();
                  }
                } else {
                  print('Pressed: $value');
                  if (digit1Controller.text.isEmpty) {
                    digit1Controller.text = value;
                  } else if (digit2Controller.text.isEmpty) {
                    digit2Controller.text = value;
                  } else if (digit3Controller.text.isEmpty) {
                    digit3Controller.text = value;
                  } else if (digit4Controller.text.isEmpty) {
                    digit4Controller.text = value;
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDigitTextField(TextEditingController controller) {
    return SizedBox(
      height: 55,
      width: 55,
      child: TextField(
        readOnly: true,
        maxLength: 1,
        controller: controller,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          counterText: "",
          border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }
}

class CustomNumberKeyboard extends StatelessWidget {
  final Function(String) onTextInput;

  const CustomNumberKeyboard({Key? key, required this.onTextInput})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(1),
      child: Column(
        children: [
          buildRow(['1', '2', '3']),
          const SizedBox(height: 8), // Reduce the vertical spacing between rows
          buildRow(['4', '5', '6']),
          const SizedBox(height: 8), // Reduce the vertical spacing between rows
          buildRow(['7', '8', '9']),
          const SizedBox(height: 8), // Reduce the vertical spacing between rows
          buildBackZeroRow(),
        ],
      ),
    );
  }

  Widget buildRow(List<String> keys) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: keys
          .map(
            (key) => KeyboardKey(
              keyy: key,
              onPressed: () {
                onTextInput(key);
              },
            ),
          )
          .toList(),
    );
  }

  Widget buildBackZeroRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment
          .spaceEvenly, // Adjust spacing for the back and zero buttons
      children: [
        const SizedBox(
          width: 115,
        ),
        KeyboardKey(
          keyy: '0',
          onPressed: () {
            onTextInput('0');
          },
        ),
        const SizedBox(
          width: 25,
        ),
        KeyboardKey(
          keyy: 'back',
          onPressed: () {
            onTextInput('back');
          },
          backgroundColor: Colors.transparent,
          isBackButton: true,
        ),
      ],
    );
  }
}

class KeyboardKey extends StatelessWidget {
  final String keyy;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final bool isBackButton;

  const KeyboardKey(
      {Key? key,
      required this.keyy,
      required this.onPressed,
      this.backgroundColor,
      this.isBackButton = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 80,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: backgroundColor ?? Colors.white,
        ),
        child: Center(
          child: isBackButton
              ? const Icon(Icons.backspace_outlined, size: 24)
              : Text(
                  keyy,
                ),
        ),
      ),
    );
  }
}
