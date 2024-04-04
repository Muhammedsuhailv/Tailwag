import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'fooddetail.dart';
import 'foodlist.dart';

class Ftreats extends StatefulWidget {
  const Ftreats({Key? key}) : super(key: key);

  @override
  State<Ftreats> createState() => _FtreatsState();
}

class _FtreatsState extends State<Ftreats> {
  late final CollectionReference treatsCollection;

  @override
  void initState() {
    super.initState();
    final String uid = FirebaseAuth.instance.currentUser!.uid;
    treatsCollection = FirebaseFirestore.instance
        .collection('admins')
        .doc(uid)
        .collection('Product');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor("F2DFB2"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new_outlined, color: HexColor("7A5600")),
        ),
        title: Text(
          "Foods",
          style: TextStyle(fontWeight: FontWeight.bold, color: HexColor("7A5600")),
        ),
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: HexColor("F2DFB2"),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 25),
              SizedBox(
                height: 45,
                width: 310,
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search_rounded, color: Colors.grey),
                    hintText: "Search shop, etc",
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 13),
                    suffixIcon: Icon(Icons.filter_list, color: Colors.grey),
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              SizedBox(
                height: 1444,
                child: StreamBuilder<QuerySnapshot>(
                  stream: treatsCollection.where('ProductType', isEqualTo: 'Treats').snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    }
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    }
                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return Text('No treats available.');
                    }
                    return SizedBox(
                      height: 430,
                      child: GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.6,
                          crossAxisSpacing: 0.0,
                          mainAxisSpacing: 13,
                        ),
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          final treat = snapshot.data!.docs[index];
                          return Stack(
                            children: [
                              Container(
                                height: 240,
                                width: 155,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: HexColor("F2DFB2"),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 130.0, left: 6),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DetailPage(
                                          img: treat['ProductImage'],
                                          text: treat['ProductName'],
                                          sub: treat['ProductDetails'],
                                          pri: 'ProductPrice',
                                          per: 'ProductPer',
                                          bra: 'ProductBrand',
                                          fla: 'ProductFlavor',
                                        ),
                                      ),
                                    );
                                  },
                                  child: SizedBox(
                                    width: 160,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          treat['ProductName'],
                                          style: TextStyle(color: HexColor("604401"), fontWeight: FontWeight.bold),
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Text(treat['ProductDetails']),
                                        Row(
                                          children: [
                                            const Text(
                                              "MRP :",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w900,
                                              ),
                                            ),
                                            Text(
                                              foodi[index]['pri'],
                                              style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w900),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
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
                                      borderRadius: BorderRadius.circular(10),
                                      color: HexColor("D8B053"),
                                    ),
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: Container(
                                            height: 60,
                                            width: 60,
                                            decoration: BoxDecoration(
                                              color: HexColor("BB9D56"),
                                              borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(60), topRight: Radius.circular(15)),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Container(
                                            height: 60,
                                            width: 60,
                                            decoration: BoxDecoration(
                                              color: HexColor("BB9D56"),
                                              borderRadius: const BorderRadius.only(topRight: Radius.circular(60), bottomLeft: Radius.circular(15)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Container(
                                  height: 120,
                                  width: 120,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.contain,
                                      image: NetworkImage(treat['ProductImage']),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
