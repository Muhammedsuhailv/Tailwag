import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mainproject/care/grooming.dart';
import 'package:mainproject/care/medicare.dart';
import 'package:mainproject/care/recorddata.dart';
import 'package:mainproject/care/recordlist.dart';
import 'package:mainproject/care/remainderr.dart';
import 'package:shimmer/shimmer.dart';

class care extends StatefulWidget {
  const care({Key? key}) : super(key: key);

  @override
  State<care> createState() => _careState();
}

class _careState extends State<care> {
  var search = TextEditingController();
  final CollectionReference admins = FirebaseFirestore.instance
      .collection('admins')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('hospitails');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("F2DFB2"),
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: CircleAvatar(
              radius: 30,
              backgroundImage:
                  AssetImage("img/0f262171013843bb04861e8e8ac72af7.jpg")),
        ),
        title: Image.asset(
          "img/Tailwag.png",
          width: 91,
        ),
        centerTitle: true,
        backgroundColor: HexColor("F2DFB2"),
        actions: [
          Icon(
            Icons.notifications_none,
            size: 27,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
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
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: 25,
            ),
            Container(
              height: 45,
              width: 310,
              child: CupertinoSearchTextField(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                backgroundColor: Colors.white,
                placeholder: 'Search menu, restaurant or etc',
                placeholderStyle: TextStyle(fontSize: 15, color: Colors.grey),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 354,
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => recorddata(),
                            ));
                      },
                      child: Container(
                        height: 50,
                        width: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("img/recorddatamain.jpg"),
                            )),
                        child: Stack(
                          children: [
                            Positioned(
                                top: 107,
                                child: Container(
                                  child: Text(
                                    "Record Data",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.black26,
                                      borderRadius: BorderRadius.circular(5)),
                                  height: 40,
                                  width: 149,
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
                                builder: (context) => medicaree()));
                      },
                      child: Container(
                        height: 50,
                        width: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("img/mainmedicare smeda's.jpg"),
                            )),
                        child: Stack(
                          children: [
                            Positioned(
                                top: 107,
                                child: Container(
                                  child: Text(
                                    "Medicare",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.black26,
                                      borderRadius: BorderRadius.circular(5)),
                                  height: 40,
                                  width: 149,
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
                              builder: (context) => remainder(),
                            ));
                      },
                      child: Container(
                        height: 50,
                        width: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("img/remaindermain.jpg"),
                            )),
                        child: Stack(
                          children: [
                            Positioned(
                                top: 107,
                                child: Container(
                                  child: Text(
                                    "Remainder",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.black26,
                                      borderRadius: BorderRadius.circular(5)),
                                  height: 40,
                                  width: 149,
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
                                builder: (context) => groomingg()));
                      },
                      child: Container(
                        height: 50,
                        width: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("img/main grooming.jpg"),
                            )),
                        child: Stack(
                          children: [
                            Positioned(
                                top: 107,
                                child: Container(
                                  child: Text(
                                    "Grooming",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.black26,
                                      borderRadius: BorderRadius.circular(5)),
                                  height: 40,
                                  width: 149,
                                ))
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 80,
              width: 320,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10)),
                  image: DecorationImage(
                      fit: BoxFit.cover, image: AssetImage("img/noeror.png"))),
              child: Padding(
                padding: const EdgeInsets.only(left: 60.0, top: 25),
                child: Text(
                  "Article",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 19,
                    fontFamily: 'AbhayaLibre_regular',
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Top Pet Hospitals",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      fontFamily: 'SofiaPro',
                    ),
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
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                height: 859,
                child: StreamBuilder<Object>(
                    stream: admins.orderBy('hospitalName').snapshots(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: snapshot.data.docs.length,
                          itemBuilder: (context, index) {

                            return  Padding(
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
                                          snapshot.data.docs[index]['imageUrl'],
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

                                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 10,top: 10),
                                        child: Text(
                            snapshot.data.docs[index]['hospitalName'],
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: HexColor("7A5600")),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 10.0,top: 10),
                                        child: Text(
                                          snapshot.data.docs[index]['hospitalLocation'],
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 10.0,top: 10),
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
                            );
                          },
                        );
                      }
                      return Container();
                    }),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
