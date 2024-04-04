import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mainproject/views/setttirsmodel.dart';
import 'package:mainproject/views/sitterdetails.dart';
import 'package:mainproject/views/floatingactionbutton/floatingbutton.dart';
import 'package:shimmer/shimmer.dart';
class Sitters extends StatefulWidget {
  const Sitters({Key? key}) : super(key: key);

  @override
  State<Sitters> createState() => _SittersState();
}

class _SittersState extends State<Sitters> {
  String searchText = '';
  final CollectionReference sitters =
  FirebaseFirestore.instance.collection('sitters');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("F2DFB2"),
      appBar: AppBar(
        backgroundColor: HexColor("F2DFB2"),
        leading: Padding(
          padding: const EdgeInsets.only(left: 23.0),
          child: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Trade(),
                ),
              );
            },
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: HexColor("7A5600"),
            ),
          ),
        ),
        title: Image.asset(
          "img/Tailwag.png",
          width: 91,
        ),
        centerTitle: true,
        actions:  [
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('users').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData &&
                  snapshot.data != null &&
                  snapshot.data!.docs.isNotEmpty) {
                return snapshot.connectionState == ConnectionState.waiting
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
                    :Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage:
                    NetworkImage(snapshot.data!.docs.first['image']),
                  ),
                );
              } else {
                // Return an empty SizedBox if no data is available
                return SizedBox();
              }
            },
          ),
          SizedBox(
            width: 23,
          )
        ],
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 25,
              ),
               SizedBox(
                height: 45,
                width: 310,
                child: CupertinoSearchTextField(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  backgroundColor: Colors.white,
                  placeholder: 'Search shop, sitters or etc',
                  placeholderStyle: TextStyle(fontSize: 15, color: Colors.grey),
                  onChanged: (value) {
                    setState(() {
                      searchText = value;
                    });
                  },
                ),
              ),
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 280.0, top: 10),
                    child: Image.asset("img/sitterfeet.png"),
                  ),
                  SizedBox(
                    height: 725,
                    child: RefreshIndicator(
                      onRefresh: _handleRefresh,
                      child: StreamBuilder<QuerySnapshot>(
                        stream: searchText.isEmpty
                            ? sitters.orderBy('name').snapshots()
                            : sitters
                            .where('name', isGreaterThanOrEqualTo: searchText.toLowerCase())
                            .where('name', isLessThanOrEqualTo: searchText.toLowerCase() + '\uf8ff')
                            .snapshots(), // If search text is not empty, filter sitters by name
                        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return const Center(child: CircularProgressIndicator());
                          }
                          return ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              final DocumentSnapshot sitterSnap = snapshot.data!.docs[index];
                              return Padding(
                                padding: const EdgeInsets.only(left: 10.0, top: 19),
                                child: Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => SitterDetail(
                                              img: sitterSnap['imageUrl'],
                                              nam: sitterSnap['name'],
                                              title: sitterSnap['title'],
                                              details: sitterSnap['details'],
                                              phone: sitterSnap['phone'],
                                              rat: settir[index]['rat'],
                                              pla: sitterSnap['place'],
                                            ),
                                          ),
                                        );
                                      },
                                      child: SizedBox(
                                        width: 310,
                                        child: ListTile(
                                          leading: CircleAvatar(
                                            // Display the profile image of the sitter
                                            backgroundImage: NetworkImage(sitterSnap['imageUrl']),
                                          ),
                                          title: Text(
                                            sitterSnap['name'],
                                            style: TextStyle(
                                              fontFamily: 'SofiaPro',
                                              color: HexColor("604401"),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          subtitle: Text(
                                            sitterSnap['place'],
                                            style: const TextStyle(
                                              fontFamily: 'SofiaPro',
                                            ),
                                          ),
                                          trailing: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              const Icon(
                                                Icons.star_rate_rounded,
                                                color: Colors.orange,
                                              ),
                                              Text(
                                                settir[index]['rat'],
                                                style: const TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black87,
                                                  fontFamily: 'SofiaPro',
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 0.0, top: 290),
                    child: Image.asset("img/feeeeeeeeett.png"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> _handleRefresh() async {
  await Future.delayed(const Duration(seconds: 2));
}
