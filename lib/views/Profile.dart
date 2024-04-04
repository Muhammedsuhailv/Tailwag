import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mainproject/views/profile%20edit.dart';
import 'package:shimmer/shimmer.dart';

import '../controller/BackendServices.dart';


class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  BackendServiecs backendServiecs = BackendServiecs();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("F2DFB2"),
      appBar: AppBar(
        backgroundColor: HexColor("BFA05A"),
        leading: Padding(
          padding: const EdgeInsets.only(left: 23.0),
          child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: HexColor("7A5600"),
              )),
        ),
        title: Image.asset(
          "img/Tailwag.png",
          width: 91,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings, color: HexColor("7A5600")),
          ),
          const SizedBox(
            width: 23,
          )
        ],
      ),
      body: FutureBuilder(
        future: backendServiecs.fetchUserData(),
        builder: (context, snapshot) {

          return snapshot.connectionState== ConnectionState.waiting
              ?  Center(
            child: CircularProgressIndicator(),
          )
              : SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Container(
                  height: 350,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: HexColor("BFA05A"),
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(49),
                          bottomRight: Radius.circular(49))),
                  child:  Column(
                    children: [
                      SizedBox(
                        height: 4,
                      ),
                 snapshot.connectionState == ConnectionState.waiting
            ? Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.white,
            ),
          ),
          )
              :CircleAvatar(
                        radius: 59,
                        backgroundImage: NetworkImage(backendServiecs.usermodel.image!),
                      ),

                    ],
                  ),
                ),
                Align(alignment: Alignment.center,
                  child: Container(
                    height: 390,
                    width: 320,
                    decoration: BoxDecoration(
                        color: HexColor("F2DFB2"),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 19,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              backendServiecs.usermodel.petname!,
                              style: TextStyle(
                                  fontFamily: 'AbhayaLibre',
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: HexColor('#7A5600'),
                                  letterSpacing: 1),
                            ),
                            IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            Editprofile(),
                                      )).then((result) {
                                    if(result != null && result){
                                      print('///////////REBUILDING//////////');
                                      setState(() {

                                      });
                                    }
                                  });
                                },
                                icon: Icon(
                                  Icons.edit,
                                  color: HexColor('#7A5600'),
                                ))
                          ],
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Card(
                              child: Container(
                                height: 64,
                                width: 79,
                                decoration: BoxDecoration(
                                    color: HexColor("BFA05A"),
                                    borderRadius: BorderRadius.circular(10)),
                                alignment: Alignment.center,
                                child: Text(
                                  backendServiecs.usermodel.petsex!,
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: HexColor('#7A5600'),
                                  ),
                                ),
                              ),
                            ),
                            Card(
                                child: Container(
                              height: 64,
                              width: 79,
                              decoration: BoxDecoration(
                                  color: HexColor("BFA05A"),
                                  borderRadius: BorderRadius.circular(10)),
                              alignment: Alignment.center,
                              child: Text(
                                backendServiecs.usermodel.petage!,
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: HexColor('#7A5600')),
                              ),
                            )),
                            Card(
                                child: Container(
                              height: 64,
                              width: 79,
                              decoration: BoxDecoration(
                                  color: HexColor("BFA05A"),
                                  borderRadius: BorderRadius.circular(10)),
                              alignment: Alignment.center,
                              child: Text(
                                backendServiecs.usermodel.petkg!,
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: HexColor('#7A5600')),
                              ),
                            )),
                          ],
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 10),
                          child: Card(
                              color: HexColor("BFA05A"),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: HexColor("BFA05A"),
                                ),
                                child: ListTile(
                                  leading: const CircleAvatar(
                                    backgroundImage:
                                        AssetImage("img/images.jpeg"),
                                  ),
                                  title: Text(
                                  backendServiecs.usermodel.username,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text(
                                    backendServiecs.usermodel.email,
                                    style: TextStyle(color: HexColor('#7A5600')),
                                  ),
                                  trailing: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.edit,
                                        color: HexColor('#7A5600'),
                                      )),
                                ),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 168.0),
                          child: Text(
                            "About my pet",
                            style: TextStyle(
                                fontFamily: 'AbhayaLibre',
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: HexColor('#7A5600')),
                          ),
                        ),
                        Card(
                          color: HexColor("BFA05A"),
                          child: Container(
                            height: 80,
                            width: 284,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: HexColor("BFA05A"),
                            ),
                            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(backendServiecs.usermodel.aboutmypet!,
                                    style: TextStyle(color: HexColor('#7A5600')),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        }
      ),
    );
  }
}
