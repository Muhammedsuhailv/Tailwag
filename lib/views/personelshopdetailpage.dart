import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class spdetail extends StatefulWidget {
  spdetail(
      {super.key, required this.image, required this.title, required this.rat});
  var image, title, rat;
  @override
  State<spdetail> createState() => _spdetailState();
}

class _spdetailState extends State<spdetail> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: HexColor("F2DFB2"),
          body: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 445.0, left: 10),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 268.0),
                        child: Text(
                          "Services",
                          style: TextStyle(
                              color: HexColor("7A5600"),
                              fontWeight: FontWeight.bold),
                        ),
                      ),

                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 95,
                            width: 110,
                            decoration: BoxDecoration(
                                color: HexColor("EC713C"),
                                borderRadius: BorderRadius.circular(5),
                                image: const DecorationImage(
                                    image: AssetImage("img/catfood.png"))),
                          ),
                          Container(
                            height: 95,
                            width: 110,
                            decoration: BoxDecoration(
                                color: HexColor("EC713C"),
                                borderRadius: BorderRadius.circular(5),
                                image: const DecorationImage(
                                    image: AssetImage("img/dog.png"))),
                          ),
                          Container(
                            height: 95,
                            width: 110,
                            decoration: BoxDecoration(
                                color: HexColor("EC713C"),
                                borderRadius: BorderRadius.circular(5),
                                image: const DecorationImage(
                                    image: AssetImage("img/assecdog.png"))),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 7,
                      ),
//
                    ],
                  ),
                ),
                Container(
                  height: 290,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.black54,
                      image: DecorationImage(
                          fit: BoxFit.cover, image: widget.image)),
                  child: Container(
                    color: Colors.black45,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                                padding: const EdgeInsets.only(left: 13.0),
                                child: IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: const Icon(
                                      Icons.arrow_circle_left_outlined,
                                      color: Colors.white,
                                    ))),
                            const Padding(
                              padding: EdgeInsets.only(right: 14.0),
                              child: Icon(
                                Icons.notifications_sharp,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 95.0, right: 145),
                          child: Column(
                            children: [
                              Text(
                                widget.title,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 32,
                                    fontStyle: FontStyle.italic),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(right: 34.0),
                                child: Text(
                                  'Perfect partner',
                                  style: TextStyle(
                                      color: Colors.white70, fontSize: 19),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                    top: 233,
                    child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Container(
                          margin: const EdgeInsets.only(left: 5, right: 5),
                          height: 200,
                          width: 340,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Details",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: HexColor("7A5600")),
                                ),
                                const Text(
                                  "Shih Tzus make a great addition to any family.  as well as their small size, making them perfect for cuddling up with family ",
                                  style: TextStyle(color: Colors.black),
                                ),
                                const Row(
                                  children: [
                                    Text(
                                      " members of all ages.. ",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    Text(
                                      " Read more",
                                      style: TextStyle(color: Colors.redAccent),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 19,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: 35,
                                      width: 45,
                                      decoration: BoxDecoration(
                                          color: HexColor("F2DFB2"),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Icon(
                                        Icons.location_on_outlined,
                                        color: HexColor("7A5600"),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        "perinthalmanna",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: HexColor("7A5600")),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 40.0),
                                      child: Container(
                                          height: 35,
                                          width: 45,
                                          decoration: BoxDecoration(
                                              color: HexColor("F2DFB2"),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Icon(
                                            Icons.star_outline_sharp,
                                            color: HexColor("7A5600"),
                                          )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Column(
                                        children: [
                                          Text(
                                            widget.rat,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: HexColor("7A5600")),
                                          ),
                                          Text(
                                            "Ratings",
                                            style: TextStyle(
                                                color: HexColor("7A5600"),
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ))),
              ],
            ),
          )),
    );
  }
}
