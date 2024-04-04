import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mainproject/views/admin/adminbottomnavbar.dart';

class AdminController {
  final FirebaseAuth _firebaseAuth;

  AdminController(this._firebaseAuth);

  Future<void> adminLogin(String email, String password, context) async {
    try {
      UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      final user = userCredential.user;
      if (user != null && user.uid == 'yvD4bu4sGARC3Bb3qq2U3HYL2bJ3') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => AdminBottomNavigation(),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Invalid credentials")),
        );
      }
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to sign in: ${e.message}')),
      );
    } catch (e) {
      print(e);
    }
  }
}
