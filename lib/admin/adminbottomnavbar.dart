import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mainproject/Profile.dart';
import 'package:mainproject/admin/pharmacy/adminpharmacy.dart';
import 'package:mainproject/admin/product/admin_product.dart';
import 'package:mainproject/admin/shops/adminshops.dart';
import 'package:mainproject/care/care.dart';
import 'package:mainproject/floatingactionbutton/floatingbutton.dart';
import 'package:mainproject/shop.dart';
import 'package:mainproject/sitters.dart';

import 'admindashbord.dart';
import 'hospital/adminhospitals.dart';
class AdminBottomNavigation extends StatefulWidget {
  const AdminBottomNavigation({Key? key}) : super(key: key);

  @override
  State<AdminBottomNavigation> createState() => _AdminBottomNavigationState();
}

class _AdminBottomNavigationState extends State<AdminBottomNavigation> {
  var indexnum=0;
  List pot=[
    AdminDashboard(),
    AdminHospital(),
    AdminShops(),
    AdminPharmacy(),
    AdminProduct()

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(height: 80,
        child: BottomNavigationBar(
          items: [BottomNavigationBarItem(icon:  Icon(Icons.dashboard,),label: "Dashboard"),
            BottomNavigationBarItem(icon:  Icon(Icons.medical_services_outlined,),label: "Hospitals"),
            BottomNavigationBarItem(icon:  Icon(Icons.shopping_bag_outlined,),label: "Shops"),
            BottomNavigationBarItem(icon:  Icon(Icons.local_pharmacy_outlined,),label: "Pharmacy"),
            BottomNavigationBarItem(icon:  Icon(Icons.production_quantity_limits,),label: "Product"),


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
