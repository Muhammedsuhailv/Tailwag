import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:url_launcher/url_launcher.dart';

class SitterDetail extends StatefulWidget {
  SitterDetail(
      {super.key,
      required this.img,
      required this.nam,
      required this.rat,
      required this.pla,
       this.details, this.title,this.phone
      });
  var img, rat, nam, pla,details,title,phone;

  @override
  State<SitterDetail> createState() => _SitterDetailState();
}

class _SitterDetailState extends State<SitterDetail> {
  Future<void> _handleRefresh() async {
    // Perform your refresh operation here, such as fetching new data
    // Simulate a delay for demonstration purposes
    await Future.delayed(const Duration(seconds: 2));
    // Update your data or perform any other action
    // Call setState() to notify Flutter that the data has changed
    setState(() {
      // Update your data here
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("F2DFB2"),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  ClipPath(
                    clipper: MyClipper(),
                    child: Image.asset("img/Rectangle 123 (1).png",
                        fit: BoxFit.cover),
                  ),
                  Positioned(
                    left: 310,
                    top: 10,
                    child: IconButton(
                      style: ButtonStyle(
                        backgroundColor:
                            const MaterialStatePropertyAll(Colors.black26),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                      ),
                      onPressed: () {
                        const CircularProgressIndicator();
                      },
                      icon: const Icon(Icons.more_horiz, color: Colors.white70),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    child: IconButton(
                      style: ButtonStyle(
                        backgroundColor:
                            const MaterialStatePropertyAll(Colors.black26),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios_new_rounded,
                          color: Colors.white),
                    ),
                  ),
                  Positioned(
                    top: 207,
                    left: 125,
                    child:
                        CircleAvatar(radius: 55, backgroundImage: widget.img),
                  ),
                ],
              ),
              const SizedBox(
                height: 59,
              ),
              Text(widget.nam,
                  style: TextStyle(
                      color: HexColor("604401"),
                      fontFamily: 'SofiaPro',
                      fontWeight: FontWeight.bold)),
              Text(widget.pla,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'SofiaPro',
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.star_rate_rounded, color: Colors.orange),
                  Text(widget.rat,
                      style: const TextStyle(
                          color: Colors.grey,
                          fontFamily: 'SofiaPro',
                          fontWeight: FontWeight.w600)),
                  const Text("|115 Ratings",
                      style: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'SofiaPro',
                          fontWeight: FontWeight.w600)),
                ],
              ),
              Text(widget.title,
                  style: TextStyle(
                    color: HexColor("604401"),
                    fontFamily: 'SofiaPro',
                  )),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Card(
                    child: InkWell(
                      onTap:() {
                        Uri launchUri = Uri(scheme: 'tel',path: widget.phone);
                        launchUrl(launchUri);
                    },
                      child: Container(
                        height: 34,
                        width: 100,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.wifi_calling_3_rounded,
                                    color: HexColor("604401"))),
                            Text("Call",
                                style: TextStyle(
                                  color: HexColor("604401"),
                                  fontFamily: 'SofiaPro',
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Card(
                    child: InkWell(onTap: () {
                      Uri launchUri = Uri(scheme: 'sms',path: widget.phone);
                      launchUrl(launchUri);
                    },
                      child: Container(
                        height: 34,
                        width: 115,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.message,
                                    color: HexColor("604401"))),
                            Text("Message",
                                style: TextStyle(
                                  color: HexColor("604401"),
                                  fontFamily: 'SofiaPro',
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Details",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: HexColor("6E520F"),
                        fontFamily: 'SofiaPro',
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0,right: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(widget.details,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: HexColor("604401"),
                      ),
                    ),
                    // Align(
                    //     alignment: Alignment.centerLeft,
                    //     child: Text(
                    //       " Read more",
                    //       style: TextStyle(color: HexColor("D87600")),
                    //     ))
                  ],
                ),
              ),
              SizedBox(
                height: 14,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      const CircleAvatar(
                          radius: 33,
                          backgroundColor: Colors.blueGrey,
                          backgroundImage: AssetImage("img/dog walking.jpg")),
                      const SizedBox(
                        height: 5,
                      ),
                      Text("Pet Walking",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: HexColor("7A5600"))),
                    ],
                  ),
                  Column(
                    children: [
                      const CircleAvatar(
                          radius: 33,
                          backgroundColor: Colors.pinkAccent,
                          backgroundImage: AssetImage("img/day care.jpg")),
                      const SizedBox(
                        height: 5,
                      ),
                      Text("Day care",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: HexColor("7A5600"))),
                    ],
                  ),
                  Column(
                    children: [
                      const CircleAvatar(
                          radius: 33,
                          backgroundColor: Colors.yellow,
                          backgroundImage: AssetImage("img/house sitting.jpg")),
                      const SizedBox(
                        height: 5,
                      ),
                      Text("House sitting",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: HexColor("7A5600"))),
                    ],
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                          radius: 33,
                          backgroundColor: HexColor("C04D4D"),
                          backgroundImage:
                              const AssetImage("img/Feeding-dog-scaled.jpg")),
                      const SizedBox(
                        height: 5,
                      ),
                      Text("Feeding",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: HexColor("7A5600"))),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 23,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, size.height * 0.8);
    path.quadraticBezierTo(
        size.width * 0.5, size.height, size.width, size.height * 0.8);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

