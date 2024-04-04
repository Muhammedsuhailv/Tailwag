import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../../imagepick-tile.dart';

class AddShop extends StatefulWidget {
  @override
  State<AddShop> createState() => _AddShopState();
}

class _AddShopState extends State<AddShop> {
  Future<String> uploadImage(File image) async {
    try {
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference reference =
      FirebaseStorage.instance.ref().child('images/$fileName');
      UploadTask uploadTask = reference.putFile(image);
      TaskSnapshot storageTaskSnapshot = await uploadTask;
      String downloadUrl = await storageTaskSnapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print('Error uploading image: $e');
      return '';
    }
  }

  XFile? _imageFile;
  String? imagePath;

  Future<void> _pickImage(BuildContext context) async {
    final ImagePicker _picker = ImagePicker();
    try {
      XFile? pickedFile =
      await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          _imageFile = pickedFile;
          imagePath = pickedFile.path;
        });
      }
      print(_imageFile);
      print('/////////////$imagePath///////////////////');
    } catch (e) {
      print("Error picking image: $e");
    }
  }
  String selectedPetType = 'Dog'; // Default to Dog

  @override
  final GlobalKey<FormState> hospitalAddKey = GlobalKey<FormState>();
  final TextEditingController ShopNameController = TextEditingController();
  final TextEditingController ShopDetailsController = TextEditingController();
  final TextEditingController ShopLocationController = TextEditingController();
  // Add any other controllers as needed.

  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final CollectionReference admins =
    FirebaseFirestore.instance.collection('admins');
    void addShops(String imageUrl, String petType) {
      final hospitalDoc = admins.doc(FirebaseAuth.instance.currentUser!.uid);
      final data = {
        'shopName': ShopNameController.text,
        'shopDetails': ShopDetailsController.text,
        'shopLocation': ShopLocationController.text,
        'PetType': petType,  // Added field for pet type
        'shopImage': imageUrl,
      };
      hospitalDoc.collection('Shops').add(data);
    }

    return Scaffold(
      backgroundColor: HexColor("F2DFB2"),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Add Shops',
          style: TextStyle(
            color: HexColor("7A5600"),
            fontFamily: 'AbhayaLibre',
            fontSize: 30,
          ),
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
                  controller: ShopNameController,
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
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      borderSide: BorderSide(color: HexColor("7A5600")),
                    ),
                    hintStyle: TextStyle(
                      color: HexColor("7A5600"),
                      fontFamily: 'AbhayaLibre_regular',
                      fontWeight: FontWeight.w600,
                    ),
                    hintText: 'Shops Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
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
                  controller: ShopDetailsController,
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
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      borderSide: BorderSide(color: HexColor("7A5600")),
                    ),
                    hintStyle: TextStyle(
                      color: HexColor("7A5600"),
                      fontFamily: 'AbhayaLibre_regular',
                      fontWeight: FontWeight.w600,
                    ),
                    hintText: 'Shops Details',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      borderSide: BorderSide(color: HexColor("7A5600")),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ImagePickTile(
                  onPressed: () {
                    _pickImage(context);
                  },
                  subtitile: _imageFile == null
                      ? 'Nothing Selected'
                      : imagePath!,
                  title: 'Hospital Photo',
                ),
                const SizedBox(
                  height: 20,
                ),

                DropdownButtonFormField<String>(
                  value: selectedPetType,
                  onChanged: (value) {
                    setState(() {
                      selectedPetType = value!;
                    });
                  },
                  items: ['Dog', 'Cat', 'Fish', 'Bird']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(
                          color: HexColor("7A5600"),
                          fontFamily: 'AbhayaLibre_regular',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    );
                  }).toList(),
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
                    hintText: 'Select Pet Type',
                    border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      borderSide: BorderSide(color: HexColor("7A5600")),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  textCapitalization: TextCapitalization.words,
                  controller: ShopLocationController,
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
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      borderSide: BorderSide(color: HexColor("7A5600")),
                    ),
                    hintStyle: TextStyle(
                      color: HexColor("7A5600"),
                      fontFamily: 'AbhayaLibre_regular',
                      fontWeight: FontWeight.w600,
                    ),
                    hintText: 'Shops Location',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
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
                      if (_imageFile != null) {
                        File imageFile = File(_imageFile!.path);
                        String imageUrl = await uploadImage(imageFile);
                        addShops(imageUrl,selectedPetType);
                        Navigator.pop(context);

                        if (hospitalAddKey.currentState!.validate()) {
                          print("Hospital added successfully!");
                        } else {
                          if (ShopNameController.text.isEmpty) {
                            print("Hospital Name is required!");
                          }

                          if (ShopDetailsController.text.isEmpty) {
                            print("Hospital Details are required!");
                          }

                          if (ShopLocationController.text.isEmpty) {
                            print("Hospital Location is required!");
                          }
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
