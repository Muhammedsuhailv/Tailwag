import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:hexcolor/hexcolor.dart';
import 'package:shimmer/shimmer.dart';

import '../pharmacy/adminpharmacy.dart';
import '../../widgetmodels/simmereffect.dart';
import 'addhospital.dart';

class AdminHospital extends StatefulWidget {
  const AdminHospital({super.key});

  @override
  State<AdminHospital> createState() => _AdminHospitalState();
}

class _AdminHospitalState extends State<AdminHospital> {
  final CollectionReference admins = FirebaseFirestore.instance
      .collection('admins')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('hospitails');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor("F2DFB2"),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Hospitals',
            style: TextStyle(
                color: HexColor("7A5600"),
                fontFamily: 'AbhayaLibre',
                fontSize: 30),
          ),
          backgroundColor: HexColor("F2DFB2"),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AddHospital(),
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
                stream: admins.orderBy('hospitalName').snapshots(),
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
                                        color: Color(0xFF7A5600),
                                        borderRadius: BorderRadius.circular(8),
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                                "img/New-Mission-Photo-1.jpg"))),
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
                                            ['hospitalName'],
                                        style: const TextStyle(
                                            fontSize: 20,
                                            color: Color(0xFF7A5600),
                                            fontFamily: 'SofiaPro',
                                            fontWeight: FontWeight.bold),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        snapshot.data.docs[index]
                                            ['hospitalLocation'],
                                        style: const TextStyle(
                                            color: Colors.grey,
                                            fontFamily: 'SofiaPro',
                                            fontWeight: FontWeight.bold),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
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

