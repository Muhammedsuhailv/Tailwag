import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'editprofile.dart';

class SitterProfile extends StatefulWidget {
  const SitterProfile({Key? key}) : super(key: key);

  @override
  _SitterProfileState createState() => _SitterProfileState();
}

class _SitterProfileState extends State<SitterProfile> {
  final CollectionReference sitters =
      FirebaseFirestore.instance.collection('sitters');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          StreamBuilder<Object>(
              stream: sitters.snapshots(),
              builder: (context, AsyncSnapshot snapshot) {
                final index = snapshot.data!.docs.length - 1;

                final DocumentSnapshot sitterSnap = snapshot.data!.docs[index];
                return IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/update', arguments: {
                      'name': sitterSnap['name'],
                      'place': sitterSnap['place'],
                      'phone': sitterSnap['phone'],
                      'email': sitterSnap['email'],
                      'title': sitterSnap['title'],
                      'details': sitterSnap['details'],
                      'id': sitterSnap.id,
                    });
                  },
                  icon: const Icon(Icons.edit),
                );
              }),
        ],
      ),
      body: StreamBuilder<Object>(
          stream: sitters.snapshots(),
          builder: (context, AsyncSnapshot snapshot) {
            final index = snapshot.data!.docs.length - 1;

            final DocumentSnapshot sitterSnap = snapshot.data!.docs[index];

            return SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: 60,
                      // Display Sitter's profile picture here
                    ),
                    const SizedBox(height: 20),
                    Text(
                      sitterSnap['name'], // Replace with actual data
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      sitterSnap['place'], // Replace with actual data
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      sitterSnap['phone'], // Replace with actual data
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      sitterSnap['details'], // Replace with actual data
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      sitterSnap['title'], // Replace with actual data
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      sitterSnap['email'], // Replace with actual data
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ));
          }),
    );
  }
}
