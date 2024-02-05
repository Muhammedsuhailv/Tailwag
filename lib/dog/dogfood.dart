import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mainproject/dog/accessories.dart';
import 'package:mainproject/dog/dogfoodpersonal.dart';
import 'package:mainproject/dog/health%20and%20hygeyn.dart';
import 'package:mainproject/dog/treats.dart';
import 'package:mainproject/floatingactionbutton/food.dart';

class dogfood extends StatefulWidget {
  const dogfood({Key? key}) : super(key: key);

  @override
  State<dogfood> createState() => _dogfoodState();
}

class _dogfoodState extends State<dogfood> {
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
                radius: 26,
                backgroundImage:
                    AssetImage("img/0f262171013843bb04861e8e8ac72af7.jpg")),
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
              height: 350,
              child: GridView(
                  padding: EdgeInsets.all(10),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => dogpers()));
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
                                Positioned(
                                    top: 78,
                                    child: Container(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Text(
                                          "Food  ",
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
                          )),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => treats(),
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
                                Positioned(
                                    top: 78,
                                    child: Container(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Text(
                                          "Treats  ",
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
                          )),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => health(),
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
                                Positioned(
                                    top: 78,
                                    child: Container(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
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
                          )),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => accessories(),
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
                                Positioned(
                                    top: 78,
                                    child: Container(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
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
                                  "Farmina Dry Food - N&D Pumpkin Dog Lamb",
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
                                        color: HexColor("BB9D56"),
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                                "img/Seciniot.jpg")))))),
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
                                  "Bully Maxhigh PerformanceSuperPremiumFood",
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
                                        image: AssetImage("img/Domel.jpg")),
                                  ))),
                          // Card(elevation: 5,child: Container(height: 80,width: 150,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.grey[800]),child: Image.asset("img/bird_fd4_drools-removebg-preview.png"),)),
                        ),
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
                                  "ROYAL CANIN® Giant Puppy food is specially",
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
                                                "img/Royal-Caninimgimgg.jpg")))))),
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
                                              "img/whole__life-removebg-preview.png"))),
                                ))),
                        // Card(elevation: 5,child: Container(height: 80,width: 150,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.grey[800]),child: Image.asset("img/bird_fd4_drools-removebg-preview.png"),)),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            //
            // SizedBox(height: 10,),
            // SizedBox(height: 120,
            //   child:   Padding(
            //     padding: const EdgeInsets.only(left: 10.0),
            //     child: ListView(scrollDirection: Axis.horizontal,
            //
            //       children: [
            //
            //         Card(elevation: 5,child: Container(height: 80,width: 100,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.grey[800]),child: Image.asset("img/droools_stack-removebg-preview.png"),)),
            //
            //         Card(elevation: 5,child: Container(height: 80,width: 100,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color:Colors.grey[800]),child: Image.asset("img/Royal-Caninimg-removebg-preview.png"),)),
            //
            //         Card(elevation: 5,child: Container(height: 80,width: 100,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.grey[800]),child: Image.asset("img/dog_fddddddddd-removebg-preview.png"),)),
            //         Card(elevation: 5,child: Container(height: 80,width: 100,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.grey[800]),child: Image.asset("img/droolsnon-removebg-preview.png"),)),
            //
            //
            //
            //
            //
            //
            //
            //
            //       ],),
            //   ),
            // )
            //
            //

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
          ],
        )),
      ),
    );
  }
}
