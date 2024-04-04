import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../floatingactionbutton/foodlist.dart';


class FishFood extends StatefulWidget {
  const FishFood({Key? key}) : super(key: key);

  @override
  State<FishFood> createState() => _FishFoodState();
}

class _FishFoodState extends State<FishFood> {
  final ScrollController _controller = ScrollController();
  Timer? _timer;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      if (_currentIndex < fishfoodi.length - 1) {
        _currentIndex++;
      } else {
        _currentIndex = 0;
      }
      _controller.animateTo(_currentIndex * 150.0,
          duration: Duration(seconds: 1), curve: Curves.easeInOut);
    });
  }

  var _search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("F2DFB2"),
      appBar: AppBar(
        backgroundColor: HexColor("F2DFB2"),
        leading: Padding(
          padding: const EdgeInsets.only(left: 23.0),
          child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: HexColor("7A5600"),
              )),
        ),
        title: Image.asset(
          "img/Tailwag.png",
          width: 91,
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: CircleAvatar(
                radius: 26, backgroundImage: AssetImage("img/fishprofile.jpg")),
          ),
          SizedBox(
            width: 23,
          )
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 25,
              ),
              Container(
                height: 45,
                width: 310,
                child: TextField(
                  controller: _search,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search_rounded,
                        color: Colors.grey,
                      ),
                      hintText: "Search shop,etc",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 13),
                      suffixIcon: Icon(
                        Icons.filter_list,
                        color: Colors.grey,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none)),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 85,
                child: Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: ListView.builder(
                    controller: _controller,
                    scrollDirection: Axis.horizontal,
                    itemCount: fishfoodi.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: HexColor("D8B053"),
                        child: Container(
                          height: 110,
                          width: 117,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: HexColor("D8B053"),
                          ),
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    color: HexColor("BB9D56"),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(35),
                                      topRight: Radius.circular(15),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    color: HexColor("BB9D56"),
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(35),
                                      bottomLeft: Radius.circular(15),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 25,
                                left: 5,
                                child: Text(
                                  fishfoodi[index]['txt'],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 48.0),
                                child: fishfoodi[index]['img'],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: CircleAvatar(
                              radius: 32,
                              backgroundColor: HexColor("86AF9F"),
                              child: CircleAvatar(
                                  radius: 30,
                                  backgroundColor: HexColor("86AF9F"),
                                  backgroundImage:
                                      AssetImage("img/dog-dry.jpg"))),
                        ),
                        Text(
                          "Dry Food",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Column(children: [
                      CircleAvatar(
                        radius: 32,
                        backgroundColor: HexColor("86AF9F"),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: HexColor("86AF9F"),
                          backgroundImage: AssetImage("img/wetstill-life-pet-food-composition_23-2148982348.jpg"),
                        ),
                      ),
                      Text(
                        "Wet Food",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ]),
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 32,
                          backgroundColor: HexColor("86AF9F"),
                          child: CircleAvatar(
                            radius: 30,
                            backgroundColor: HexColor("86AF9F"),
                            backgroundImage: AssetImage("img/skinskinskincute-plants-near-cosmetics-bottles_23-2147787942.jpg"),
                          ),
                        ),
                        Text(
                          "Skin Care",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 32,
                          backgroundColor: HexColor("86AF9F"),
                          child: CircleAvatar(
                            radius: 30,
                            backgroundColor: HexColor("86AF9F"),
                            backgroundImage:
                                AssetImage("img/treats-dog-hilight.jpg"),
                          ),
                        ),
                        Text(
                          "Treats",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Shop by brands",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'SofiaPro',
                          fontSize: 16),
                    ),
                    Text(
                      "See all",
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Container(
                            height: 100,
                            width: 110,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: HexColor("070707"),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        "img/royal-fish-removebg-preview.png")))),
                        Text(
                          "Royal ",
                          style: TextStyle(
                              color: HexColor("7A5600"),
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                            height: 100,
                            width: 110,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: HexColor("A7B9E9"),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                        AssetImage("img/micropellets.jpg")))),
                        Text(
                          "Micro Pellets",
                          style: TextStyle(
                              color: HexColor("7A5600"),
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                            height: 100,
                            width: 110,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: HexColor("A7B9E9"),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage("img/guppyfood1.jpg")))),
                        Text(
                          "Guppy Feed",
                          style: TextStyle(
                              color: HexColor("7A5600"),
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Top picks",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'SofiaPro',
                          fontSize: 16),
                    ),
                    Text(
                      "See all",
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: SizedBox(
                    height: 255,
                    child: ListView.builder(
                      // controller: _controller,
                      scrollDirection: Axis.horizontal,
                      itemCount: Top.length,
                      itemBuilder: (context, index) {
                        return
                            // SizedBox(width: 15,),
                            Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 4, right: 4),
                              child: Stack(
                                children: [
                                  Container(
                                      height: 240,
                                      width: 155,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: HexColor("F2DFB2"),
                                      )),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 130.0, left: 6),
                                    child: Container(
                                      width: 150,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            Top[index]['txt'],
                                            style: TextStyle(
                                                color: HexColor("604401"),
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(Top[index]['sub']),
                                          Row(
                                            children: [
                                              Text("MRP :",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w900,
                                                  )),
                                              // Text(Top[index]['pri'],style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900,decoration: TextDecoration.lineThrough),),
                                              Text(
                                                Top[index]['pri'],
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w900),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                      child: Card(
                                          elevation: 5,
                                          child: Container(
                                            height: 118,
                                            width: 145,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: HexColor("D8B053")),
                                            child: Stack(
                                              children: [
                                                Align(
                                                    alignment:
                                                        Alignment.topRight,
                                                    child: Container(
                                                      height: 60,
                                                      width: 60,
                                                      decoration: BoxDecoration(
                                                          color: HexColor(
                                                              "BB9D56"),
                                                          borderRadius:
                                                              BorderRadius.only(
                                                                  bottomLeft:
                                                                      Radius.circular(
                                                                          60),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          15))),
                                                    )),
                                                Align(
                                                    alignment:
                                                        Alignment.bottomLeft,
                                                    child: Container(
                                                      height: 60,
                                                      width: 60,
                                                      decoration: BoxDecoration(
                                                          color: HexColor(
                                                              "BB9D56"),
                                                          borderRadius:
                                                              BorderRadius.only(
                                                                  topRight: Radius
                                                                      .circular(
                                                                          60),
                                                                  bottomLeft:
                                                                      Radius.circular(
                                                                          15))),
                                                    )),
                                              ],
                                            ),
                                          ))),
                                  // Card(elevation: 5,child: Container(height: 80,width: 150,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.grey[800]),child: Image.asset("img/bird_fd4_drools-removebg-preview.png"),)),
// Align(alignment: Alignment.center,child:Top[index]['img'] ,)

                                  Padding(
                                    padding: const EdgeInsets.only(left: 15.0),
                                    child: Container(
                                      height: 120,
                                      width: 120,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              fit: BoxFit.contain,
                                              image: Top[index]['img'])),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    )
                    //   ListView(scrollDirection: Axis.horizontal,
                    //
                    //     children: [
                    //       SizedBox(width: 15,),
                    //       Column(crossAxisAlignment: CrossAxisAlignment.start,
                    //         children: [
                    //           Padding(
                    //           padding: const EdgeInsets.only(left: 4,right: 4),
                    //   child:
                    //   Stack(
                    //     children: [
                    //       Container(height: 240,width: 155,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: HexColor("F2DFB2"),)),
                    //       Padding(
                    //         padding: const EdgeInsets.only(top: 130.0,left: 6),
                    //         child: Container(width: 155,
                    //           child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    //             children: [
                    //               Text('txthahahahhahaha',style: TextStyle(color: HexColor("604401"),fontWeight: FontWeight.bold),),
                    //               // Text(healthh[index]['sub']),
                    //               Row(
                    //                 children: [
                    //                   Text("MRP :",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900,)),
                    //                   Text('regbx',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900,decoration: TextDecoration.lineThrough),),
                    //                   Text('162722',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900),),
                    //
                    //                 ],
                    //               ),
                    //             ],
                    //           ),
                    //         ),
                    //       ),
                    //       Positioned(child: Card(elevation: 5,child: Container(height: 118,width: 145,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color:  HexColor("D8B053")),child: Stack(children: [
                    //         Align(alignment: Alignment.topRight,child: Container(height: 60,width: 60,decoration: BoxDecoration(color: HexColor("BB9D56"),borderRadius: BorderRadius.only(bottomLeft: Radius.circular(60),topRight: Radius.circular(15))),)),
                    //         Align(alignment: Alignment.bottomLeft,child: Container(height: 60,width: 60,decoration: BoxDecoration(color: HexColor("BB9D56"),borderRadius: BorderRadius.only(topRight: Radius.circular(60),bottomLeft: Radius.circular(15))),)),
                    //
                    //       ],),))),
                    //       // Card(elevation: 5,child: Container(height: 80,width: 150,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.grey[800]),child: Image.asset("img/bird_fd4_drools-removebg-preview.png"),)),
                    //
                    //       Padding(
                    //         padding: const EdgeInsets.only(left: 25.0),
                    //         child:
                    //        Image.asset("img/bird_fd4_drools-removebg-preview.png",width: 100,)
                    //       ),
                    //     ],
                    //   ),
                    //
                    //
                    // ),
                    //         ],
                    //       ),
                    //
                    //       // SizedBox(width: 5,),
                    //       // Container(height: 100,width: 110,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.grey[800],image: DecorationImage(fit: BoxFit.cover,image: AssetImage("img/fusilli-removebg-preview.png")))),
                    //       // SizedBox(width: 5,),
                    //       // Container(height: 100,width: 110,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color:Colors.grey[800],image: DecorationImage(fit: BoxFit.cover,image: AssetImage("img/whole__life-removebg-preview.png")))),
                    //       // SizedBox(width: 5,),
                    //       // Container(height: 100,width: 110,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: HexColor("A7B9E9"),image: DecorationImage(fit: BoxFit.cover,image: AssetImage("img/Royal-Caninimgimgg.jpg")))),
                    //       //
                    //       // SizedBox(width: 5,),
                    //       // // Container(height: 100,width: 110,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.grey[800],image: DecorationImage(fit: BoxFit.cover,image: AssetImage("img/fusilli-removebg-preview.png")))),
                    //       //
                    //       //
                    //
                    //
                    //
                    //
                    //
                    //
                    //     ],),
                    // ),
                    //

                    ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Card(
                        child: Container(
                            height: 100,
                            width: 120,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage("img/2022-01-24.jpg")),
                                color: Colors.black12,
                                borderRadius: BorderRadius.circular(10)))),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 19),
                          child: Text(
                            "Puppyfort",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: HexColor("7A5600")),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0),
                          child: Text(
                            'Kochi,kerala',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 14.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.star_rate_rounded,
                                color: Colors.orange,
                              ),
                              Text(
                                "3.0",
                                style: TextStyle(color: Colors.grey),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Card(
                        child: Container(
                            height: 100,
                            width: 120,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage("img/2022-01-24.jpg")),
                                color: Colors.black12,
                                borderRadius: BorderRadius.circular(10)))),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 19),
                          child: Text(
                            "Puppyfort",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: HexColor("7A5600")),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0),
                          child: Text(
                            'Kochi,kerala',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 14.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.star_rate_rounded,
                                color: Colors.orange,
                              ),
                              Text(
                                "3.0",
                                style: TextStyle(color: Colors.grey),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                        child: Container(
                            height: 100,
                            width: 120,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                        AssetImage("img/11627364873059.webp")),
                                color: Colors.black12,
                                borderRadius: BorderRadius.circular(10)))),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 19),
                        child: Text(
                          "GoldenBow",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: HexColor("7A5600")),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: Text(
                          'Kochi,kerala',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 14.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.star_rate_rounded,
                              color: Colors.orange,
                            ),
                            Text(
                              "4.0",
                              style: TextStyle(color: Colors.grey),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
