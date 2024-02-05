import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_picker/country_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mainproject/sitter/sitter-login.dart';


class AddHospital extends StatefulWidget {
  const AddHospital({super.key});

  @override
  State<AddHospital> createState() => _AddHospitalState();
}

class _AddHospitalState extends State<AddHospital> {
  @override
  final GlobalKey<FormState> hospitalAddKey = GlobalKey<FormState>();
  final TextEditingController hospitalNameController = TextEditingController();
  final TextEditingController hospitalDetailsController = TextEditingController();
  final TextEditingController hospitalLocationController = TextEditingController();
  // Add any other controllers as needed.

  final CollectionReference admins = FirebaseFirestore.instance.collection('admins');
  void addHospitail(){
    final hospitalDoc = admins.doc(FirebaseAuth.instance.currentUser!.uid);
    final data ={
      'hospitalName' :hospitalNameController.text,
      'hospitalDetails':hospitalDetailsController.text,
      'hospitalLocation':hospitalLocationController.text
    };
    hospitalDoc.collection('hospitails').add(data);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: HexColor("F2DFB2"),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Add Hospital',
          style: TextStyle(color: HexColor("7A5600"), fontFamily: 'AbhayaLibre',fontSize: 30),
        ),
        backgroundColor: HexColor("F2DFB2"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                textCapitalization: TextCapitalization.words,
                controller: hospitalNameController,
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
                  hintText: 'Hospital Name',
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
                controller: hospitalDetailsController,
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
                  hintText: 'Hospital Details',
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
                controller: hospitalLocationController,
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
                  hintText: 'Hospital Location',
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

                    overlayColor: MaterialStateProperty.all(HexColor("F2DFB2")),
                    backgroundColor: MaterialStateProperty.all(HexColor("7A5600")),
                  ),
                  onPressed: () async {
                    addHospitail();
                    Navigator.pop(context);

                    // Check if the form is valid
                    if (hospitalAddKey.currentState!.validate()) {
                      // Form is valid, proceed with adding the hospital
                      // Additional logic for saving hospital photo and clearing fields
                      // Close the add hospital screen
                      print("Hospital added successfully!");
                      Navigator.pop(context);
                    } else {
                      Navigator.pop(context);

                      // Form is not valid, show error messages for empty fields
                      // You can customize this part to display error messages as needed
                      if (hospitalNameController.text.isEmpty) {
                        // Display error message for Hospital Name
                        print("Hospital Name is required!");
                      }

                      if (hospitalDetailsController.text.isEmpty) {
                        // Display error message for Hospital Details
                        print("Hospital Details are required!");
                      }

                      if (hospitalLocationController.text.isEmpty) {
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
    );}}