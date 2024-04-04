import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';



class CreateData extends StatefulWidget {
  const CreateData({Key? key}) : super(key: key);

  @override
  State<CreateData> createState() => _CreateDataState();
}

class _CreateDataState extends State<CreateData> {
  TextEditingController DateController = TextEditingController();
  TextEditingController DiscreptionController = TextEditingController();
  TextEditingController HospitalController = TextEditingController();

  final CollectionReference usersCollection = FirebaseFirestore.instance.collection('users');

  void addRecord() {
    final userDoc = usersCollection.doc(FirebaseAuth.instance.currentUser!.uid);

    final data = {
      'date': DateController.text,
      'discreption': DiscreptionController.text,
      'hospital': HospitalController.text,
    };

    userDoc.collection('records').add(data);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("F2DFB2"),
      appBar: AppBar(
        backgroundColor: HexColor("F2DFB2"),
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
          SizedBox(
            width: 23,
          )
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(left: 28.0),
          child: SingleChildScrollView(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            
              SizedBox(
                height: 4,
              ),
            
              SizedBox(
                height: 36,
              ),
                Align(alignment: Alignment.centerLeft,
                  child: Text(
                    "Date",
                    style: TextStyle(
                        fontFamily: 'AbhayaLibre',
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: HexColor('#7A5600')),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              Container(
                  height: 53,
                  width: 302,
                  child: TextField(controller: DateController,
                    decoration: InputDecoration(
                        hintStyle: TextStyle(
                          color: HexColor('#7A5600'),
                          fontFamily: 'AbhayaLibre_regular',
                        ),
                        hintText: "Date",
                        fillColor: HexColor("F2DFB2"),
                        filled: true,
                        focusedBorder: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder()),
                  )),
            
                SizedBox(
                  height: 29,
                ),
            
                Container(
                    height: 150,
                    width: 302,
                    child: TextField(controller: HospitalController,
                      maxLines: 5,
                      decoration: InputDecoration(
                          hintStyle: TextStyle(
                              fontFamily: 'AbhayaLibre_regular',
                              color: HexColor('#7A5600')),
                          hintText: "description",
                          fillColor: HexColor("F2DFB2"),
                          filled: true,
                          focusedBorder: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder()),
                    )),
                SizedBox(
                  height: 29,
                ),
                Text(
                  "Hospital Name",
                  style: TextStyle(
                      fontFamily: 'AbhayaLibre',
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: HexColor('#7A5600')),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    height: 53,
                    width: 302,
                    child: TextField(controller: DiscreptionController,
                      decoration: InputDecoration(
                          hintStyle: TextStyle(
                              fontFamily: 'AbhayaLibre_regular',
                              color: HexColor('#7A5600')),
                          hintText: "Hospital",
                          fillColor: HexColor("F2DFB2"),
                          filled: true,
                          focusedBorder: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder()),
                    )),
                SizedBox(height: 20,),
                InkWell(
                    onTap: () {

                      addRecord();
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Align(alignment:Alignment.center ,
                        child: Container(
                          alignment: Alignment.center,
                          height: 34,
                          width: 90,
                          decoration: BoxDecoration(
                            border: Border.all(color: HexColor('#7A5600')),
                            color: HexColor("F2DFB2"),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            "Create",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'AbhayaLibre_regular',
                                color: HexColor('#7A5600')),
                          ),
                        ),
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
