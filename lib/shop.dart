import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mainproject/allshops.dart';
import 'package:mainproject/bird/maine%20bird.dart';
import 'package:mainproject/care/recordlist.dart';
import 'package:mainproject/cat/maine%20cat.dart';
import 'package:mainproject/dog/dogfood.dart';
import 'package:mainproject/fish/fishmain.dart';
import 'package:mainproject/floatingactionbutton/food.dart';
import 'package:mainproject/floatingactionbutton/foodlist.dart';
import 'package:mainproject/model.dart';
import 'package:shimmer/shimmer.dart';

import 'widgetmodels/drawer.dart';

class shopix extends StatefulWidget {
  const shopix({Key? key}) : super(key: key);

  @override
  State<shopix> createState() => _shopixState();
}

class _shopixState extends State<shopix> {
  var search = TextEditingController();
  final CollectionReference admins = FirebaseFirestore.instance
      .collection('admins')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('Shops');

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
        leading: const Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: CircleAvatar(
            radius: 30,
            backgroundImage:
                AssetImage("img/0f262171013843bb04861e8e8ac72af7.jpg"),
          ),
        ),
        backgroundColor: HexColor("F2DFB2"),
        title: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('users').snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData &&
                snapshot.data != null &&
                snapshot.data!.docs.isNotEmpty) {
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
                  placeholderStyle: TextStyle(fontSize: 15, color: Colors.grey),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 195.0),
                child: Text(
                  "Select your pet ",
                  style: TextStyle(
                      color: HexColor("7A5600"),
                      fontFamily: 'AbhayaLibre',
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
              SizedBox(
                height: 370,
                child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const dogfood(),
                              ));
                        },
                        child: Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage("img/zdog.jpg"))),
                          child: Stack(
                            children: [
                              Positioned(
                                  top: 108,
                                  left: 1,
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Colors.black26,
                                        borderRadius: BorderRadius.circular(5)),
                                    height: 40,
                                    width: 148,
                                    child: const Padding(
                                      padding: EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        "Dog",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const catmain()));
                        },
                        child: Container(
                          height: 800,
                          width: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      "img/catcatestcatcatesmain.jpg"))),
                          child: Stack(
                            children: [
                              Positioned(
                                  top: 108,
                                  left: 1,
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Colors.black26,
                                        borderRadius: BorderRadius.circular(5)),
                                    height: 40,
                                    width: 148,
                                    child: const Padding(
                                      padding: EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        "Cat",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const birdmain(),
                              ));
                        },
                        child: Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: const DecorationImage(
                                  fit: BoxFit.fitHeight,
                                  image: AssetImage(
                                      "img/parrotrosebackgrond.jpg"))),
                          child: Stack(
                            children: [
                              Positioned(
                                  top: 108,
                                  left: 1,
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Colors.black26,
                                        borderRadius: BorderRadius.circular(5)),
                                    height: 40,
                                    width: 148,
                                    child: const Padding(
                                      padding: EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        "Birds",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const fishmain(),
                              ));
                        },
                        child: Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image:
                                      AssetImage("img/fishfishestmain.jpg"))),
                          child: Stack(
                            children: [
                              Positioned(
                                  top: 108,
                                  left: 1,
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Colors.white24,
                                        borderRadius: BorderRadius.circular(5)),
                                    height: 40,
                                    width: 148,
                                    child: const Padding(
                                      padding: EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        "Fish",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15.0, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Shop by brands",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'SofiaPro',
                          fontWeight: FontWeight.bold,
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
              const SizedBox(
                height: 10,
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
                                color: HexColor("A7B9E9"),
                                image: const DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage("img/catwhiskhas.jpg")))),
                        Text(
                          "Whiskas",
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
                                image: const DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        "img/Royal-Caninimgimgg.jpg")))),
                        Text(
                          "Royal Canin",
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
                                color: Colors.black54,
                                image: const DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        "img/bird_fd3-removebg-preview.png")))),
                        Text(
                          "Wild Feast",
                          style: TextStyle(
                              color: HexColor("7A5600"),
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15.0, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Top picks",
                      style: TextStyle(
                          fontFamily: 'SofiaPro',
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
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
                height: 255,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: mixidfoodi.length,
                  itemBuilder: (context, index) {
                    return Stack(
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
                          child: SizedBox(
                            width: 165,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  mixidfoodi[index]['txt'],
                                  style: TextStyle(
                                      color: HexColor("604401"),
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  mixidfoodi[index]['sub'],
                                ),
                                Text(
                                  mixidfoodi[index]['pri'],
                                  style: const TextStyle(fontWeight: FontWeight.bold),
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
                                          image: mixidfoodi[index]['img'],
                                        ))))),
                      ],
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                child: SizedBox(
                  height: 859,
                  child: StreamBuilder<Object>(
                      stream: admins.snapshots(),
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
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: snapshot.data.docs[index]['imageUrl'] != null
                                            ? ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child: Image.network(
                                            snapshot.data!.docs[index]['shopImage'],
                                            fit: BoxFit.cover,
                                          ),
                                        )
                                            : Shimmer.fromColors(
                                          baseColor: Colors.grey[300]!,
                                          highlightColor: Colors.grey[100]!,
                                          child: Container(
                                            color: Colors.white, // Background color of the shimmer effect
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 18.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [const SizedBox(height: 10,),
                                          Text(
                                            snapshot.data.docs[index]
                                                ['shopName'],
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: HexColor("7A5600")),
                                          ),const SizedBox(height: 10,),
                                          Text(
                                            snapshot.data.docs[index]
                                                ['shopLocation'],
                                            style:
                                                const TextStyle(color: Colors.grey),
                                          ),const SizedBox(height: 10,),
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
          ),
        ),
      ),
    );
  }
}
