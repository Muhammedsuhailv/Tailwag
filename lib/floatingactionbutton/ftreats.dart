import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mainproject/floatingactionbutton/fooddetail.dart';
import 'package:mainproject/floatingactionbutton/foodlist.dart';
class Ftreats extends StatefulWidget {
  const Ftreats({Key? key}) : super(key: key);

  @override
  State<Ftreats> createState() => _FtreatsState();
}

class _FtreatsState extends State<Ftreats> {
  var search =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(backgroundColor:HexColor("F2DFB2") ,leading: IconButton(onPressed: () {
      Navigator.pop(context);
    }, icon: Icon(Icons.arrow_back_ios_new_outlined,color:HexColor("7A5600") ,)),title: Text("Foods",style: TextStyle(fontWeight:FontWeight.bold ,color: HexColor("7A5600")),),centerTitle: true),
        body:Container(height: double.infinity,width: double.infinity,color:HexColor("F2DFB2"),child: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(height: 25,),
            SizedBox(height: 45,width: 310,
              child: TextField(controller: search,
                decoration: InputDecoration(prefixIcon: const Icon(Icons.search_rounded,color: Colors.grey,),hintText: "Search shop,etc",hintStyle: const TextStyle(color: Colors.grey,fontSize: 13),suffixIcon: const Icon(Icons.filter_list,color: Colors.grey,),filled: true,fillColor: Colors.white,enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide.none),focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide.none)),

              ),

            ),
            const SizedBox(height: 15,),
            SizedBox(height: 4300,
              child: GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 0.7,crossAxisSpacing: 0.0 ,mainAxisSpacing: 13),physics: const NeverScrollableScrollPhysics(),itemCount:foodi.length, itemBuilder: (context,index){
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
                            Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(img:foodi[index]['img'],text:  foodi[index]['text'],sub:foodi[index]['sub'],pri:foodi[index]['pri'], per: foodi[index]['per'], bra: foodi[index]['bra'], fla: foodi[index]['fla'],),));

                          },
                            child: SizedBox(
                              width: 150,
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    foodi[index]['text'],
                                    style: TextStyle(
                                        color: HexColor("604401"),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(foodi[index]['sub']),
                                  Row(
                                    children: [
                                      const Text("MRP :",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w900,
                                          )),
                                      // Text(Top[index]['pri'],style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900,decoration: TextDecoration.lineThrough),),
                                      Text(
                                        foodi[index]['pri'],
                                        style: const TextStyle(
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
                                                const BorderRadius.only(
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
                                                const BorderRadius.only(
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
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Container(
                            height: 120,
                            width: 120,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.contain,
                                    image: foodi[index]['img'])),
                          ),
                        )
                      ],
                    ),
                  ],
                );
              }),
            ),
            const SizedBox(height: 15,),


          ],),
        ),)
    );
  }
}
