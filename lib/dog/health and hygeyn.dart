import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mainproject/dog/healthlist.dart';
import 'package:mainproject/floatingactionbutton/fooddetail.dart';
import 'package:mainproject/floatingactionbutton/foodlist.dart';
import 'package:mainproject/model.dart';

class health extends StatefulWidget {
  const health({Key? key}) : super(key: key);

  @override
  State<health> createState() => _healthState();
}

class _healthState extends State<health> {
  var search =TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(appBar: AppBar(backgroundColor:HexColor("F2DFB2") ,leading: IconButton(onPressed: () {
      Navigator.pop(context);
    }, icon: Icon(Icons.arrow_back_ios_new_outlined,color:HexColor("7A5600") ,)),title: Text("Health And Hygiene",style: TextStyle(fontWeight:FontWeight.bold ,color: HexColor("7A5600")),),centerTitle: true),
        body:Container(height: double.infinity,width: double.infinity,color:HexColor("F2DFB2"),child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(height: 25,),
            Container(height: 45,width: 310,
              child: TextField(controller: search,
                decoration: InputDecoration(prefixIcon: Icon(Icons.search_rounded,color: Colors.grey,),hintText: "Search shop,etc",hintStyle: TextStyle(color: Colors.grey,fontSize: 13),suffixIcon: Icon(Icons.filter_list,color: Colors.grey,),filled: true,fillColor: Colors.white,enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide.none),focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide.none)),

              ),

            ),

          SizedBox(height: 55,),

            //
            // SizedBox(height: 1220,width: 999,
            //   child: GridView.builder(
            //       itemCount: healthh.length,controller: new ScrollController(keepScrollOffset: false,),physics: NeverScrollableScrollPhysics(),
            //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 0.6,crossAxisSpacing: 0.0 ,mainAxisSpacing: 14),itemBuilder: (context,index){
            //     return Padding(
            //       padding: const EdgeInsets.only(left: 5,right: 5),
            //       child: Stack(
            //         children: [
            //           Container(
            //             height: 146.7,
            //             width: 245,
            //             decoration: BoxDecoration(color: Colors.white30,borderRadius: BorderRadius.only(topRight: Radius.circular(14),topLeft: Radius.circular(14),),
            //               image:DecorationImage(fit: BoxFit.cover,image:healthh[index]['image']),
            //             ),
            //           ),
            //
            //           Positioned(top: 145,
            //             child: Container(
            //               width: 258,
            //               height:150,
            //               decoration: BoxDecoration(
            //
            //                   borderRadius: BorderRadius.only(bottomRight: Radius.circular(16),bottomLeft: Radius.circular(16))),
            //               child:Padding(
            //                 padding: const EdgeInsets.only(left: 1),
            //                 child:
            //
            //
            //
            //                 Container(
            //                   child: Column(
            //
            //                       crossAxisAlignment: CrossAxisAlignment.start,
            //                       children: [
            //                         SizedBox(height: 5,),
            //
            //                         Padding(
            //                           padding: const EdgeInsets.only(left: 8.0),
            //                           child: Text(   healthh[index]['txt'],style: TextStyle(color: HexColor("7A5600"),fontWeight: FontWeight.bold),),
            //                         ),
            //                         // SizedBox(height: 5,),
            //
            //                         // Text(healthh[index]['sub'],style: TextStyle(color: Colors.grey[700],fontWeight: FontWeight.w600),),
            //
            //                         Row(
            //                           children: [
            //
            //                             Icon(Icons.star_rate_rounded,color: Colors.orange,),
            //                             Text(healthh[index]['rat'],style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900),),
            //                             Text(healthh[index]['rew'],style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400),),
            //                           ],
            //                         ),
            //                         Padding(
            //                           padding: const EdgeInsets.only(left: 8.0),
            //                           child: Row(
            //                             children: [
            //                               Text("MRP :",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900,)),
            //                               Text(healthh[index]['reg'],style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900,decoration: TextDecoration.lineThrough),),
            //                               Text(healthh[index]['pri'],style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900),),
            //
            //                             ],
            //                           ),
            //                         ),
            //                         Padding(
            //                           padding: const EdgeInsets.only(left: 8),
            //                           child: Text(healthh[index]['off'],style: TextStyle(color: Colors.grey[700],fontWeight: FontWeight.w700),),
            //                         ),
            //                       ]),
            //                 ),
            //
            //
            //               ),
            //             ),
            //           ),
            //         ],
            //       ),
            //     );
            //   }),
            // ),
            //











            SizedBox(height: 1559,width: 999,
              child: GridView.builder(
                  itemCount: healthh.length,controller: new ScrollController(keepScrollOffset: false,),
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 0.6,crossAxisSpacing: 0.0 ,mainAxisSpacing: 14),itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.only(left: 4,right: 4),
                  child:
                  Stack(
                    children: [
                      Card(elevation: 5,child: Container(height: 305,width: 165,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: HexColor("F2DFB2"),))),
                      Padding(
                        padding: const EdgeInsets.only(top: 140.0,left: 6),
                        child: Container(width: 165,
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(  healthh[index]['txt'],style: TextStyle(color: HexColor("604401"),fontWeight: FontWeight.bold),),
                              Text(healthh[index]['sub']),
                              Row(
                                children: [
                                  Text("MRP :",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900,)),
                                  Text(healthh[index]['reg'],style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900,decoration: TextDecoration.lineThrough),),
                                  Text(healthh[index]['pri'],style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900),),

                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(child: Card(elevation: 5,child: Container(height: 138,width: 165,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color:  HexColor("F2DFB2"),image: DecorationImage(fit: BoxFit.cover,image:healthh[index]['image']))))),
                      // Card(elevation: 5,child: Container(height: 80,width: 150,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.grey[800]),child: Image.asset("img/bird_fd4_drools-removebg-preview.png"),)),
                    ],
                  ),


                );
              }),
            ),
            //
            //
            // SizedBox(height: 466,width: 997,
            //   child: GridView.builder(
            //       itemCount: healthh.length,controller: new ScrollController(keepScrollOffset: false),
            //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 0.6,crossAxisSpacing: 0.0 ,mainAxisSpacing: 14),itemBuilder: (context,index){
            //     return Padding(
            //       padding: const EdgeInsets.only(left: 8,right: 5),
            //       child: Column(
            //         children: [
            //           Container(
            //             height: 126.7,
            //             width: 245,
            //             decoration: BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(14),topLeft: Radius.circular(14),),
            //               image:DecorationImage(fit: BoxFit.cover,image: healthh[index]['image']),
            //             ),
            //           ),
            //
            //           Card(
            //             child: Container(
            //               width: 258,
            //               height:89.6,
            //               decoration: BoxDecoration(
            //                   color: Colors.white24,
            //                   borderRadius: BorderRadius.only(bottomRight: Radius.circular(16),bottomLeft: Radius.circular(16))),
            //               child:Padding(
            //                 padding: const EdgeInsets.only(left: 8.6),
            //                 child:
            //
            //
            //
            //                 Column(
            //
            //                     crossAxisAlignment: CrossAxisAlignment.start,
            //                     children: [
            //                       SizedBox(height: 5,),
            //
            //                Text(       healthh[index]['txt']),
            //                       SizedBox(height: 5,),
            //
            //                       Row(
            //                         children: [
            //
            //                           Icon(Icons.star_rate_rounded,color: Colors.orange,),
            //                           Text(healthh[index]['rat'],style: TextStyle(color: Colors.grey[600]),),
            //                           Text(healthh[index]['rew'],style: TextStyle(color: Colors.grey[600]),),
            //                         ],
            //                       ),
            //
            //                       Row(
            //                         children: [
            //                           Text(healthh[index]['reg'],style: TextStyle(color: Colors.grey[600]),),
            //                           Text(healthh[index]['pri'],style: TextStyle(color: Colors.grey[600]),),
            //                           Text(healthh[index]['off'],style: TextStyle(color: Colors.grey[600]),),
            //                         ],
            //                       ),
            //                       Text(healthh[index]['inc'],style: TextStyle(color: Colors.grey[600]),),
            //
            //                     ]),
            //               ),
            //             ),
            //           ),
            //         ],
            //       ),
            //     );
            //   }),
            // ),





          ],),
        ),)
    );
  }
}

