import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shimmer/shimmer.dart';

import '../controller/BackendServices.dart';

import 'dart:io';

class Editprofile extends StatefulWidget {
  const Editprofile({Key? key}) : super(key: key);

  @override
  State<Editprofile> createState() => _EditprofileState();
}

class _EditprofileState extends State<Editprofile> {
  File? _image;
  final picker = ImagePicker();
  Future ChoiceImage() async {
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = File(pickedImage!.path);
    });
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController breedController = TextEditingController();
  TextEditingController sexController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController kgController = TextEditingController();
  TextEditingController aboutPetController = TextEditingController();
  BackendServiecs backendServiecs = BackendServiecs();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("F2DFB2"),
      appBar: AppBar(
        backgroundColor: HexColor("BFA05A"),
        leading: Padding(
          padding: const EdgeInsets.only(left: 23.0),
          child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: HexColor("7A5600"),
              )),
        ),
        title: Image.asset(
          "img/Tailwag.png",
          width: 91,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings, color: HexColor("7A5600")),
          ),
          const SizedBox(
            width: 23,
          )
        ],
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: 270,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: HexColor("BFA05A"),
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(35),
                        bottomRight: Radius.circular(35))),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 4,
                    ),
                    Padding(
                        padding: EdgeInsets.only(right: 195.0, top: 15),
                        child: _image != null
                            ? Stack(
                                children: [
                                  StreamBuilder<QuerySnapshot>(
                                      stream: FirebaseFirestore.instance
                                          .collection('users')
                                          .snapshots(),
                                      builder: (context, snapshot) {
                                        return snapshot.connectionState == ConnectionState.waiting
                                            ? Shimmer.fromColors(
                                          baseColor: Colors.grey[300]!,
                                          highlightColor: Colors.grey[100]!,
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 8.0),
                                            child: CircleAvatar(
                                              radius: 30,
                                              backgroundColor: Colors.white,
                                            ),
                                          ),
                                        )
                                            : CircleAvatar(
                                          backgroundColor: HexColor("F2DFB2"),
                                          radius: 49,
                                          backgroundImage: NetworkImage(snapshot
                                              .data!.docs.first['image']),
                                        );
                                      }),
                                  Positioned(
                                    top: 65,
                                    left: 65,
                                    child: SizedBox(
                                      width: 30, // Adjust width as needed
                                      height: 30, // Adjust height as needed
                                      child: IconButton(
                                          padding:
                                              EdgeInsets.zero, // Remove padding

                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStatePropertyAll(
                                                    HexColor("F2DFB2")),
                                          ),
                                          onPressed: () {
                                            ChoiceImage();
                                          },
                                          icon: Icon(Icons.add)),
                                    ),
                                  )
                                ],
                              )
                            : Stack(
                                children: [
                                  CircleAvatar(
                                      backgroundColor: HexColor("F2DFB2"),
                                      radius: 49,
                                      backgroundImage: AssetImage(
                                          "img/defult puppy photo.jpg")),
                                  Positioned(
                                    top: 52,
                                    left: 55,
                                    child: IconButton(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                                  HexColor("F2DFB2")),
                                        ),
                                        onPressed: () {
                                          ChoiceImage();
                                        },
                                        icon: Icon(Icons.add)),
                                  )
                                ],
                              )),
                    const SizedBox(
                      height: 36,
                    ),
                    SizedBox(
                        height: 48,
                        width: 302,
                        child: TextField(
                          controller: nameController,
                          decoration: InputDecoration(
                              hintStyle: TextStyle(
                                color: HexColor('#7A5600'),
                                fontFamily: 'AbhayaLibre_regular',
                              ),
                              hintText: "Name",
                              fillColor: HexColor("BFA05A"),
                              filled: true,
                              focusedBorder: const OutlineInputBorder(),
                              enabledBorder: const OutlineInputBorder()),
                        ))
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Positioned(
                  top: 240,
                  left: 28,
                  child: SizedBox(
                      height: 48,
                      width: 302,
                      child: TextField(
                        controller: breedController,
                        decoration: InputDecoration(
                            hintStyle: TextStyle(
                                fontFamily: 'AbhayaLibre_regular',
                                color: HexColor('#7A5600')),
                            hintText: "Breedname",
                            fillColor: HexColor("BFA05A"),
                            filled: true,
                            focusedBorder: const OutlineInputBorder(),
                            enabledBorder: const OutlineInputBorder()),
                      ))),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 325,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                            height: 48,
                            width: 88,
                            child: TextField(
                              controller: sexController,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                  hintStyle: TextStyle(
                                      fontFamily: 'AbhayaLibre_regular',
                                      color: HexColor('#7A5600')),
                                  hintText: "Sex",
                                  fillColor: HexColor("BFA05A"),
                                  filled: true,
                                  focusedBorder: const OutlineInputBorder(),
                                  enabledBorder: const OutlineInputBorder()),
                            )),
                        SizedBox(
                            height: 48,
                            width: 88,
                            child: TextField(
                              controller: ageController,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                  hintStyle: TextStyle(
                                      fontFamily: 'AbhayaLibre_regular',
                                      color: HexColor('#7A5600')),
                                  hintText: "Age",
                                  fillColor: HexColor("BFA05A"),
                                  filled: true,
                                  focusedBorder: const OutlineInputBorder(),
                                  enabledBorder: const OutlineInputBorder()),
                            )),
                        SizedBox(
                            height: 48,
                            width: 88,
                            child: TextField(
                              controller: kgController,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                  hintStyle: TextStyle(
                                      fontFamily: 'AbhayaLibre_regular',
                                      color: HexColor('#7A5600')),
                                  hintText: "KG",
                                  fillColor: HexColor("BFA05A"),
                                  filled: true,
                                  focusedBorder: const OutlineInputBorder(),
                                  enabledBorder: const OutlineInputBorder()),
                            )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 198.0, top: 8),
                    child: Text(
                      "About my pet",
                      style: TextStyle(
                          fontFamily: 'AbhayaLibre',
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: HexColor('#7A5600')),
                    ),
                  ),
                  SizedBox(
                      height: 110,
                      width: 302,
                      child: TextField(
                        controller: aboutPetController,
                        maxLines: 5,
                        decoration: InputDecoration(
                            hintStyle: TextStyle(
                                fontFamily: 'AbhayaLibre_regular',
                                color: HexColor('#7A5600')),
                            hintText: "Aboute My Pet",
                            fillColor: HexColor("BFA05A"),
                            filled: true,
                            focusedBorder: const OutlineInputBorder(),
                            enabledBorder: const OutlineInputBorder()),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 238.0, top: 3),
                    child: InkWell(
                        onTap: () {
                          backendServiecs.uploadImage(_image!);
                          backendServiecs.petDetails(
                              nameController.text,
                              breedController.text,
                              sexController.text,
                              ageController.text,
                              kgController.text,
                              aboutPetController.text,
                              _image!, // Pass the image URL
                              context);

                          Navigator.pop(context, true);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 38,
                          width: 65,
                          decoration: BoxDecoration(
                            border: Border.all(color: HexColor('#7A5600')),
                            color: HexColor("BFA05A"),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            "SAVE",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'AbhayaLibre_regular',
                                color: HexColor('#7A5600')),
                          ),
                        )),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
