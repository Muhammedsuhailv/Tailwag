import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SitterEditProfile extends StatefulWidget {
  const SitterEditProfile({Key? key}) : super(key: key);

  @override
  _SitterEditProfileState createState() => _SitterEditProfileState();
}

class _SitterEditProfileState extends State<SitterEditProfile> {
  late TextEditingController nameController;
  late TextEditingController placeController;
  late TextEditingController phoneController;
  late TextEditingController emailController;
  late TextEditingController titleController;
  late TextEditingController detailsController;

  final CollectionReference sitters =
  FirebaseFirestore.instance.collection('sitters');

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    placeController = TextEditingController();
    phoneController = TextEditingController();
    emailController = TextEditingController();
    titleController = TextEditingController();
    detailsController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    placeController.dispose();
    phoneController.dispose();
    emailController.dispose();
    titleController.dispose();
    detailsController.dispose();
    super.dispose();
  }

  void updateSitter(docId) {
    final data = {
      'name': nameController.text,
      'place': placeController.text,
      'phone': phoneController.text,
      'email': emailController.text,
      'title': titleController.text,
      'details': detailsController.text,

    };
    sitters.doc(docId).update(data);
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute
        .of(context)!
        .settings
        .arguments as Map<String, dynamic>;

    nameController.text = args['name'] ?? '';
    placeController.text = args['place'] ?? '';
    phoneController.text = args['phone'] ?? '';
    emailController.text = args['email'] ?? '';
    titleController.text = args['title'] ?? '';
    detailsController.text = args['details'] ?? '';
    final docId = args['id'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: placeController,
              decoration: InputDecoration(labelText: 'Place'),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: phoneController,
              decoration: InputDecoration(labelText: 'Phone'),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: detailsController,
              decoration: InputDecoration(labelText: 'Details'),
              maxLines: 5,
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  updateSitter(docId);
                  Navigator.pop(context);
                },
                child: const Text('Save'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}