import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:mainproject/model/sittermodel.dart';
import 'package:uuid/uuid.dart';
import 'dart:io';
import '../bottomnavigationbars.dart';

class SitterCtl{
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  SitterModel? _sitterModel;

  SitterModel get sitterModel => _sitterModel!;
  Future<void> saveSitter(String sitterid, String name, String place,String phone,String email, String title, String details) async {
    final userDoc = firebaseFirestore.collection("sitters").doc(sitterid);
    _sitterModel = SitterModel(sitterid: sitterid, name: name, place: place, phone: phone, email: email, title: title, details: details);
    await userDoc.set(_sitterModel!.tomap());
  }

  Future<void> signUpSitter(String name, String place, String password,String phone, String email, String title,String details,
      context) async {
    try {
      print('/////////////////////sitters SIGNUP//////////////////////');
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      final user = firebaseAuth.currentUser;
      user!.sendEmailVerification();
      await saveSitter(user!.uid,name, place, phone, email, title, details);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Its Successfull")));
    } catch (e) {
      print('////////////////////////SIGNUP ERROR///////////////////////////');
      print(e);
    }
  }


  Future<void> loginSitter(String email, String password, context) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      final user = firebaseAuth.currentUser;
      final emailveri = user!.emailVerified;
      if (emailveri == false) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Please varifie your email")));
      } else {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => BottomNavigation(),));
      }
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(
          SnackBar(content: Text('Please varifie your email!!!')));
    } catch (e) {
      print(e);
    }
  }

  Future<String> uploadImage(File image) async {
    try {
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference reference = FirebaseStorage.instance.ref().child('images/$fileName');
      UploadTask uploadTask = reference.putFile(image);
      TaskSnapshot storageTaskSnapshot = await uploadTask;
      String downloadUrl = await storageTaskSnapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print('Error uploading image: $e');
      return '';
    }
  }

}