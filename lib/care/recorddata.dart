import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mainproject/care/creatdata.dart';
import 'package:mainproject/care/recordlist.dart';
class recorddata extends StatefulWidget {
  const recorddata({Key? key}) : super(key: key);


  @override
  State<recorddata> createState() => _recorddataState();
}

class _recorddataState extends State<recorddata> {
  final CollectionReference users = FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).collection('records');
void deleteData(docId){
  users.doc(docId).delete();
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(   backgroundColor: HexColor("F2DFB2"),
      appBar: AppBar(   backgroundColor: HexColor("F2DFB2"),leading: Padding(
        padding: const EdgeInsets.only(left: 23.0),
        child: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios_new_rounded,color: HexColor("7A5600"),)),
      ), title: Image.asset("img/Tailwag.png",width: 91,),centerTitle: true,actions: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: CircleAvatar(radius: 26,backgroundImage:AssetImage("img/cattt.jpg")),),
        SizedBox(width: 23,)],),
      body: Container(height: MediaQuery.of(context).size.height,width: MediaQuery.of(context).size.width,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0,top: 10),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("My",style: TextStyle(color: HexColor("7A5600"),fontWeight: FontWeight.bold,fontSize: 25,fontFamily: 'SofiaPro',),),

                Text("Notes",style: TextStyle(color: HexColor("7A5600"),fontWeight: FontWeight.bold,fontSize: 25,fontFamily: 'SofiaPro',),),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: InkWell(
onTap: () {
  Navigator.push(context, MaterialPageRoute(builder: (context) => CreateData(),));
},
                    child: Container(height: 35,width: 85,decoration: BoxDecoration(color: HexColor("ED713C"),borderRadius: BorderRadius.circular(8)),child: Row(children: [
                    SizedBox(width: 10,),
                      Text("Create",style: TextStyle(color: Colors.white),),
                    Icon(Icons.edit_note,color: Colors.white,),
                    ],),),
                  ),
                )
              ],
            ),
          ),

          Expanded(
            child: StreamBuilder<Object>(
                stream: users.orderBy('date', descending: true).snapshots(),
              builder: (context, AsyncSnapshot  snapshot) {
                if(snapshot.hasData){
                  return ListView.builder(
                    itemCount: snapshot.data.docs.length,itemBuilder: (context, index) {
final DocumentSnapshot userSnap = snapshot.data.docs[index];
                    return Padding(
                      padding: const EdgeInsets.only(left: 8.0,right: 8,top: 8),
                      child: InkWell(onLongPress: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              backgroundColor: HexColor("F2DFB2"),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              title: const Text(
                                'Do you want to Delete?',
                                style:
                                TextStyle(fontFamily: 'SofiaPro', fontWeight: FontWeight.w600),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    'Cancel',
                                    style: TextStyle(fontSize: 17, fontFamily: "SofiaPro"),
                                  ),
                                ),
                                InkWell(
                                  onTap: ()  {
deleteData(userSnap.id);
Navigator.pop(context);

                                  },
                                  child: const Text(
                                    'Delete',
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.red, fontFamily: "SofiaPro"),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                        child: Container(
                          width: 90,height: 90,decoration: BoxDecoration(color: HexColor("BAA573"),borderRadius: BorderRadius.circular(10)),
                          child: Row(children: [
                            SizedBox(width: 15,),
                            CircleAvatar(radius: 35,backgroundColor: HexColor("7A5600"),child: record[index]['img'],),
                            Padding(
                              padding: const EdgeInsets.only(left: 18.0,top: 12),
                              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(userSnap['date'],style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,                                          fontFamily: 'SofiaPro',
                                  ),),
                                  Text(userSnap['discreption'],style: TextStyle(color: HexColor("604401"),fontWeight: FontWeight.w700,                                          fontFamily: 'SofiaPro',
                                  ),),
                                  Text(userSnap['hospital'],style: TextStyle(color: HexColor("604401"),fontWeight: FontWeight.w700,                                          fontFamily: 'SofiaPro',
                                  ),),


                                ],
                              ),
                            ),

                          ],),
                        ),
                      ),
                    );
                  },);
                }
                return Container();

              }
            ),
          )

        ],),
      ),

    );
  }
}
