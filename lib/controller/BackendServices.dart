import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:mainproject/model/usermodel.dart';

import '../views/bottomnavigationbars.dart';

class BackendServiecs {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  String _verificationId = ""; // Add this line to declare _verificationId
  String phoneNumber = '+7902210780'; // Example phone number
  UserModel? _userModel;

  UserModel get usermodel => _userModel!;


  Future<void> saveUser(String userid, String username, String email) async {
    final userDoc = firebaseFirestore.collection("users").doc(userid);
    _userModel = UserModel(userid: userid, username: username, email: email);
    await userDoc.set(_userModel!.tomap());
  }

  Future<void> signUp(
      String username, String email, String password, context) async {
    try {
      print('/////////////////////USER SIGNUP//////////////////////');
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      final user = firebaseAuth.currentUser;
      user!.sendEmailVerification();
      await saveUser(user!.uid, username, email);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Its Successfull")));
    } catch (e) {
      print('////////////////////////SIGNUP ERROR///////////////////////////');
      print(e);
    }
  }

  Future<void> login(String email, String password, context) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      final user = firebaseAuth.currentUser;
      final emailveri = user!.emailVerified;
      if (emailveri == false) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Please varifie your email")));
      } else {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => BottomNavigation(),
            ));
      }
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please varifie your email!!!')));
    } catch (e) {
      print(e);
    }
  }

  Future<void> forGott(String email, String password, context) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Password reset email sent. Check your inbox.")));
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Password reset email sent. Check your inbox.")));
    } catch (e) {
      print(e);
    }
  }

  String? _uid;
  String get uid => _uid!;
  Future<void> fetchUserData() async {
    try {
      print('///////////FETCHING USER DATA/////////////////////////////////');

      await firebaseFirestore
          .collection('users')
          .doc(firebaseAuth.currentUser!.uid)
          .get()
          .then((DocumentSnapshot snapshot) {
        _userModel = UserModel(
          userid: snapshot['userid'] ,
          username: snapshot['username'],
          email: snapshot['email'],
          petname: snapshot['petname'] ?? '',
          petsex: snapshot['petsex']?? '',
          petage: snapshot['petage']?? '',
          breedname: snapshot['breedname']?? '',
          petkg: snapshot['petkg']?? '',
          aboutmypet: snapshot['aboutmypet']?? '',
          image: snapshot['image']?? '',
        );
        _uid = usermodel.userid;
      });
    } catch (e) {
      print(e);
    }
  }

  ///////////////////////////////////////////////////PET DETAILS//////////////////////////////////////////////////////////

  Future uploadImage(File image) async {
    String fileName = await DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference =
        FirebaseStorage.instance.ref().child('images/$fileName');
    UploadTask uploadTask = reference.putFile(image);
    TaskSnapshot storageTaskSnapshot = await uploadTask;
    String downloadURL = await storageTaskSnapshot.ref.getDownloadURL();
    return downloadURL;
  }

  Future<void> petDetails(
      String petname,
      String breedname,
      String petsex,
      String petage,
      String petkg,
      String aboutmypet,
      File image,
      context) async {
    try {
      // Get the current user ID
      String userId = firebaseAuth.currentUser?.uid ?? '';
      String imageUrl = await uploadImage(image); // Upload image first

      // Save pet details to Firestore or any other backend
      await firebaseFirestore.collection('users').doc(userId).update({
        'petname': petname,
        'breedname': breedname,
        'petsex': petsex,
        'petage': petage,
        'petkg': petkg,
        'aboutmypet': aboutmypet,
        'image': imageUrl,
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Pet details saved successfully")),
      );
    } catch (e) {
      print(
          '////////////////////////PET DETAILS ERROR///////////////////////////');
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text("Failed to save pet details. Please try again.")),
      );
    }
  }

//   Future<void> createData(
//       String date, String description, String hospital) async {
//     try {
//       print('//////////////saving notes');
//       final recordDoc = firebaseFirestore
//           .collection('users')
//           .doc(uid)
//           .collection('records')
//           .doc();
//       _myNotesModel = MyNotesModel(
//           noteid: recordDoc.id,
//           date: date,
//           description: description,
//           hospital: hospital);
//       await recordDoc.set(_myNotesModel!.toMap());
//       print('/////////////cmpltd');
//     } catch (e) {
//       print('////////////////////////////////$e');
//     }
//   }
}
