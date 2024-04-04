import 'dart:io';

import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mainproject/views/sitter/sitter-login.dart';

import '../../controller/sittercontroller.dart';


class SitterSignup extends StatefulWidget {
  const SitterSignup({super.key});

  @override
  State<SitterSignup> createState() => _SitterSignupState();
}

class _SitterSignupState extends State<SitterSignup> {
  @override
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var name = TextEditingController();
  var place = TextEditingController();
  var phone = TextEditingController();
  var email = TextEditingController();
  var password = TextEditingController();
  var cnmpassword = TextEditingController();
  var title = TextEditingController();
  var details = TextEditingController();
  Country selectedCountry = Country(
    phoneCode: "91",
    countryCode: "IN",
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: "India",
    example: 'India',
    displayName: 'India',
    displayNameNoCountryCode: "IN",
    e164Key: "",
  );
  SitterCtl sitterCtl = SitterCtl();
  File? _image;
  Future<void> _pickImage(ImageSource source) async {
    final pickedImage = await ImagePicker().pickImage(source: source);
    setState(() {
      if (pickedImage != null) {
        _image = File(pickedImage.path);
      } else {
        _image = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: HexColor("F2DFB2"),
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, top: 15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new_sharp,
                      ),
                    ),
                    Image.asset(
                      'img/logo_brown.png',
                      scale: 2,
                    ),
                    const SizedBox(
                      height: 20,
                      width: 50,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        _image == null
                            ? Stack(
                                children: [
                                  CircleAvatar(
                                    radius: 50,
                                    child: Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: IconButton(
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStatePropertyAll(
                                                    HexColor("54E70F"))),
                                        onPressed: () =>
                                            _pickImage(ImageSource.gallery),
                                        icon: const Icon(
                                          Icons.edit,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : Stack(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.cyan,
                                    radius: 50,
                                    child: ClipOval(
                                      child: Container(
                                        height: 105,
                                        width: 105,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(104),
                                        ),
                                        child: Image.file(_image!,
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: IconButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                                  HexColor("54E70F"))),
                                      onPressed: () =>
                                          _pickImage(ImageSource.gallery),
                                      icon: const Icon(
                                        Icons.edit,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          textCapitalization: TextCapitalization.words,
                          controller: name,
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
                            hintText: 'Name',
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
                          textCapitalization: TextCapitalization.words,
                          controller: place,
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
                            hintText: 'Place',
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
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: phone,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return '*this field is required';
                                  } else {
                                    return null;
                                  }
                                },
                                decoration: InputDecoration(
                                  prefixIcon: Container(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                      onTap: () {
                                        print(
                                            "${selectedCountry.flagEmoji} + ${selectedCountry.phoneCode}");
                                      },
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "${selectedCountry.flagEmoji} + ${selectedCountry.phoneCode}",
                                            style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  filled: true,
                                  fillColor: HexColor("F2DFB2"),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                    borderSide:
                                        BorderSide(color: HexColor("7A5600")),
                                  ),
                                  hintStyle: TextStyle(
                                    color: HexColor("7A5600"),
                                    fontFamily: 'AbhayaLibre_regular',
                                    fontWeight: FontWeight.w600,
                                  ),
                                  hintText: 'Phone',
                                  border: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                    borderSide:
                                        BorderSide(color: HexColor("7A5600")),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: email,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return '*this field is required';
                                  } else {
                                    return null;
                                  }
                                },
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.mail_outline_rounded),
                                  filled: true,
                                  fillColor: HexColor("F2DFB2"),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                    borderSide:
                                        BorderSide(color: HexColor("7A5600")),
                                  ),
                                  hintStyle: TextStyle(
                                    color: HexColor("7A5600"),
                                    fontFamily: 'AbhayaLibre_regular',
                                    fontWeight: FontWeight.w600,
                                  ),
                                  hintText: 'Email',
                                  border: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                    borderSide:
                                        BorderSide(color: HexColor("7A5600")),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: password,
                          obscureText: true,
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
                            hintText: 'Password',
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
                          controller: cnmpassword,
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '*this field is required';
                            } else if (value != password.text) {
                              return 'Password did not match';
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
                            hintText: 'Confirm Password',
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
                          textCapitalization: TextCapitalization.words,
                          controller: title,
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
                            hintText: 'Title',
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
                          textCapitalization: TextCapitalization.sentences,
                          controller: details,
                          maxLines: 5,
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
                            hintText: 'Details',
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
                        SizedBox(
                          width: width * 0.7,
                          height: 45,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              overlayColor:
                                  MaterialStateProperty.all(const Color(0xFFBFA05A)),
                              backgroundColor:
                                  MaterialStateProperty.all(HexColor("7A5600")),
                            ),
                            
                            
                            
                            onPressed: () {
                              sitterCtl.uploadImage(_image!);
                              sitterCtl.signUpSitter(
                                  name.text,
                                  place.text,
                                  password.text,
                                  phone.text,
                                  email.text,
                                  title.text,
                                  details.text,
                                  _image!, // Pass the image URL
                                  context);
                              if (_formKey.currentState!.validate()) {
                                // Form is valid, process the data
                                // Add your sign-up logic here
                              }
                            },
                            child: const Text(
                              'Sign up',
                              style: TextStyle(
                                fontFamily: 'AbhayaLibre_regular',
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Already have an account?',
                              style: TextStyle(
                                color: Color(0xFFBFA05A),
                                fontFamily: 'AbhayaLibre_regular',
                                fontSize: 15,
                              ),
                            ),
                            TextButton(
                              style: ButtonStyle(
                                overlayColor: MaterialStateProperty.all(
                                    const Color(0xFFBFA05A)),
                              ),
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>  SitterLogin(),
                                  ),
                                );
                              },
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  color: HexColor("7A5600"),
                                  fontFamily: 'AbhayaLibre',
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
