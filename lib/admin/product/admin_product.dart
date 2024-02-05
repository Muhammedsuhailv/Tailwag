import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:hexcolor/hexcolor.dart';
import 'package:mainproject/admin/product/add_product.dart';

import '../../widgetmodels/simmereffect.dart';


class AdminProduct extends StatefulWidget {
  const AdminProduct({super.key});

  @override
  State<AdminProduct> createState() => _AdminProductState();
}

class _AdminProductState extends State<AdminProduct> {
  final CollectionReference admins = FirebaseFirestore.instance
      .collection('admins')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('Product');
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: HexColor("F2DFB2"),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Product',
            style: TextStyle(color: HexColor("7A5600"), fontSize: 30),
          ),
          backgroundColor: HexColor("F2DFB2"),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const AddProduct(),
                  ),
                );
              },
              icon: Icon(
                Icons.add_to_photos_outlined,
                color: HexColor("7A5600"),
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
            width: 359,
            child: StreamBuilder<Object>(
                stream: admins.orderBy('ProductName').snapshots(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    // Add shimmer effect while data is loading
                    return ShimmerList();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return ListView.separated(
                      itemCount: snapshot.data.docs.length,
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 10,
                        );
                      },
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Row(
                              children: [
                                Card(elevation: 8,
                                  child: Container(
                                    height: 88,
                                    width: 88,
                                    decoration: BoxDecoration(
                                        color: const Color(0xFF7A5600),
                                        borderRadius: BorderRadius.circular(8),
                                        image: const DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                                "img/propetsproducts.jpg"))),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 13.0),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        snapshot.data.docs[index]
                                        ['ProductName'],
                                        style: const TextStyle(
                                            fontSize: 20,
                                            color: Color(0xFF7A5600),
                                            fontFamily: 'SofiaPro',
                                            fontWeight: FontWeight.bold),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        snapshot.data.docs[index]
                                        ['ProductLocation'],
                                        style: const TextStyle(
                                            color: Colors.grey,
                                            fontFamily: 'SofiaPro',
                                            fontWeight: FontWeight.bold),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      const Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.orange,
                                          ),
                                          Text(
                                            "0.0",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey,
                                              fontFamily: 'SofiaPro',
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ));
                      },
                    );
                  }
                }),
          ),
        ));
  }
}
