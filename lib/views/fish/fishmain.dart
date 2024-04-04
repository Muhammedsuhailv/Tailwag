import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shimmer/shimmer.dart';

import 'fishacssories.dart';
import 'fishfood.dart';
import 'fishhhealthandhygiene.dart';
import 'fishtreats.dart';



class FishMain extends StatefulWidget {
  const FishMain({Key? key}) : super(key: key);

  @override
  State<FishMain> createState() => _FishMainState();
}

class _FishMainState extends State<FishMain> {
  final CollectionReference admins = FirebaseFirestore.instance
      .collection('admins')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('Shops');
  var search = TextEditingController();
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
              child: CupertinoSearchTextField(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                backgroundColor: Colors.white,
                placeholder: 'Search shop, sitters or etc',
                placeholderStyle: TextStyle(fontSize: 15, color: Colors.grey),
              ),
            ),

            SizedBox(
              height: 444,
              child: GridView(
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.all(10),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,),
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FishFood()));
                      },
                      child: Padding(
                          padding: EdgeInsets.only(
                              left: 11, right: 11, top: 26, bottom: 26),
                          child: Container(
                            height: 90,
                            width: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: HexColor("88A18E"),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage("img/mainfooo.jpg"),
                                )),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(width:MediaQuery.of(context).size.width,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Colors.black26,
                                        borderRadius:
                                            BorderRadius.circular(5)),
                                    height: 40,
                                    child: const Text(
                                      "Food  ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FishTreats()
                            ));
                      },
                      child: Padding(
                          padding: EdgeInsets.only(
                              left: 11, right: 11, top: 26, bottom: 26),
                          child: Container(
                            height: 90,
                            width: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: HexColor("88A18E"),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage("img/maintreats.jpg"),
                                )),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(width:MediaQuery.of(context).size.width,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Colors.black26,
                                        borderRadius:
                                        BorderRadius.circular(5)),
                                    height: 40,
                                    child: const Text(
                                      "Treats  ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FishHealth(),
                            ));
                      },
                      child: Padding(
                          padding: EdgeInsets.only(
                              left: 11, right: 11, top: 26, bottom: 26),
                          child: Container(
                            height: 90,
                            width: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: HexColor("88A18E"),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      "img/xyzallfloatpngtree-white-foaming-hand-soap-bottle-on-green-background-with-a-plant-image_2614695.jpg"),
                                )),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(width:MediaQuery.of(context).size.width,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Colors.black26,
                                        borderRadius:
                                        BorderRadius.circular(5)),
                                    height: 40,
                                    child: const Text(
                                      "Health & Hygiene  ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FishAccessories(),
                            ));
                      },
                      child: Padding(
                          padding: EdgeInsets.only(
                              left: 11, right: 11, top: 26, bottom: 26),
                          child: Container(
                            height: 90,
                            width: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: HexColor("88A18E"),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage("img/main accssories.jpg"),
                                )),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(width:MediaQuery.of(context).size.width,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Colors.black26,
                                        borderRadius:
                                        BorderRadius.circular(5)),
                                    height: 40,
                                    child: const Text(
                                      " Accessories ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )),
                    ),
                  ]),
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
              height: 240,
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Stack(
                      children: [
                        Card(
                            elevation: 5,
                            child: Container(
                                height: 290,
                                width: 165,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: HexColor("F2DFB2"),
                                ))),
                        Padding(
                          padding: const EdgeInsets.only(top: 130.0, left: 6),
                          child: Container(
                            width: 165,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "HorizoneRoyal Breeding Feed For GuppyFood",
                                  style: TextStyle(
                                      color: HexColor("604401"),
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                    "Dehydrated, slow-cooked gluten-free cat treats"),
                                Text(
                                  "₹199.00",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                            top: 2,
                            child: Card(
                                elevation: 5,
                                child: Container(
                                    height: 120,
                                    width: 165,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.grey[800],
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                                "img/guppyfoooo3-removebg-preview.png")))))),
                        // Card(elevation: 5,child: Container(height: 80,width: 150,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.grey[800]),child: Image.asset("img/bird_fd4_drools-removebg-preview.png"),)),
                      ],
                    ),
                    Stack(
                      children: [
                        Card(
                            elevation: 5,
                            child: Container(
                                height: 290,
                                width: 165,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: HexColor("F2DFB2"),
                                ))),
                        Padding(
                          padding: const EdgeInsets.only(top: 130.0, left: 6),
                          child: Container(
                            width: 165,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Applaws Tuna in Jelly For Kittens WetFood",
                                  style: TextStyle(
                                      color: HexColor("604401"),
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                    "Natural, human-grade, international cat food"),
                                Text(
                                  "₹155.00",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                            top: 2,
                            child: Card(
                                elevation: 5,
                                child: Container(
                                  height: 120,
                                  width: 165,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.grey[800],
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                              "img/guppyflywood-removebg-preview.png"))),
                                ))),
                        // Card(elevation: 5,child: Container(height: 80,width: 150,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.grey[800]),child: Image.asset("img/bird_fd4_drools-removebg-preview.png"),)),
                      ],
                    ),
                    Stack(
                      children: [
                        Card(
                            elevation: 5,
                            child: Container(
                                height: 290,
                                width: 165,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: HexColor("F2DFB2"),
                                ))),
                        Padding(
                          padding: const EdgeInsets.only(top: 130.0, left: 6),
                          child: Container(
                            width: 165,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Foodie Puppies WA Nutrina Guppy Feed",
                                  style: TextStyle(
                                      color: HexColor("604401"),
                                      fontWeight: FontWeight.bold),
                                ),
                                Text("Sinking Granules|Zero PreservativesZero"),
                                Text(
                                  "₹199.00",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                            top: 2,
                            child: Card(
                                elevation: 5,
                                child: Container(
                                    height: 120,
                                    width: 165,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: HexColor("BB9D56"),
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                                "img/guppyfood1.jpg")))))),
                        // Card(elevation: 5,child: Container(height: 80,width: 150,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.grey[800]),child: Image.asset("img/bird_fd4_drools-removebg-preview.png"),)),
                      ],
                    ),
                    Stack(
                      children: [
                        Card(
                            elevation: 5,
                            child: Container(
                                height: 290,
                                width: 165,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: HexColor("F2DFB2"),
                                ))),
                        Padding(
                          padding: const EdgeInsets.only(top: 130.0, left: 6),
                          child: Container(
                            width: 165,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  " Gene Eleven Slow Sinking Micro Pellets",
                                  style: TextStyle(
                                      color: HexColor("604401"),
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                    "Dehydrated, slow-cooked gluten-free cat treats"),
                                Text(
                                  "₹1799.00",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: 2,
                          child: Card(
                              elevation: 5,
                              child: Container(
                                  height: 120,
                                  width: 165,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: HexColor("BB9D56"),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image:
                                            AssetImage("img/micropellets.jpg")),
                                  ))),
                          // Card(elevation: 5,child: Container(height: 80,width: 150,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.grey[800]),child: Image.asset("img/bird_fd4_drools-removebg-preview.png"),)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),




            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: SizedBox(
                height: 859,
                child: StreamBuilder<Object>(
                    stream: admins.where('PetType',isEqualTo: 'Fish').snapshots(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: snapshot.data.docs.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Card(
                                    child: Container(
                                      height: 100,
                                      width: 120,
                                      decoration: BoxDecoration(
                                        color: Colors.black12,
                                        borderRadius:
                                        BorderRadius.circular(10),
                                      ),
                                      child: snapshot.data.docs[index]
                                      ['shopImage'] !=
                                          null
                                          ? ClipRRect(
                                        borderRadius:
                                        BorderRadius.circular(10),
                                        child: Image.network(
                                          snapshot.data!.docs[index]
                                          ['shopImage'],
                                          fit: BoxFit.cover,
                                        ),
                                      )
                                          : Shimmer.fromColors(
                                        baseColor: Colors.grey[300]!,
                                        highlightColor:
                                        Colors.grey[100]!,
                                        child: Container(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                    const EdgeInsets.only(left: 18.0),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: [
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          snapshot.data.docs[index]
                                          ['shopName'],
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: HexColor("7A5600")),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          snapshot.data.docs[index]
                                          ['shopLocation'],
                                          style: const TextStyle(
                                              color: Colors.grey),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Row(
                                          children: [
                                            Icon(
                                              Icons.star_rate_rounded,
                                              color: Colors.orange,
                                            ),
                                            Text(
                                              "3.0",
                                              style: TextStyle(
                                                  color: Colors.grey),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      }
                      return Container();
                    }),
              ),
            )
          ],
        )),
      ),
    );
  }
}
