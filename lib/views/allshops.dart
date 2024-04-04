import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mainproject/views/allshoplist.dart';
import 'package:mainproject/views/personelshopdetailpage.dart';

class shops extends StatefulWidget {
  const shops({Key? key}) : super(key: key);

  @override
  State<shops> createState() => _shopsState();
}

class _shopsState extends State<shops> {
  var spsearch =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("All Shops",style: TextStyle(fontWeight: FontWeight.bold,color: HexColor("604401")),),leading: IconButton(onPressed: () {
      Navigator.pop(context);
      
    }, icon: Icon(Icons.arrow_back_ios_new_rounded,color: HexColor("604401"),)),backgroundColor: HexColor("F2DFB2"),centerTitle: true,),
    body:
    Container(height: double.infinity,width: double.infinity,color: HexColor("F2DFB2"),child: SingleChildScrollView(
    child: Column(children: [
    const SizedBox(height: 25,),
    SizedBox(height: 45,width: 310,
    child: TextField(controller: spsearch,
    decoration: InputDecoration(prefixIcon: const Icon(Icons.search_rounded,color: Colors.grey,),hintText: "Search shop,etc",hintStyle: const TextStyle(color: Colors.grey,fontSize: 13),suffixIcon: const Icon(Icons.filter_list,color: Colors.grey,),filled: true,fillColor: Colors.white,enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide.none),focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide.none)),

    ),

    ),

      const SizedBox(height: 3,),
SizedBox(height: 818,
  child:   ListView.builder(itemCount: allshop.length,itemBuilder: (context, index) {

    return InkWell(onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => spdetail(image:allshop[index]['image'],title:allshop[index]['title'],rat:allshop[index]['rat']),));
    },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(

          height: 89,width: 240,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white30, ),child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(

              children: [



                Card(elevation: 5,child: Container(height: 80,width: 110,decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.cover,image: allshop[index]['image']),color: Colors.white60,borderRadius: BorderRadius.circular(10)),)),



                Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Column(

                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child:
   Text(  allshop[index]['title'],style: const TextStyle(fontWeight: FontWeight.bold,),),),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Row(
                      children: [
                        Text(    allshop[index]['km'],style: const TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),),
                        const Icon(Icons.star_rate_rounded,color: Colors.orange,),

                        Text(   allshop[index]['rew'],style: const TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ),

                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(   allshop[index]['pet'],style: const TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),),
                      )

                    ],

                  ),
                ),



              ],

        ),
            ],
          ),







        ),
      ),
    );

  }),
),
      const Text("this is end")
  ]  ),
    ),
    ),
    );
  }
}
