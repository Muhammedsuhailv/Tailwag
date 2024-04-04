import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shimmer/shimmer.dart';

import 'accessories.dart';
import 'dogfoodpersonal.dart';
import 'health and hygeyn.dart';
import 'treats.dart';

class DogMain extends StatefulWidget {
  const DogMain({Key? key}) : super(key: key);

  @override
  State<DogMain> createState() => _DogMainState();
}

class _DogMainState extends State<DogMain> {
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
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios_new_rounded, color: HexColor("7A5600")),
        ),
        title: Image.asset("img/Tailwag.png", width: 91),
        centerTitle: true,
        actions: const [
          CircleAvatar(
            radius: 26,
            backgroundImage: AssetImage("img/0f262171013843bb04861e8e8ac72af7.jpg"),
          ),
          SizedBox(width: 23),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 25),
            const SizedBox(
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
                padding: const EdgeInsets.all(10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  buildGridItem("img/mainfooo.jpg", "Food"),
                  buildGridItem("img/maintreats.jpg", "Treats"),
                  buildGridItem("img/xyzallfloatpngtree-white-foaming-hand-soap-bottle-on-green-background-with-a-plant-image_2614695.jpg", "Health & Hygiene"),
                  buildGridItem("img/main accssories.jpg", "Accessories"),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15.0, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Top picks", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontFamily: 'SofiaPro', fontSize: 16)),
                  Text("See all", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600)),
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
                    buildTopPickCard("Farmina Dry Food - N&D Pumpkin Dog Lamb", "₹199.00", "img/Seciniot.jpg"),
                    buildTopPickCard("Bully Maxhigh PerformanceSuperPremiumFood", "₹1799.00", "img/Domel.jpg"),
                    buildTopPickCard("ROYAL CANIN® Giant Puppy food is specially", "₹199.00", "img/Royal-Caninimgimgg.jpg"),
                    buildTopPickCard("Applaws Tuna in Jelly For Kittens WetFood", "₹155.00", "img/whole__life-removebg-preview.png"),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: SizedBox(
                height: 859,
                child: StreamBuilder<Object>(
                    stream: admins.where('PetType', isEqualTo: 'Dog').snapshots(),
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
                                      child: snapshot.data.docs[index]['shopImage'] != null
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
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 18.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        const SizedBox(height: 10),
                                        Text(
                                          snapshot.data.docs[index]['shopName'],
                                          style: TextStyle(fontWeight: FontWeight.bold, color: HexColor("7A5600")),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(snapshot.data.docs[index]['shopLocation'], style: const TextStyle(color: Colors.grey)),
                                        const SizedBox(height: 10),
                                        const Row(
                                          children: [
                                            Icon(Icons.star_rate_rounded, color: Colors.orange),
                                            Text("3.0", style: TextStyle(color: Colors.grey)),
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
                    }
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildGridItem(String imagePath, String text) {
    return InkWell(
      onTap: () {
        switch (text) {
          case "Food":
            Navigator.push(context, MaterialPageRoute(builder: (context) =>  DogFood()));
            break;
          case "Treats":
            Navigator.push(context, MaterialPageRoute(builder: (context) => const DogTreats()));
            break;
          case "Health & Hygiene":
            Navigator.push(context, MaterialPageRoute(builder: (context) => const Health()));
            break;
          case "Accessories":
            Navigator.push(context, MaterialPageRoute(builder: (context) => const Accessories()));
            break;
          default:
            break;
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 11, right: 11, top: 26, bottom: 26),
        child: Container(
          height: 90,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: HexColor("88A18E"),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(imagePath),
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                top: 78,
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  height: 40,
                  width: 147,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      "$text  ",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTopPickCard(String title, String price, String imagePath) {
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
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 130.0, left: 6),
          child: SizedBox(
            width: 165,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(color: HexColor("604401"), fontWeight: FontWeight.bold),
                ),
                const Text("Dehydrated, slow-cooked gluten-free cat treats"),
                Text(
                  price,
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
                color: Colors.grey[800],
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(imagePath),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
