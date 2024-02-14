import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../widgetmodels/simmereffect.dart';
import '../../admin/shops/addshops.dart';

class AdminShops extends StatefulWidget {
  const AdminShops({Key? key}) : super(key: key);

  @override
  State<AdminShops> createState() => _AdminShopsState();
}

class _AdminShopsState extends State<AdminShops> {
  final CollectionReference admins = FirebaseFirestore.instance
      .collection('admins')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('Shops');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("F2DFB2"),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Shops',
          style: TextStyle(color: HexColor("7A5600"), fontSize: 30),
        ),
        backgroundColor: HexColor("F2DFB2"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AddShop(),
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
          child: StreamBuilder<QuerySnapshot>(
              stream: admins.orderBy('shopName').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return ShimmerList();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return ListView.separated(
                    itemCount: snapshot.data!.docs.length,
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 4,
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
                                      snapshot.data!.docs[index]['shopImage'],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 13.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    snapshot.data!.docs[index]['shopName'],
                                    style: const TextStyle(
                                      fontSize: 20,
                                      color: Color(0xFF7A5600),
                                      fontFamily: 'SofiaPro',
                                      fontWeight: FontWeight.bold,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    snapshot.data!.docs[index]['shopLocation'],
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
                          ],
                        ),
                      );
                    },
                  );
                }
              }),
        ),
      ),
    );
  }
}

// Adding code to git first time
//
// git init
// git commit -m "first commit"
// git add .
// git commit -m "first commit"
// git branch -M main
// git remote add origin <link here without any symbols>
// git push -u origin main
//
//
// 🍎 Commit when coding
//
// git add .
// git commit -m "second commit"
// git push -u origin main
