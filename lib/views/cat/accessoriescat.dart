import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../AllproductDetail.dart';

class CatAccessories extends StatefulWidget {
  const CatAccessories({Key? key}) : super(key: key);

  @override
  State<CatAccessories> createState() => _CatAccessoriesState();
}

class _CatAccessoriesState extends State<CatAccessories> {
  var search = TextEditingController();
  final CollectionReference catAccessories = FirebaseFirestore.instance
      .collection('admins')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('Product');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: HexColor("F2DFB2"),
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios_new_outlined,
                  color: HexColor("7A5600"),
                )),
            title: Text(
              "Accessories",
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: HexColor("7A5600")),
            ),
            centerTitle: true),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: HexColor("F2DFB2"),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 25,
                ),
                SizedBox(
                  height: 45,
                  width: 310,
                  child: TextField(
                    controller: search,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.search_rounded,
                          color: Colors.grey,
                        ),
                        hintText: "Search shop,etc",
                        hintStyle:
                            const TextStyle(color: Colors.grey, fontSize: 13),
                        suffixIcon: const Icon(
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
                const SizedBox(
                  height: 55,
                ),
                SizedBox(
                  height: 1226,
                  width: 999,
                  child: StreamBuilder<Object>(
                      stream: catAccessories
                          .where('ProductType', isEqualTo: 'Accessories')
                          .where('PetType', isEqualTo: 'Cat')
                          .snapshots(),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        }
                        if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        }
                        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                          return const Center(
                              child: Text(
                            'No accessories available.',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ));
                        }
                        return GridView.builder(
                            itemCount: snapshot.data.docs.length,
                            controller: ScrollController(
                              keepScrollOffset: false,
                            ),
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 0.6,
                                    crossAxisSpacing: 0.0,
                                    mainAxisSpacing: 14),
                            itemBuilder: (context, index) {
                              final health = snapshot.data.docs[index];
                              return Padding(
                                padding:
                                    const EdgeInsets.only(left: 4, right: 4),
                                child: Stack(
                                  children: [
                                    Card(
                                        elevation: 5,
                                        child: Container(
                                            height: 305,
                                            width: 165,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: HexColor("F2DFB2"),
                                            ))),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 140.0, left: 6),
                                      child: SizedBox(
                                        width: 165,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              health['ProductName'],
                                              style: TextStyle(
                                                  color: HexColor("604401"),
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(health['ProductDetails']),
                                            Row(
                                              children: [
                                                const Text("MRP :",
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                    )),
                                                Text(
                                                  allProductDetails[index]
                                                      ['reg'],
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      decoration: TextDecoration
                                                          .lineThrough),
                                                ),
                                                Text(
                                                  allProductDetails[index]
                                                      ['pri'],
                                                  style: const TextStyle(
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
                                              height: 128,
                                              width: 165,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: HexColor("F2DFB2"),
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                      health['ProductImage']),
                                                ),
                                              ),
                                            ))),
                                  ],
                                ),
                              );
                            });
                      }),
                ),
              ],
            ),
          ),
        ));
  }
}
