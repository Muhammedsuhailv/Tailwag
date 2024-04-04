import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../widgetmodels/simmereffect.dart';
import 'add_product.dart';

class AdminProduct extends StatefulWidget {
  const AdminProduct({Key? key}) : super(key: key);

  @override
  _AdminProductState createState() => _AdminProductState();
}

class _AdminProductState extends State<AdminProduct> {
  final CollectionReference admins = FirebaseFirestore.instance
      .collection('admins')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('Product');

  void deletData(docId) {
    admins.doc(docId).delete();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
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
                    builder: (context) => AddProduct(),
                  ),
                );
              },
              icon: Icon(
                Icons.add_to_photos_outlined,
                color: HexColor("7A5600"),
              ),
            )
          ],
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Food'),
              Tab(text: 'Treats'),
              Tab(text: 'Accessories'),
              Tab(text: 'Health & Hygiene'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildProductList('Food'),
            _buildProductList('Treats'),
            _buildProductList('Accessories'),
            _buildProductList('Health & Hygiene'),
          ],
        ),
      ),
    );
  }

  Widget _buildProductList(String productType) {
    return StreamBuilder<QuerySnapshot>(
      stream: admins
          .where('ProductType', isEqualTo: productType)
          .orderBy('ProductName')
          .snapshots(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return ShimmerList(); // You can replace this with a loading indicator
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return ListView.separated(
            itemCount: snapshot.data.docs.length,
            separatorBuilder: (context, index) {
              print('///////////$productType///////////////');
              return const SizedBox(
                height: 10,
              );
            },
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    Card(
                      elevation: 8,
                      child: Container(
                        height: 88,
                        width: 88,
                        decoration: BoxDecoration(
                          color: const Color(0xFF7A5600),
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                snapshot.data.docs[index]['ProductImage']),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 13.0),
                      child: InkWell(
                        onLongPress: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                backgroundColor: HexColor("F2DFB2"),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                title: const Text(
                                  'Do you want to Delete?',
                                  style: TextStyle(
                                      fontFamily: 'SofiaPro',
                                      fontWeight: FontWeight.w600),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text(
                                      'Cancel',
                                      style: TextStyle(
                                          fontSize: 17, fontFamily: "SofiaPro"),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      deletData(snapshot.data.docs[index].id);
                                      Navigator.pop(context);
                                    },
                                    child: const Text(
                                      'Delete',
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.red,
                                          fontFamily: "SofiaPro"),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 235,
                              child: Text(
                                snapshot.data.docs[index]['ProductName'],
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Color(0xFF7A5600),
                                  fontFamily: 'SofiaPro',
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              snapshot.data.docs[index]['ProductLocation'],
                              style: const TextStyle(
                                color: Colors.grey,
                                fontFamily: 'SofiaPro',
                                fontWeight: FontWeight.bold,
                              ),
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
                    ),
                  ],
                ),
              );
            },
          );
        }
      },
    );
  }
}
