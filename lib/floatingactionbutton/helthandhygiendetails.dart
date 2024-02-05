import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'foodlist.dart';
import 'helthlist.dart';

class HealthDetailPage extends StatefulWidget {
  HealthDetailPage({
    super.key,
    required this.img,
    required this.text,
    // required this.sub,
    required this.pri,
    // required this.fla, required this.bra, required this.per
  });

  var img;
  var text;
  // var sub;
  var pri;
  // var per, bra, fla;

  @override
  State<HealthDetailPage> createState() => _HealthDetailPageState();
}

class _HealthDetailPageState extends State<HealthDetailPage> {
  var pass = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("F2DFB2"),
      appBar: AppBar(
        backgroundColor: HexColor("F2DFB2"),
        leading: Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return const AlertDialog(
                      title: Text("Add to favourite"),
                      actions: [
                        Text("yes"),
                        Text("Cancel"),
                      ],
                    );
                  },
                );
              },
              child: IconButton(
                onPressed: () {
                  setState(() {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text(
                            "Add to favourite",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                "Yes",
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                            const Text("Cancel"),
                          ],
                        );
                      },
                    );
                    pass = !pass;
                  });
                },
                icon: pass
                    ? const Icon(Icons.favorite_outline_outlined)
                    : const Icon(Icons.favorite, color: Colors.red),
              ),
            ),
          ),
        ],
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 250,
                width: 250,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: widget.img,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    widget.text,
                    style: TextStyle(
                        color: HexColor("604401"), fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Gluten-free, cruelty-free & preservative-free",
                    style: TextStyle(
                        color: HexColor("3A3A3A"), fontWeight: FontWeight.bold),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 40,
                      ),
                      Text(
                        "MRP:",
                        style: TextStyle(
                            color: HexColor("636161"),
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "₹750.00:",
                        style: TextStyle(
                          color: HexColor("636161"),
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      Text(
                        widget.pri,
                        // widget.pri,
                        style: TextStyle(
                            color: HexColor("000000"),
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '15% Off',
                        style: TextStyle(
                            color: HexColor("E19B47"),
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15), // Add some space
                  Padding(
                    padding: const EdgeInsets.only(left: 35.0),
                    child: Row(
                      children: [
                        Text(
                          "Product details",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: HexColor("604401")),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  buildDetailItem("Diet Type", "veg Similarly"),
                  buildDetailItem("Age Range (Description)", "veg Similarly"),
                  buildDetailItem("Item Form", "veg Similarly"),
                  buildDetailItem("Specific Uses For Product", "veg Similarly"),
                ],
              ),

              Padding(
                padding: const EdgeInsets.only(left: 35.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 15),
                    Text(
                      "About this item",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: HexColor("604401")),
                    ),
                    const SizedBox(height: 10), // Add some space
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildBulletListItem(
                      "Complete and balanced nutrition for your adult dog"),
                  buildBulletListItem(
                      "Antioxidants, vitamins and other minerals help to maintain a healthy digestive system and strengthen joints"),
                  buildBulletListItem(
                      "Enriched with omega 3 and 6 fatty acids for healthy skin and lustrous coat"),
                  buildBulletListItem("Ideal for all breeds"),
                ],
              ),

              const SizedBox(height: 15), // Add some space

              Padding(
                padding: const EdgeInsets.only(left: 35.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Customer ratings by feature",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: HexColor("604401")),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10), // Add some space

              // Ratings by feature
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildFeatureRatingWithRatingBar("Value for money", 5.0),
                  buildFeatureRatingWithRatingBar("Flavor", 4.5),
                  buildFeatureRatingWithRatingBar("Freshness", 3.0),
                  buildFeatureRatingWithRatingBar("Scent", 4.0),
                ],
              ),
              SizedBox(
                height: 4300,
                child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.7,
                        crossAxisSpacing: 0.0,
                        mainAxisSpacing: 13),
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: fhelth.length,
                    itemBuilder: (context, index) {
                      return Column(
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
                                padding:
                                    const EdgeInsets.only(top: 130.0, left: 6),
                                child: InkWell(

                                  child: SizedBox(
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
                                            const Text("MRP :",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w900,
                                                )),
                                            Text(
                                              fhelth[index]['pri'],
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w900),
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
                                                alignment: Alignment.topRight,
                                                child: Container(
                                                  height: 60,
                                                  width: 60,
                                                  decoration: BoxDecoration(
                                                      color: HexColor("BB9D56"),
                                                      borderRadius:
                                                          const BorderRadius.only(
                                                              bottomLeft: Radius
                                                                  .circular(60),
                                                              topRight: Radius
                                                                  .circular(
                                                                      15))),
                                                )),
                                            Align(
                                                alignment: Alignment.bottomLeft,
                                                child: Container(
                                                  height: 60,
                                                  width: 60,
                                                  decoration: BoxDecoration(
                                                      color: HexColor("BB9D56"),
                                                      borderRadius:
                                                          const BorderRadius.only(
                                                              topRight: Radius
                                                                  .circular(60),
                                                              bottomLeft: Radius
                                                                  .circular(
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
                                          image: fhelth[index]['image'])),
                                ),
                              )
                            ],
                          ),
                        ],
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build detail items
  Widget buildDetailItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: 8.0), // Adjust the padding as needed
      child: Padding(
        padding: const EdgeInsets.only(left: 35.0, right: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(width: 10),
            Text(value),
          ],
        ),
      ),
    );
  }

  Widget buildBulletListItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 30),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(width: 10),
            const Icon(Icons.fiber_manual_record, size: 12),
            const SizedBox(width: 5),
            Flexible(child: Text(text)),
          ],
        ),
      ),
    );
  }

  // Helper method to build feature rating items with label
  Widget buildFeatureRatingWithLabel(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(width: 10),
          if (value.isNotEmpty) Text(value),
        ],
      ),
    );
  }

  // Helper method to build feature rating items with rating bar
  Widget buildFeatureRatingWithRatingBar(String label, double rating) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.only(left: 35.0, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(width: 10),
            RatingBar.builder(
              initialRating: rating,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 15,
              itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                // Handle rating update if needed
              },
            ),
          ],
        ),
      ),
    );
  }
}
