import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class addremainder extends StatefulWidget {
  const addremainder({Key? key}) : super(key: key);

  @override
  State<addremainder> createState() => _addremainderState();
}

class _addremainderState extends State<addremainder> {
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      // Check for null before assignment
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }
  TextEditingController DurationController = TextEditingController();
  TextEditingController ServiceController = TextEditingController();
  @override
  Widget build(BuildContext context) {


    void addRemainder() {
      final userDoc = FirebaseFirestore.instance.collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid);

      final data = {
        'date': _selectedDate,
        'time': _selectedTime.format(context),
        'discreption': DurationController.text,
        'Service': ServiceController.text,
      };

      userDoc.collection('remainder').add(data);
    }


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
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: CircleAvatar(
                radius: 26,
                backgroundImage:
                    AssetImage("img/0f262171013843bb04861e8e8ac72af7.jpg")),
          ),
          SizedBox(
            width: 23,
          )
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, top: 35),
              child: Text(
                "New remainder",
                style: TextStyle(
                    color: HexColor("7A5600"),
                    fontSize: 20,
                    fontFamily: 'AbhayaLibre',
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Positioned(
                top: 95,
                child: Container(
                  height: 465,
                  width: MediaQuery.of(context).size.width,
                  color: HexColor('BFA05A'),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),

                        Text(
                          "Service",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                              color: Colors.white,
                              fontFamily: 'AbhayaLibre'),
                        ),
                        SizedBox(
                          height: 15,
                        ),

                        // Container(height: 55,width: 195,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: HexColor("F2DFB2"),border: Border.all(width: 1.2,color: HexColor("604401"))),),
                        Container(
                            height: 55,
                            width: 195,
                            child: TextField(controller: ServiceController,
                              decoration: InputDecoration(
                                  hintText: "Medical checkup",
                                  hintStyle: TextStyle(
                                      fontFamily: 'AbhayaLibre_regular',
                                      color: HexColor("7A5600")),
                                  filled: true,
                                  fillColor: HexColor("F2DFB2"),
                                  focusedBorder: OutlineInputBorder(),
                                  enabledBorder: OutlineInputBorder()),
                            )),

                        SizedBox(
                          height: 15,
                        ),

                        Text(
                          "Date & Time",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                              color: Colors.white,
                              fontFamily: 'AbhayaLibre'),
                        ),
                        SizedBox(
                          height: 15,
                        ),

                        Row(
                          children: [
                            Container(
                              height: 60,
                              width: 130,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: HexColor("7A5600")),
                                  color: HexColor("F2DFB2")),
                              child: Row(
                                children: [
                                  IconButton(
                                      onPressed: () => _selectDate(context),
                                      icon: Icon(Icons.calendar_month)),
                                  Text("${_selectedDate.toLocal()}"
                                      .split(' ')[0])
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 25,
                            ),
                            // Container(height: 60,width: 130,child: TextField(decoration: InputDecoration(suffixIcon: IconButton(
                            //   onPressed: () => _selectDate(context),
                            //  icon: Icon(Icons.calendar_month)),hintText:  "${_selectedDate.toLocal()}".split(' ')[0],hintStyle:TextStyle(color: HexColor("7A5600")) ,filled: true,fillColor: HexColor("F2DFB2") ,focusedBorder: OutlineInputBorder(),enabledBorder: OutlineInputBorder()),)),
                            // SizedBox(width: 30,),
                            Container(
                              height: 60,
                              width: 130,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: HexColor("7A5600")),
                                  color: HexColor("F2DFB2")),
                              child: Row(
                                children: [
                                  IconButton(
                                      onPressed: () => _selectTime(context),
                                      icon: Icon(Icons.access_time_sharp)),
                                  Text("${_selectedTime.format(context)}")
                                ],
                              ),
                            ),
                          ],
                        ),

                        SizedBox(
                          height: 15,
                        ),

                        Text(
                          "Duration",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                              color: Colors.white,
                              fontFamily: 'AbhayaLibre'),
                        ),
                        SizedBox(
                          height: 15,
                        ),

                        Container(
                            height: 45,
                            width: 290,
                            child: TextField(controller: DurationController,
                              maxLines: 1,
                              decoration: InputDecoration(
                                  hintText: "Duration",
                                  hintStyle: TextStyle(
                                      fontFamily: 'AbhayaLibre_regular',
                                      color: HexColor("7A5600")),
                                  filled: true,
                                  fillColor: HexColor("F2DFB2"),
                                  focusedBorder: OutlineInputBorder(),
                                  enabledBorder: OutlineInputBorder()),
                            )),

                        SizedBox(
                          height: 15,
                        ),

                        Padding(
                          padding: const EdgeInsets.only(right: 28.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CircleAvatar(
                                  backgroundColor: HexColor("F2B90D"),
                                  child:
                                      Icon(Icons.three_g_mobiledata_outlined)),
                              CircleAvatar(
                                  backgroundColor: HexColor("F2B90D"),
                                  child:
                                      Icon(Icons.three_g_mobiledata_outlined)),
                              CircleAvatar(
                                  backgroundColor: HexColor("F2B90D"),
                                  child:
                                      Icon(Icons.three_g_mobiledata_outlined)),
                              CircleAvatar(
                                  backgroundColor: HexColor("F2B90D"),
                                  child:
                                      Icon(Icons.three_g_mobiledata_outlined)),
                              CircleAvatar(
                                  backgroundColor: HexColor("F2B90D"),
                                  child:
                                      Icon(Icons.three_g_mobiledata_outlined)),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 98.0),
                          child: InkWell(
                              onTap: () {
                                addRemainder();
                                Navigator.pop(context);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: HexColor("ED713C"),
                                    borderRadius: BorderRadius.circular(7)),
                                alignment: Alignment.center,
                                height: 38,
                                width: 95,
                                child: Text(
                                  "DONE",
                                  style: TextStyle(
                                      fontFamily: 'AbhayaLibre_regular',
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
