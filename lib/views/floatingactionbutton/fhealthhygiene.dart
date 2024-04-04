import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';


import 'helthandhygiendetails.dart';
import 'helthlist.dart';
class fhelthhygin extends StatefulWidget {
  const fhelthhygin({Key? key}) : super(key: key);

  @override
  State<fhelthhygin> createState() => _fhelthhyginState();
}

class _fhelthhyginState extends State<fhelthhygin> {
  var search =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(backgroundColor:HexColor("F2DFB2") ,leading: IconButton(onPressed: () {
      Navigator.pop(context);
    }, icon: Icon(Icons.arrow_back_ios_new_outlined,color:HexColor("7A5600") ,)),title: Text("Health & Hygiene",style: TextStyle(fontWeight:FontWeight.bold ,color: HexColor("7A5600")),),centerTitle: true),
        body:Container(height: double.infinity,width: double.infinity,color:HexColor("F2DFB2"),child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(height: 25,),
            Container(height: 45,width: 310,
              child: TextField(controller: search,
                decoration: InputDecoration(prefixIcon: Icon(Icons.search_rounded,color: Colors.grey,),hintText: "Search shop,etc",hintStyle: TextStyle(color: Colors.grey,fontSize: 13),suffixIcon: Icon(Icons.filter_list,color: Colors.grey,),filled: true,fillColor: Colors.white,enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide.none),focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide.none)),

              ),

            ),
            SizedBox(height: 15,),




            SizedBox(height: 4300,
              child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 0.7,crossAxisSpacing: 0.0 ,mainAxisSpacing: 13),physics: NeverScrollableScrollPhysics(),itemCount:fhelth.length, itemBuilder: (context,index){
                return      Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        Container(
                            height: 240,
                            width: 155,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: HexColor("F2DFB2"),
                            )),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 130.0, left: 6),
                          child: InkWell(onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => HealthDetailPage
                              (img:fhelth[index]['image'],
                              text:  fhelth[index]['txt'],
                              // sub:fhelth[index]['sub'],
                              pri:fhelth[index]['pri'],
                              // per: fhelth[index]['per'], bra: fhelth[index]['bra'], fla: fhelth[index]['fla'],
                            ),));

                          },
                            child: Container(
                              width: 150,
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    fhelth[index]['txt'],
                                    style: TextStyle(
                                        color: HexColor("604401"),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(fhelth[index]['sub']),
                                  Row(
                                    children: [
                                      Text("MRP :",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w900,
                                          )),
                                      // Text(Top[index]['pri'],style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900,decoration: TextDecoration.lineThrough),),
                                      Text(
                                        fhelth[index]['pri'] ,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight:
                                            FontWeight.w900),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                            child: Card(
                                elevation: 5,
                                child: Container(
                                  height: 118,
                                  width: 145,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(10),
                                      color: HexColor("D8B053")),
                                  child: Stack(
                                    children: [
                                      Align(
                                          alignment:
                                          Alignment.topRight,
                                          child: Container(
                                            height: 60,
                                            width: 60,
                                            decoration: BoxDecoration(
                                                color: HexColor(
                                                    "BB9D56"),
                                                borderRadius:
                                                BorderRadius.only(
                                                    bottomLeft:
                                                    Radius.circular(
                                                        60),
                                                    topRight: Radius
                                                        .circular(
                                                        15))),
                                          )),
                                      Align(
                                          alignment:
                                          Alignment.bottomLeft,
                                          child: Container(
                                            height: 60,
                                            width: 60,
                                            decoration: BoxDecoration(
                                                color: HexColor(
                                                    "BB9D56"),
                                                borderRadius:
                                                BorderRadius.only(
                                                    topRight: Radius
                                                        .circular(
                                                        60),
                                                    bottomLeft:
                                                    Radius.circular(
                                                        15))),
                                          )),
                                    ],
                                  ),
                                ))),
                        // Card(elevation: 5,child: Container(height: 80,width: 150,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.grey[800]),child: Image.asset("img/bird_fd4_drools-removebg-preview.png"),)),
// Align(alignment: Alignment.center,child:Top[index]['img'] ,)

                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Container(
                            height: 120,
                            width: 120,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.contain,
                                    image: fhelth[index]['image'])),
                          ),
                        )
                      ],
                    ),
                  ],
                );
              }),
            ),



//
//
//             SizedBox(height: 4300,
//               child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 0.7,crossAxisSpacing: 0.0 ,mainAxisSpacing: 13),physics: NeverScrollableScrollPhysics(),itemCount:fhelth.length, itemBuilder: (context,index){
//                 return InkWell(
//                   onTap: () {
//
//                     Navigator.push(context, MaterialPageRoute(builder: (context) => detail(img:foodi[index]['img'],text:foodi[index]['text'],sub:foodi[index]['sub'],pri:foodi[index]['pri'],per:foodi[index]['%'],bra:foodi[index]['bra'],fla:foodi[index]['fla']),));
//                   },
//                   child: Card(color: HexColor("F2DFB2"),
//                     child: Padding(
//                       padding: const EdgeInsets.only(right: 1.0,left: 1,top: 1),
//                       child:
//                       Column(
//                         children: [
//                           Stack(children: [
// //
//
//                             Card(
//                               child: Container(height: 240,width: 300,color: HexColor("F2DFB2") ,child:   Column(
//                                 children: [SizedBox(height: 120,),
//                                   Text(fhelth[index]['txt'] ,style: TextStyle(fontWeight: FontWeight.bold,color: HexColor("7A5600") ),),
//                                   Text(fhelth[index]['sub'] ,style: TextStyle( ),),
//                                   Row(children: [
//                                     Text("MRP:"),
//                                     Text(fhelth[index]['pri'] ,style: TextStyle(fontWeight: FontWeight.bold),),
//                                     Text(fhelth[index]['off'] ,style: TextStyle(fontWeight: FontWeight.bold,color: HexColor("E19B47")),),
//
//
//                                   ]),
//                                 ],
//                               ),),
//                             ),
// //
//                             Card(elevation: 3,child: Container(height: 100,width:300,decoration: BoxDecoration(color:HexColor("F2DFB2"),image:DecorationImage(image: fhelth[index]['image']) ),))
//
//                           ]),
//
//
//                         ],
//                       ),),
//                   ),
//                 );
//               }),
//             ),
            SizedBox(height: 15,),


          ],),
        ),)
    );
  }
}
