import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mainproject/views/allshops.dart';
import 'package:mainproject/views/dog/dogfoodpersonal.dart';

import 'package:mainproject/views/model.dart';
import 'package:shimmer/shimmer.dart';

import '../../widgetmodels/drawer.dart';
import '../bird/maine bird.dart';
import '../cat/maine cat.dart';
import '../dog/dogfood.dart';
import '../fish/fishmain.dart';
import 'faccssories.dart';
import 'fhealthhygiene.dart';
import 'food.dart';
import 'ftreats.dart';



class Trade extends StatefulWidget {
  const Trade({Key? key}) : super(key: key);

  @override
  State<Trade> createState() => _TradeState();
}

class _TradeState extends State<Trade> {
  var search = TextEditingController();
  var pass = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        endDrawer: Drawer(
          backgroundColor: HexColor("F2DFB2"),
          child: SingleChildScrollView(
            child: Column(
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close_rounded),
                ),
                const SizedBox(height: 25),
                buildDrawerItem(Icons.home_outlined, "Home"),
                buildDrawerItem(Icons.person_outline_outlined, "Profile"),
                buildDrawerItem(Icons.article_outlined, "Articles"),
                buildDrawerItem(Icons.shop_two_outlined, "Shop"),
                buildDrawerItem(Icons.favorite_outline_sharp, "Favourites"),
                buildDrawerItem(Icons.local_hospital_outlined, "Hospital"),
                buildDrawerItem(Icons.switch_access_shortcut_add_rounded, "Sitters"),
                const SizedBox(height: 31),
                buildDrawerItem(Icons.notifications_on_outlined, "Notification"),
                buildDrawerItem(Icons.settings, "Settings"),
                buildDrawerItem(Icons.logout, "Log out"),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          leading:StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('users').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData &&
                  snapshot.data != null &&
                  snapshot.data!.docs.isNotEmpty) {
                return snapshot.connectionState == ConnectionState.waiting
                    ? Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                    ),
                  ),
                )
                    : Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage:
                    NetworkImage(snapshot.data!.docs.first['image']),
                  ),
                );
              } else {
                // Return an empty SizedBox if no data is available
                return SizedBox();
              }
            },
          ),
          backgroundColor: HexColor("F2DFB2"),
          title: StreamBuilder<QuerySnapshot>(
            stream:
            FirebaseFirestore.instance.collection('users').snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData && snapshot.data != null && snapshot.data!.docs.isNotEmpty) {
                var petname = snapshot.data!.docs.first['petname'];

                return Row(
                  children: [
                    Text(
                      "Hey,",
                      style: TextStyle(
                        color: HexColor('#7A5600'),
                        fontFamily: 'AbhayaLibre_regular',
                      ),
                    ),
                    Text(
                      petname,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: HexColor('#7A5600'),
                        fontFamily: 'AbhayaLibre',
                        letterSpacing: 1,
                      ),
                    ),
                  ],
                );
              } else {
                // Handle the case where no data is available or loading state
                return Text(
                  'Loading...',
                  style: TextStyle(
                    color: HexColor('#7A5600'),
                  ),
                );
              }
            },
          ),
          actions: const [
            Icon(
              Icons.notifications_none,
              size: 27,
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Icon(
                Icons.date_range_rounded,
                size: 25,
              ),
            ),
            EndDrawerButton(),
          ],
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: HexColor("F2DFB2"),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 25,
                ),
                const SizedBox(
                  height: 45,
                  width: 310,
                  child: CupertinoSearchTextField(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    backgroundColor: Colors.white,
                    placeholder: 'Search menu, restaurant or etc',
                    placeholderStyle:
                    TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                    height: 135,
                    width: 310,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: HexColor("BFA05A")),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            const SizedBox(
                              height: 4,
                            ),
                            const Text(
                              'Claim your\ndiscount 30%\ndaily now!',
                              style: TextStyle(
                                  fontFamily: 'AbhayaLibre_regular',
                                  color: Colors.white,
                                  fontSize: 20),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: Container(
                                  height: 36,
                                  width: 90,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: HexColor("7A5600")),
                                  alignment: Alignment.center,
                                  child: const Text(
                                    "Shop now",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'AbhayaLibre',
                                        color: Colors.white),
                                  )),
                            ),
                          ],
                        ),
                        Column(children: [
                          const SizedBox(
                            height: 7,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Image.asset("img/AAP_Product-Mockups 1.png"),
                          )
                        ]),
                      ],
                    )),
                const SizedBox(
                  height: 25,
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 219.0),
                  child: Text(
                    "Categories",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18,                        fontFamily: 'SofiaPro',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const DogMain(),
                                  ));
                            },
                            child: const CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.blueGrey,
                                backgroundImage: AssetImage("img/zdog.jpg"))),
                        const Text(
                          "Dog",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Column(children: [
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const catmain()));
                          },
                          child: const CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.pinkAccent,
                            backgroundImage:
                                AssetImage("img/catcatestcatcatesmain.jpg"),
                          )),
                      const Text(
                        "Cat",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ]),
                    Column(
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const birdmain(),
                                  ));
                            },
                            child: const CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.yellow,
                              backgroundImage:
                                  AssetImage("img/parrotrosebackgrond.jpg"),
                            )),
                        const Text(
                          "Bird",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const FishMain(),
                                  ));
                            },
                            child: CircleAvatar(
                              radius: 30,
                              backgroundColor: HexColor("C04D4D"),
                              backgroundImage:
                                  const AssetImage("img/fishfishestmain.jpg"),
                            )),
                        const Text(
                          "Fish",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 350,
                  child: GridView(
                      controller: ScrollController(keepScrollOffset: false),
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.all(10),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const food(),
                                ));
                          },
                          child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 11, right: 11, top: 26, bottom: 26),
                              child: Container(
                                height: 90,
                                width: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: HexColor("88A18E"),
                                    image: const DecorationImage(
                                      fit: BoxFit.cover,
                                      image:
                                          AssetImage("img/floatingallfood.jpg"),
                                    )),
                                child: Stack(
                                  children: [
                                    Positioned(
                                        top: 78,
                                        child: Container(
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              color: Colors.black26,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          height: 40,
                                          width: 147,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: Text(
                                              "Food",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ))
                                  ],
                                ),
                              )),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 11, right: 11, top: 26, bottom: 26),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const Ftreats(),
                                    ));
                              },
                              child: Container(
                                height: 90,
                                width: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: HexColor("88A18E"),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          "img/treatsdomestic-pet-food-composition_23-2148982342.jpg"),
                                    )),
                                child: Stack(
                                  children: [
                                    Positioned(
                                        top: 78,
                                        child: Container(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: Text(
                                              "Treats",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              color: Colors.black26,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          height: 40,
                                          width: 147,
                                        ))
                                  ],
                                ),
                              ),
                            )),
                        Padding(
                            padding: EdgeInsets.only(
                                left: 11, right: 11, top: 26, bottom: 26),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => fhelthhygin(),
                                    ));
                              },
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
                                    Positioned(
                                        top: 78,
                                        child: Container(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: Text(
                                              "Health & Hygiene",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              color: Colors.black26,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          height: 40,
                                          width: 147,
                                        ))
                                  ],
                                ),
                              ),
                            )),
                        Padding(
                            padding: EdgeInsets.only(
                                left: 11, right: 11, top: 26, bottom: 26),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => facss(),
                                    ));
                              },
                              child: Container(
                                height: 90,
                                width: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: HexColor("88A18E"),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          "img/pet-accessories-still-life-concept-set_23-2148949592.jpg"),
                                    )),
                                child: Stack(
                                  children: [
                                    Positioned(
                                        top: 78,
                                        child: Container(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: Text(
                                              "Accessories",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              color: Colors.black26,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          height: 40,
                                          width: 147,
                                        ))
                                  ],
                                ),
                              ),
                            )),
                      ]),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: Text(
                        "Top shops",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18,   fontFamily: 'SofiaPro',),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(right: 18.0),
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => shops()));
                          },
                          child: Text(
                            "See all",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                          ),
                        )),
                  ],
                ),
                SizedBox(
                  height: 466,
                  width: 997,
                  child: GridView.builder(
                      itemCount: topshop.length,
                      controller: new ScrollController(keepScrollOffset: false),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.8,
                          crossAxisSpacing: 0.0,
                          mainAxisSpacing: 13),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 8, right: 5),
                          child: Column(
                            children: [
                              Container(
                                height: 126.7,
                                width: 245,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(14),
                                    topLeft: Radius.circular(14),
                                  ),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: topshop[index]['image']),
                                ),
                              ),
                              Container(
                                width: 258,
                                height: 89.6,
                                decoration: BoxDecoration(
                                    color: Colors.white24,
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(16),
                                        bottomLeft: Radius.circular(16))),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8.6),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 5,
                                        ),
                                        topshop[index]['title'],
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              topshop[index]['km'],
                                              style: TextStyle(
                                                  color: Colors.grey[600]),
                                            ),
                                            Icon(
                                              Icons.star_rate_rounded,
                                              color: Colors.orange,
                                            ),
                                            Text(
                                              topshop[index]['rew'],
                                              style: TextStyle(
                                                  color: Colors.grey[600]),
                                            )
                                          ],
                                        ),
                                      ]),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 169.0),
                  child: Text(
                    "Top Groom centers",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18,   fontFamily: 'SofiaPro',),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Card(
                                child: Container(
                              height: 100,
                              width: 120,
                              decoration: BoxDecoration(
                                  color: Colors.black12,
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage("img/Image.png"))),
                            )),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 0),
                                  child: Text(
                                    "Bowmeow",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: HexColor("7A5600")),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 30.0),
                                  child: Text(
                                    'Palakad,kerala',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 29.0),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.star_rate_rounded,
                                        color: Colors.orange,
                                      ),
                                      Text(
                                        "4.8",
                                        style: TextStyle(color: Colors.grey),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            )
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
                                            image: AssetImage(
                                                "img/72-The-Pet-Shoppe-Shopping-Pet-stores-Visakhapatnam-Andhra-Pradesh.jpg")),
                                        color: Colors.black12,
                                        borderRadius:
                                            BorderRadius.circular(10)))),
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 25),
                                child: Text(
                                  " ThepetShope",
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
                                      "3.9",
                                      style: TextStyle(color: Colors.grey),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
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
                                            image: AssetImage(
                                                "img/2022-01-24.jpg")),
                                        color: Colors.black12,
                                        borderRadius:
                                            BorderRadius.circular(10)))),
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
                                            image: AssetImage(
                                                "img/11627364873059.webp")),
                                        color: Colors.black12,
                                        borderRadius:
                                            BorderRadius.circular(10)))),
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
                )
              ],
            ),
          ),
        ));
  }
}
