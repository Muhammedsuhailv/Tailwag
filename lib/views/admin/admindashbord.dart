import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mainproject/views/spalshscreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({Key? key}) : super(key: key);

  @override
  _AdminDashboardState createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  List<int> itemCounts = [0, 0, 0, 0];

  @override
  void initState() {
    super.initState();
    // Fetch the counts from Firebase and update itemCounts
    fetchCounts();
  }

  Future<void> fetchCounts() async {
    try {

      final hospitalCount = await getDocumentCount('hospitails');
      final shopsCount = await getDocumentCount('Shops');
      final pharmacyCount = await getDocumentCount('pharmacy');
      final productCount = await getDocumentCount('Product');
      print('Hospital Count: $hospitalCount');
      print('Shops Count: $shopsCount');
      print('Pharmacy Count: $pharmacyCount');
      print('Product Count: $productCount');

      setState(() {
        itemCounts[0] = hospitalCount;
        itemCounts[1] = shopsCount;
        itemCounts[2] = pharmacyCount;
        itemCounts[3] = productCount;
      });
    } catch (error) {
      print('Error fetching counts: $error');
    }
  }

  Future<int> getDocumentCount(String collectionName) async {
    final CollectionReference collection = FirebaseFirestore.instance
        .collection('admins')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection(collectionName);

    QuerySnapshot snapshot = await collection.get();
    return snapshot.size;
  }

  @override
  Widget build(BuildContext context) {
    List<String> items = ['Hospitals', 'Shops', 'Pharmacies', 'Products'];

    return Scaffold(
      backgroundColor: HexColor("F2DFB2"),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Dashboard',
          style: TextStyle(
            color: HexColor("7A5600"),
            fontFamily: 'AbhayaLibre',
            fontSize: 30,
          ),
        ),
        backgroundColor: HexColor("F2DFB2"),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    title: const Text(
                      'Do you want to SignOut?',
                      style: TextStyle(
                        fontFamily: 'SofiaPro',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Cancel',
                          style: TextStyle(fontSize: 17, fontFamily: "SofiaPro"),
                        ),
                      ),
                      TextButton(
                        onPressed: () async {
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (ctx1) => const splash(),
                            ),
                                (route) => false,
                          );
                        },
                        child: const Text(
                          'SignOut',
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.red,
                            fontFamily: "SofiaPro",
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
            icon: Icon(
              Icons.logout,
              color: HexColor("7A5600"),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Card(
              color: HexColor("7A5600"),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      items[index],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      itemCounts[index].toString(),
                      style: const TextStyle(
                        fontFamily: 'AbhayaLibre',
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
