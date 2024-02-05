import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mainproject/care/medicarelist.dart';
import 'package:mainproject/care/recorddata.dart';
import 'package:mainproject/care/recordlist.dart';

import '../widgetmodels/simmereffect.dart';
class medicaree extends StatefulWidget {
  const medicaree({Key? key}) : super(key: key);

  @override
  State<medicaree> createState() => _medicareeState();
}

class _medicareeState extends State<medicaree> {
  final CollectionReference admins = FirebaseFirestore.instance.collection('admins').doc(FirebaseAuth.instance.currentUser!.uid).collection('pharmacy');

  var _search =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: HexColor("F2DFB2"),appBar: AppBar(   backgroundColor: HexColor("F2DFB2"),leading: Padding(
      padding: const EdgeInsets.only(left: 23.0),
      child: IconButton(onPressed: () {
        Navigator.pop(context);
      }, icon: Icon(Icons.arrow_back_ios_new_rounded,color: HexColor("7A5600"),)),
    ), title: Image.asset("img/Tailwag.png",width: 91,),centerTitle: true,actions: [
      Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: CircleAvatar(radius: 26,backgroundImage:AssetImage("img/cattt.jpg")),),
      SizedBox(width: 23,)],),
      body: Container(height: MediaQuery.of(context).size.height,width: MediaQuery.of(context).size.width,child: SingleChildScrollView(
        child: Column(children: [
          // SizedBox(height: 25,),
          // Padding(
          //   padding: const EdgeInsets.only(top: 8.0,bottom: 10),
          //   child: Container(height: 45,width: 310,
          //     child: TextField(controller: search,
          //       decoration: InputDecoration(prefixIcon: Icon(Icons.search_rounded,color: Colors.grey,),hintText: "Search menu,etc",hintStyle: TextStyle(color: Colors.grey,fontSize: 13),suffixIcon: Icon(Icons.filter_list,color: Colors.grey,),filled: true,fillColor: Colors.white,enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide.none),focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide.none)),
          //
          //     ),
          //
          //   ),
          // ),
          // SizedBox(height: 0,),
          SizedBox(height: 25,),
          Container(height: 45,width: 310,
            child: CupertinoSearchTextField(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              backgroundColor: Colors.white,
              placeholder: 'Search shop, sitters or etc',
              placeholderStyle:
              TextStyle(fontSize: 15, color: Colors.grey),
            ),

          ),
          SizedBox(height: 29,),

          Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [   Text("Top pharmacy Products",style: TextStyle(color: HexColor("604401"),                            fontFamily: 'SofiaPro',
                fontSize: 15,fontWeight: FontWeight.w700),),
              SizedBox(width: 25,),
              Text("See all",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w900),),

            ],
          ),
          SizedBox(height: 10,),

          SizedBox(height: 820,width: 997,
              child: GridView.builder(
                  itemCount: medi.length,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 0.7,crossAxisSpacing: 0.0 ,mainAxisSpacing: 13),itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.only(left: 8,right: 5),
                  child: Card(color:  HexColor("F2DFB2"),
                    child: Column(
                      children: [
                        Card(elevation: 3,
                          shadowColor: Colors.grey,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          child: Container(
                            height: 106.7,
                            width: 245,
                            decoration: BoxDecoration(color:  HexColor("F2DFB2"),borderRadius: BorderRadius.only(topRight: Radius.circular(14),topLeft: Radius.circular(14),),
                              image:DecorationImage(fit: BoxFit.cover,image: medi[index]['img']),
                            ),
                          ),
                        ),

                        Container(
                          width: 258,
                          height:110,
                          decoration: BoxDecoration(

                              borderRadius: BorderRadius.only(bottomRight: Radius.circular(16),bottomLeft: Radius.circular(16))),
                          child:Padding(
                            padding: const EdgeInsets.only(left: 8.6),
                            child:



                            Column(

                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 5,),

                               Text(   medi[index]['tname'],style: TextStyle(color: HexColor("7A5600"),fontWeight: FontWeight.bold),),
                                  SizedBox(height: 5,),

                                  Text(medi[index]['rat'],style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),),
                                ]),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.only(left: 15.0,right: 15),
            child:   Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [

                Text("Top pharmacy",style: TextStyle(color: HexColor("604401"),                            fontFamily: 'SofiaPro',
                    fontWeight: FontWeight.bold,fontSize: 16),),



                Text("See all",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w600),)

              ],

            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: SizedBox(
              height: 859,
              child: StreamBuilder<Object>(
                  stream: admins.snapshots(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data.docs.length,
                        itemBuilder: (context, index) {

                          return  Padding(
                            padding: const EdgeInsets.only(left: 8.0,top: 8),
                            child: Row(
                              children: [
                                Card(
                                    child: Container(
                                        height: 100,
                                        width: 120,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: AssetImage("img/just dogs.jpeg")),
                                            color: Colors.black12,
                                            borderRadius: BorderRadius.circular(10)))),
                                Column(crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10,top: 10),
                                      child: Text(
                                        snapshot.data.docs[index]['PharmacieName'],
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: HexColor("7A5600")),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10.0,top: 10),
                                      child: Text(

                                        snapshot.data.docs[index]['PharmacieLocation'],                                        style: TextStyle(color: Colors.grey),        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10.0,top: 10),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.star_rate_rounded,
                                            color: Colors.orange,
                                          ),
                                          Text(
                                            "3.0",
                                            style: TextStyle(color: Colors.grey),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }
                    return Container();
                  }),
            ),
          )

        ]),
      ),),
    );
  }
}
