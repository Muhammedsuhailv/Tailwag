import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:shimmer/shimmer.dart';

import 'addremain.dart';

class remainder extends StatefulWidget {
  const remainder({Key? key}) : super(key: key);

  @override
  State<remainder> createState() => _remainderState();
}

class _remainderState extends State<remainder> {
  DateTime _selectedValue = DateTime.now();
  DateTime todayDate = DateTime.now();
  var reminderDate = DateFormat('dd-MMM-yyyy').format(DateTime.now());
  final CollectionReference users = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('remainder');
  void deleteData(docId) {
    users.doc(docId).delete();
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
            icon: Icon(Icons.arrow_back_ios_new_rounded,
                color: HexColor("7A5600")),
          ),
        ),
        title: Image.asset("img/Tailwag.png", width: 91),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: CircleAvatar(
                radius: 26,
                backgroundImage:
                    AssetImage("img/0f262171013843bb04861e8e8ac72af7.jpg")),
          ),
          SizedBox(width: 23),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Today",
                    style: TextStyle(color: HexColor("7A5600"), fontSize: 25)),
                SizedBox(width: 105),
                Text(
                  DateFormat.yMMMMd().format(_selectedValue),
                  style: TextStyle(overflow: TextOverflow.visible),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Expanded(
                child: DatePicker(
                  DateTime.now(),
                  initialSelectedDate: DateTime.now(),
                  selectionColor: Color(0xFF7A5600),
                  selectedTextColor: Color(0xFFF2DFB2),
                  deactivatedColor: Color(0xFFBFA05A),
                  onDateChange: (selectedDate) {
                    setState(() {
                      _selectedValue = selectedDate;
                    });
                    reminderDate =
                        DateFormat('dd-MMM-yyyy').format(selectedDate);
                    print('its remainder date$reminderDate');
                  },
                ),
              ),
            ),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 151.0),
                  child: Container(
                    height: 410,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: HexColor("BAA573"),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(28),
                          topRight: Radius.circular(28)),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 65,
                          ),
                          SizedBox(
                            height: 777,
                            child: StreamBuilder(
                              stream: users
                                  .where('date',
                                      isGreaterThanOrEqualTo:
                                          Timestamp.fromDate(DateTime(
                                              _selectedValue.year,
                                              _selectedValue.month,
                                              _selectedValue.day,
                                              0,
                                              0,
                                              0)))
                                  .where('date',
                                      isLessThan: Timestamp.fromDate(DateTime(
                                          _selectedValue.year,
                                          _selectedValue.month,
                                          _selectedValue.day + 1,
                                          0,
                                          0,
                                          0)))
                                  .snapshots(),
                              builder: (context,
                                  AsyncSnapshot<QuerySnapshot> snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Shimmer.fromColors(
                                    baseColor: Colors.grey[300]!,
                                    highlightColor: Colors.grey[100]!,
                                    child: ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount:
                                          5, // Adjust the count based on your design
                                      itemBuilder: (context, index) {
                                        return Column(
                                          children: [
                                            Shimmer.fromColors(
                                              baseColor: Colors.grey[300]!,
                                              highlightColor: Colors.grey[100]!,
                                              child: Container(
                                                height: 100,
                                                width: 200,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                          ],
                                        );
                                      },
                                    ),
                                  );
                                }
                                if (!snapshot.hasData ||
                                    snapshot.data!.docs.isEmpty) {
                                  return Center(
                                    child: Text("No data available"),
                                  );
                                }
                                return ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: snapshot.data!.docs.length,
                                  itemBuilder: (context, index) {
                                    final DocumentSnapshot userSnap =
                                        snapshot.data!.docs[index];
                                    // Filter data based on the selected date
                                    DateTime userDate =
                                        (userSnap['date'] as Timestamp)
                                            .toDate();
                                    if (userDate.day == _selectedValue.day &&
                                        userDate.month ==
                                            _selectedValue.month &&
                                        userDate.year == _selectedValue.year) {
                                      return Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 50.0),
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 38.0),
                                                  child: Text(
                                                    '${userSnap['time']}: ',
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                ),
                                                SizedBox(width: 1),
                                                InkWell(
                                                  onLongPress: () {
                                                    showDialog(
                                                      context: context,
                                                      builder: (context) {
                                                        return AlertDialog(
                                                          backgroundColor:
                                                              HexColor(
                                                                  "F2DFB2"),
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                          ),
                                                          title: const Text(
                                                            'Do you want to Delete?',
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'SofiaPro',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                          ),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child: const Text(
                                                                'Cancel',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        17,
                                                                    fontFamily:
                                                                        "SofiaPro"),
                                                              ),
                                                            ),
                                                            InkWell(
                                                              onTap: () {
                                                                deleteData(
                                                                    userSnap
                                                                        .id);
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child: const Text(
                                                                'Delete',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        17,
                                                                    color: Colors
                                                                        .red,
                                                                    fontFamily:
                                                                        "SofiaPro"),
                                                              ),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                  },
                                                  child: Container(
                                                    height: 100,
                                                    width: 200,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      border: Border.all(
                                                          color: HexColor(
                                                              "FFB300")),
                                                      boxShadow: [
                                                        BoxShadow(
                                                            color: HexColor(
                                                                "FFB300"),
                                                            offset:
                                                                Offset(-3, -1)),
                                                      ],
                                                      color: HexColor("F2DFB2"),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8.0),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          SizedBox(height: 5),
                                                          Text(
                                                            userSnap['Service'],
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              fontFamily:
                                                                  'SofiaPro',
                                                              color: HexColor(
                                                                  "7A5600"),
                                                            ),
                                                          ),
                                                          SizedBox(height: 5),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    userSnap[
                                                                        'discreption'],
                                                                    style:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          'SofiaPro',
                                                                      color: HexColor(
                                                                          "7A5600"),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                      height:
                                                                          5),
                                                                  Text(
                                                                    userSnap['date']
                                                                            is Timestamp
                                                                        ? DateFormat('dd-MMM-yyyy').format((userSnap['date']
                                                                                as Timestamp)
                                                                            .toDate())
                                                                        : (userSnap['date'] ??
                                                                                '')
                                                                            .toString(),
                                                                    style:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          'SofiaPro',
                                                                      color: HexColor(
                                                                          "7A5600"),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        left:
                                                                            18.0),
                                                                child:
                                                                    IconButton(
                                                                  onPressed:
                                                                      () {},
                                                                  icon: Icon(Icons
                                                                      .notifications),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                        ],
                                      );
                                    }
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 151.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: HexColor("BAA573"),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(28),
                          topRight: Radius.circular(28)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("To take",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => addremainder(),
                                ),
                              );
                            },
                            child: Container(
                              height: 35,
                              width: 95,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: HexColor("ED713C"),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 18.0),
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text("Add",
                                      style: TextStyle(color: Colors.white)),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
