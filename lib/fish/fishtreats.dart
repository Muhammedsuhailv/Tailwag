import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mainproject/floatingactionbutton/foodlist.dart';
var _search = TextEditingController();
class fishtreats extends StatefulWidget {
  const fishtreats({Key? key}) : super(key: key);

  @override
  State<fishtreats> createState() => _fishtreatsState();
}

class _fishtreatsState extends State<fishtreats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(  backgroundColor: HexColor("F2DFB2"),    appBar: AppBar(   backgroundColor: HexColor("F2DFB2"),leading: Padding(
      padding: const EdgeInsets.only(left: 23.0),
      child: IconButton(onPressed: () {
        Navigator.pop(context);
      }, icon: Icon(Icons.arrow_back_ios_new_rounded,color: HexColor("7A5600"),)),
    ), title: Image.asset("img/Tailwag.png",width: 91,),centerTitle: true,actions: [
      Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: CircleAvatar(radius: 26,backgroundImage: AssetImage("img/fishprofile.jpg")),),
      SizedBox(width: 23,)],),
      body: Container(height: double.infinity,width: double.infinity,child: SingleChildScrollView(
        child: Column(children: [
          SizedBox(height: 25,),
          Container(height: 45,width: 310,
            child: TextField(controller: _search,
              decoration: InputDecoration(prefixIcon: Icon(Icons.search_rounded,color: Colors.grey,),hintText: "Search shop,etc",hintStyle: TextStyle(color: Colors.grey,fontSize: 13),suffixIcon: Icon(Icons.filter_list,color: Colors.grey,),filled: true,fillColor: Colors.white,enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide.none),focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide.none)),

            ),

          ),



          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  InkWell(onTap: () {

                  },child: CircleAvatar(radius: 32,backgroundColor: HexColor("86AF9F"),child: CircleAvatar(radius: 30,backgroundColor: HexColor("86AF9F"),backgroundImage: AssetImage("img/dog-bis.jpg")))),
                  Text("Biscuits\n",style: TextStyle(fontWeight: FontWeight.bold),)
                ],
              ),
              Column(children:[
                CircleAvatar(radius: 32,backgroundColor: HexColor("86AF9F"),child: CircleAvatar(radius: 30,backgroundColor: HexColor("86AF9F"),backgroundImage: AssetImage("img/uuoo.jpg"),)),
                Text("Creamy\nTreats",style: TextStyle(fontWeight: FontWeight.bold),)
              ]),

              Column(
                children: [
                  CircleAvatar(radius: 32,backgroundColor:  HexColor("86AF9F"),child: CircleAvatar(radius: 30,backgroundColor: HexColor("86AF9F"),backgroundImage: AssetImage("img/dog-food-white-stick.jpg"),)),
                  Text("Chew\nsticks",style: TextStyle(fontWeight: FontWeight.bold),)
                ],
              ),
              Column(

                children: [
                  CircleAvatar(radius: 32,backgroundColor:  HexColor("86AF9F"),child:     CircleAvatar(radius: 30,backgroundColor: HexColor("86AF9F"),backgroundImage: AssetImage("img/dogcherky.jpg"),),),
                  Text("Jerky\nTreats",style: TextStyle(fontWeight: FontWeight.bold),)
                ],
              )
            ],),
          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.only(left: 15.0,right: 15),
            child:   Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [

                Text("Shop by brands",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),



                Text("See all",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w600),)

              ],

            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Container(height: 100,width: 110,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: HexColor("070707"),image: DecorationImage(fit: BoxFit.cover,image: AssetImage("img/royal-fish-removebg-preview.png")))),

                    Text("Royal ",style: TextStyle(color: HexColor("7A5600"),fontWeight: FontWeight.bold),)

                  ],
                ),
                Column(
                  children: [
                    Container(height: 100,width: 110,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: HexColor("A7B9E9"),image: DecorationImage(fit: BoxFit.cover,image: AssetImage("img/micropellets.jpg")))),

                    Text("Micro Pellets",style: TextStyle(color: HexColor("7A5600"),fontWeight: FontWeight.bold),)
                  ],
                ),
                Column(
                  children: [
                    Container(height: 100,width: 110,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: HexColor("A7B9E9"),image: DecorationImage(fit: BoxFit.cover,image: AssetImage("img/guppyfood1.jpg")))),

                    Text("Guppy Feed",style: TextStyle(color: HexColor("7A5600"),fontWeight: FontWeight.bold),)

                  ],
                ),

              ],
            ),
          )
          ,
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(left: 15.0,right: 15),
            child:   Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [

                Text("Top picks",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),



                Text("See all",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w600),)

              ],

            ),
          ),
          SizedBox(height: 5,),
          SizedBox(height: 120,
            child:   ListView(scrollDirection: Axis.horizontal,

              children: [
                SizedBox(width: 15,),
                Container(height: 100,width: 110,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: HexColor("AF924E"),image: DecorationImage(fit: BoxFit.cover,image: AssetImage("img/fishPredator+Floating4-removebg-preview.png")))),

                SizedBox(width: 5,),
                Container(height: 100,width: 110,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: HexColor("AF924E"),image: DecorationImage(fit: BoxFit.cover,image: AssetImage("img/fishmgqli6-removebg-preview.png")))),
                SizedBox(width: 5,),
                Container(height: 100,width: 110,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color:HexColor("AF924E"),image: DecorationImage(fit: BoxFit.cover,image: AssetImage("img/fish0653662a162184f7bd6e1690ec2b0c8e5-removebg-preview.png")))),
                SizedBox(width: 5,),
                Container(height: 100,width: 110,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: HexColor("AF924E"),image: DecorationImage(fit: BoxFit.cover,image: AssetImage("img/whole__life-removebg-preview.png")))),

              ],),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Card(child: Container(height: 100,width: 120,decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.cover,image: AssetImage("img/2022-01-24.jpg")),color: Colors.black12,borderRadius: BorderRadius.circular(10)))),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 19),
                      child: Text("Puppyfort",style: TextStyle(fontWeight: FontWeight.bold,color: HexColor("7A5600")),),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: Text('Kochi,kerala',style: TextStyle(color: Colors.grey),),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(right: 14.0),
                      child:   Row(

                        children: [

                          Icon(Icons.star_rate_rounded,color: Colors.orange,),

                          Text("3.0",style: TextStyle(color: Colors.grey),)

                        ],

                      ),
                    ),

                  ],
                ),



              ],
            ),




          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Card(child: Container(height: 100,width: 120,decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.cover,image: AssetImage("img/2022-01-24.jpg")),color: Colors.black12,borderRadius: BorderRadius.circular(10)))),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 19),
                      child: Text("Puppyfort",style: TextStyle(fontWeight: FontWeight.bold,color: HexColor("7A5600")),),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: Text('Kochi,kerala',style: TextStyle(color: Colors.grey),),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(right: 14.0),
                      child:   Row(

                        children: [

                          Icon(Icons.star_rate_rounded,color: Colors.orange,),

                          Text("3.0",style: TextStyle(color: Colors.grey),)

                        ],

                      ),
                    ),

                  ],
                ),



              ],
            ),




          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(child: Container(height: 100,width: 120,decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.cover,image: AssetImage("img/11627364873059.webp")),color: Colors.black12,borderRadius: BorderRadius.circular(10)))),
              ),


              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 19),
                    child: Text("GoldenBow",style: TextStyle(fontWeight: FontWeight.bold,color: HexColor("7A5600")),),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Text('Kochi,kerala',style: TextStyle(color: Colors.grey),),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(right: 14.0),
                    child:   Row(

                      children: [

                        Icon(Icons.star_rate_rounded,color: Colors.orange,),

                        Text("4.0",style: TextStyle(color: Colors.grey),)

                      ],

                    ),
                  ),

                ],
              ),


            ],
          ),]),
      ),
      ),
    );
  }
}
