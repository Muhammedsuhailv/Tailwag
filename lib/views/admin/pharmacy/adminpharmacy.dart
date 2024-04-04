import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:hexcolor/hexcolor.dart';
import 'package:shimmer/shimmer.dart';

import '../../../widgetmodels/simmereffect.dart';
import 'add_adminpharmecy.dart';


class AdminPharmacy extends StatefulWidget {
  const AdminPharmacy({super.key});

  @override
  State<AdminPharmacy> createState() => _AdminPharmacyState();
}

class _AdminPharmacyState extends State<AdminPharmacy> {
  final CollectionReference admins = FirebaseFirestore.instance.collection('admins').doc(FirebaseAuth.instance.currentUser!.uid).collection('pharmacy');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor("F2DFB2"),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Pharmacies',
            style: TextStyle(color: HexColor("7A5600"), fontSize: 30),
          ),
          backgroundColor: HexColor("F2DFB2"),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>  const AddPharmacy(),
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
              stream: admins.orderBy('PharmacieName').snapshots(),
              builder: (context,AsyncSnapshot snapshot) {
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
                      return
                        Row(
                          children: [
                            Card(elevation: 8,
                              child: Container(
                                height: 95,
                                width: 99,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    image: DecorationImage(fit: BoxFit.cover,
                                        image:    NetworkImage(
                                      snapshot.data!.docs[index]['shopImage'],
                                    ),

                                    )),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 13.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    snapshot.data.docs[index]['PharmacieName'],
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 19,
                                        color: HexColor("7A5600")),),
                                  SizedBox(height: 5,),
                                  Text(snapshot.data
                                      .docs[index]['PharmacieLocation'],
                                    style: TextStyle(color: Colors.grey),),
                                  SizedBox(height: 5,),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.orange,
                                      ),
                                      Text(
                                        "5.0",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        );
                    },
                  );
                }
              } ),
          ),
        ));
  }
}
