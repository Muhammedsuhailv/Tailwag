import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mainproject/Profile.dart';
import 'package:mainproject/care/care.dart';
import 'package:mainproject/floatingactionbutton/floatingbutton.dart';
import 'package:mainproject/shop.dart';
import 'package:mainproject/sitters.dart';
class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  var indexnum=0;
  List pot=[
 const shopix(),
    const Sitters(),
    const Trade(),
    const care(),
    const Profile()

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(height: 80,
        child: BottomNavigationBar(
          items: [const BottomNavigationBarItem(icon:  Icon(Icons.shop_two,),label: "Shop"),
          const BottomNavigationBarItem(icon:  Icon(Icons.access_time_sharp,),label: "Sitters"),
          BottomNavigationBarItem(icon:  Container(height: 45,width: 45,decoration: BoxDecoration(borderRadius: BorderRadius.circular(33),color: HexColor("7A5600")),child: Image.asset("img/puppypawpaw_prev_ui (1).png",color: Colors.white,)),label: ""),
          const BottomNavigationBarItem(icon:  Icon(Icons.pets,),label: "Care"),
          const BottomNavigationBarItem(icon:  Icon(Icons.person_pin,),label: "Profile")


        ],
          currentIndex:indexnum ,
          onTap: (int index){

            setState(() {
              indexnum=index;
            });
        },


        showUnselectedLabels: true,
        selectedItemColor: HexColor("7A5600"),
          unselectedItemColor: Colors.black26,
        ),
      ),
      body: pot.elementAt(indexnum),
    );
  }
}
