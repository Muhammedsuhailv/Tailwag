// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:country_picker/country_picker.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:hexcolor/hexcolor.dart';
// import 'package:mainproject/sitter/sitter-login.dart';
//
// import 'login.dart';
// import 'otpfirstscreen.dart';
//
// class Sample extends StatefulWidget {
//   const Sample({super.key});
//
//   @override
//   State<Sample> createState() => _SampleState();
// }
//
// class _SampleState extends State<Sample> {
//   @override
//   final GlobalKey<FormState> hospitalAddKey = GlobalKey<FormState>();
//   final TextEditingController ProductNameController =
//   TextEditingController();
//   final TextEditingController ProductDetailsController =
//   TextEditingController();
//   final TextEditingController ProductLocationController =
//   TextEditingController();
//   final CollectionReference admins = FirebaseFirestore.instance.collection('admins');
//
//   void addProducts(){
//     final ProductsDoc = admins.doc(FirebaseAuth.instance.currentUser!.uid);
//     final data ={
//       'ProductName' :ProductNameController.text,
//       'ProductDetails':ProductDetailsController.text,
//       'ProductLocation':ProductLocationController.text
//     };
//     ProductsDoc.collection('Product').add(data);
//   }
//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;
//
//     return Scaffold(
//       backgroundColor: HexColor("F2DFB2"),
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text(
//           'Add Product',
//           style: TextStyle(
//               color: HexColor("7A5600"),
//               fontFamily: 'AbhayaLibre',
//               fontSize: 30),
//         ),
//         backgroundColor: HexColor("F2DFB2"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
//         child: SingleChildScrollView(
//           child: Form(
//             key: hospitalAddKey,
//             child: Column(
//               children: [
//                 TextFormField(
//                   textCapitalization: TextCapitalization.words,
//                   controller: ProductNameController,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return '*this field is required';
//                     } else {
//                       return null;
//                     }
//                   },
//                   decoration: InputDecoration(
//                     fillColor: HexColor("F2DFB2"),
//                     focusedBorder: OutlineInputBorder(
//                       borderRadius: const BorderRadius.all(
//                         Radius.circular(10),
//                       ),
//                       borderSide: BorderSide(color: HexColor("7A5600")),
//                     ),
//                     hintStyle: TextStyle(
//                       color: HexColor("7A5600"),
//                       fontFamily: 'AbhayaLibre_regular',
//                       fontWeight: FontWeight.w600,
//                     ),
//                     hintText: 'Product Name',
//                     border: OutlineInputBorder(
//                       borderRadius: const BorderRadius.all(
//                         Radius.circular(10),
//                       ),
//                       borderSide: BorderSide(color: HexColor("7A5600")),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 TextFormField(
//                   maxLines: 3,
//                   textCapitalization: TextCapitalization.words,
//                   controller: ProductDetailsController,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return '*this field is required';
//                     } else {
//                       return null;
//                     }
//                   },
//                   decoration: InputDecoration(
//                     fillColor: HexColor("F2DFB2"),
//                     focusedBorder: OutlineInputBorder(
//                       borderRadius: const BorderRadius.all(
//                         Radius.circular(10),
//                       ),
//                       borderSide: BorderSide(color: HexColor("7A5600")),
//                     ),
//                     hintStyle: TextStyle(
//                       color: HexColor("7A5600"),
//                       fontFamily: 'AbhayaLibre_regular',
//                       fontWeight: FontWeight.w600,
//                     ),
//                     hintText: 'Product Details',
//                     border: OutlineInputBorder(
//                       borderRadius: const BorderRadius.all(
//                         Radius.circular(10),
//                       ),
//                       borderSide: BorderSide(color: HexColor("7A5600")),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 const ListTile(
//                   subtitle: Text("Nothing Selected"),
//                   title: Text('Product Photo'),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 TextFormField(
//                   textCapitalization: TextCapitalization.words,
//                   controller: ProductLocationController,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return '*this field is required';
//                     } else {
//                       return null;
//                     }
//                   },
//                   decoration: InputDecoration(
//                     fillColor: HexColor("F2DFB2"),
//                     focusedBorder: OutlineInputBorder(
//                       borderRadius: const BorderRadius.all(
//                         Radius.circular(10),
//                       ),
//                       borderSide: BorderSide(color: HexColor("7A5600")),
//                     ),
//                     hintStyle: TextStyle(
//                       color: HexColor("7A5600"),
//                       fontFamily: 'AbhayaLibre_regular',
//                       fontWeight: FontWeight.w600,
//                     ),
//                     hintText: 'Product Location',
//                     border: OutlineInputBorder(
//                       borderRadius: const BorderRadius.all(
//                         Radius.circular(10),
//                       ),
//                       borderSide: BorderSide(color: HexColor("7A5600")),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 40,
//                 ),
//                 SizedBox(
//                   width: width * 0.7,
//                   height: 45,
//                   child: ElevatedButton(
//                     style: ButtonStyle(
//                       overlayColor:
//                           MaterialStateProperty.all(HexColor("F2DFB2")),
//                       backgroundColor:
//                           MaterialStateProperty.all(HexColor("7A5600")),
//                     ),
//                     onPressed: () async {
//                       // Check if the form is valid
//                       if (hospitalAddKey.currentState!.validate()) {
//                         // Form is valid, proceed with adding the hospital
//                         // Additional logic for saving hospital photo and clearing fields
//                         // Close the add hospital screen
//                         print("Hospital added successfully!");
//                         Navigator.pop(context);
//                       } else {
//                         Navigator.pop(context);
//
//                         // Form is not valid, show error messages for empty fields
//                         // You can customize this part to display error messages as needed
//                         if (ProductNameController.text.isEmpty) {
//                           // Display error message for Hospital Name
//                           print("Hospital Name is required!");
//                         }
//
//                         if (ProductDetailsController.text.isEmpty) {
//                           // Display error message for Hospital Details
//                           print("Hospital Details are required!");
//                         }
//
//                         if (ProductLocationController.text.isEmpty) {
//                           // Display error message for Hospital Location
//                           print("Hospital Location is required!");
//                         }
//                       }
//                     },
//                     child: const Text(
//                       'Add',
//                       style: TextStyle(
//                         fontFamily: 'AbhayaLibre_regular',
//                         color: Colors.white,
//                         fontSize: 20,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
