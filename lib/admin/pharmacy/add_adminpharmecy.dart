import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_picker/country_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mainproject/sitter/sitter-login.dart';

class AddPharmacy extends StatefulWidget {
  const AddPharmacy({super.key});

  @override
  State<AddPharmacy> createState() => _AddPharmacyState();
}

class _AddPharmacyState extends State<AddPharmacy> {
  @override
  final GlobalKey<FormState> hospitalAddKey = GlobalKey<FormState>();
  final TextEditingController PharmacieNameController = TextEditingController();
  final TextEditingController PharmacieDetailsController =
      TextEditingController();
  final TextEditingController PharmacieLocationController =
      TextEditingController();

  final CollectionReference admins =
      FirebaseFirestore.instance.collection('admins');
  void addPhamecy() {
    final PharmecyDoc = admins.doc(FirebaseAuth.instance.currentUser!.uid);
    final data = {
      'PharmacieName': PharmacieNameController.text,
      'PharmacieDetails': PharmacieDetailsController.text,
      'PharmacieLocation': PharmacieLocationController.text
    };
    PharmecyDoc.collection('pharmacy').add(data);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: HexColor("F2DFB2"),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Add Pharmacies',
          style: TextStyle(
              color: HexColor("7A5600"),
              fontFamily: 'AbhayaLibre',
              fontSize: 30),
        ),
        backgroundColor: HexColor("F2DFB2"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
        child: SingleChildScrollView(
          child: Form(
            key: hospitalAddKey,
            child: Column(
              children: [
                TextFormField(
                  textCapitalization: TextCapitalization.words,
                  controller: PharmacieNameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '*this field is required';
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    fillColor: HexColor("F2DFB2"),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      borderSide: BorderSide(color: HexColor("7A5600")),
                    ),
                    hintStyle: TextStyle(
                      color: HexColor("7A5600"),
                      fontFamily: 'AbhayaLibre_regular',
                      fontWeight: FontWeight.w600,
                    ),
                    hintText: 'Pharmacies Name',
                    border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      borderSide: BorderSide(color: HexColor("7A5600")),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  maxLines: 3,
                  textCapitalization: TextCapitalization.words,
                  controller: PharmacieDetailsController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '*this field is required';
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    fillColor: HexColor("F2DFB2"),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      borderSide: BorderSide(color: HexColor("7A5600")),
                    ),
                    hintStyle: TextStyle(
                      color: HexColor("7A5600"),
                      fontFamily: 'AbhayaLibre_regular',
                      fontWeight: FontWeight.w600,
                    ),
                    hintText: 'Pharmacies Details',
                    border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      borderSide: BorderSide(color: HexColor("7A5600")),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const ListTile(
                  subtitle: Text("Nothing Selected"),
                  title: Text('Hospital Photo'),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  textCapitalization: TextCapitalization.words,
                  controller: PharmacieLocationController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '*this field is required';
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    fillColor: HexColor("F2DFB2"),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      borderSide: BorderSide(color: HexColor("7A5600")),
                    ),
                    hintStyle: TextStyle(
                      color: HexColor("7A5600"),
                      fontFamily: 'AbhayaLibre_regular',
                      fontWeight: FontWeight.w600,
                    ),
                    hintText: 'Pharmacies Location',
                    border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      borderSide: BorderSide(color: HexColor("7A5600")),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                  width: width * 0.7,
                  height: 45,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      overlayColor:
                          MaterialStateProperty.all(HexColor("F2DFB2")),
                      backgroundColor:
                          MaterialStateProperty.all(HexColor("7A5600")),
                    ),
                    onPressed: () async {
                      if (hospitalAddKey.currentState!.validate()) {
                        addPhamecy();

                        print("Hospital added successfully!");
                        Navigator.pop(context);
                      } else {
                        if (PharmacieNameController.text.isEmpty) {
                          print("Hospital Name is required!");
                        }

                        if (PharmacieDetailsController.text.isEmpty) {
                          print("Hospital Details are required!");
                        }

                        if (PharmacieLocationController.text.isEmpty) {
                          // Display error message for Hospital Location
                          print("Hospital Location is required!");
                        }
                      }
                    },
                    child: const Text(
                      'Add',
                      style: TextStyle(
                        fontFamily: 'AbhayaLibre_regular',
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
