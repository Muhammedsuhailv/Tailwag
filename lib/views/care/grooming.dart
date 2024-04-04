import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'groominglist.dart';


class groomingg extends StatefulWidget {
  const groomingg({Key? key}) : super(key: key);

  @override
  State<groomingg> createState() => _groominggState();
}

class _groominggState extends State<groomingg> {
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
                radius: 26, backgroundImage: AssetImage("img/cattt.jpg")),
          ),
          SizedBox(
            width: 23,
          )
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
                placeholder: 'Search shop, sitters or etc',
                placeholderStyle: TextStyle(fontSize: 15, color: Colors.grey),
              ),
            ),
            SizedBox(
              height: 29,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Top Grooming Products",
                  style: TextStyle(
                      color: HexColor("604401"),
                      fontFamily: 'AbhayaLibre',
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  width: 25,
                ),
                Text(
                  "See all",
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.w900),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 540,
              width: 997,
              child: GridView.builder(
                  itemCount: groom.length,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.7,
                      crossAxisSpacing: 0.0,
                      mainAxisSpacing: 13),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 8, right: 5),
                      child: Card(
                        color: HexColor("F2DFB2"),
                        child: Column(
                          children: [
                            Card(
                              elevation: 3,
                              shadowColor: Colors.grey,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Container(
                                height: 106.7,
                                width: 245,
                                decoration: BoxDecoration(
                                  color: HexColor("F2DFB2"),
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(14),
                                    topLeft: Radius.circular(14),
                                  ),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: groom[index]['img']),
                                ),
                              ),
                            ),
                            Container(
                              width: 258,
                              height: 110,
                              decoration: BoxDecoration(
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
                                      Text(
                                        groom[index]['tname'],
                                        style: TextStyle(
                                            color: HexColor("7A5600"),
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        groom[index]['rat'],
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ]),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
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
                    "Top Grooming Center",
                    style: TextStyle(
                        color: HexColor("604401"),
                        fontWeight: FontWeight.bold,
                      fontFamily: 'AbhayaLibre',
                      fontSize: 20,),
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
                                  image: AssetImage("img/just dogs.jpeg")),
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
                                  image: AssetImage("img/11627364873059.webp")),
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
                                  image: AssetImage("img/bow bow.jpg")),
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
                                  image: AssetImage("img/just dogs.jpeg")),
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
          ]),
        ),
      ),
    );
  }
}
