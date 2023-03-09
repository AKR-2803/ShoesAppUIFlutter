import 'package:flutter/material.dart';
import 'package:myshoesapp/ui_helper/helper_functions.dart';
import 'dart:math' as math;

class UpperContainer extends StatelessWidget {
  List<String> myImages = [
    "assets/images/upper_two.png",
    "assets/images/upper_one.png",
    "assets/images/upper_three.png"
  ];
  int giveIndex;
  UpperContainer({Key? key, required this.giveIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),

      // height: 250,
      // width: 380,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white70, width: 3),
        borderRadius: BorderRadius.circular(30),
        gradient: const LinearGradient(
          colors: [
            Color.fromRGBO(31, 30, 30, 1),
            Color.fromRGBO(219, 57, 12, 1),
            // Color.fromRGBO(154, 137, 114, 0.8),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.8, 0.3],
        ),
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(25, 8, 0, 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "New Realease",
                  style: HelperFunctions().weight500size15(),
                ),
                Text(
                  "Nike Air\nMax 90",
                  style: HelperFunctions().weight500size15(
                    giveSize: 40,
                    giveWeight: FontWeight.w900,
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Shop Now $giveIndex",
                    style: HelperFunctions().weight500size15(
                        giveWeight: FontWeight.w800, giveColor: Colors.black),
                  ),
                ),
              ],
            ),
          ),
          Transform.rotate(
              angle: -math.pi / 10, child: Image.asset(myImages[giveIndex])),
        ],
      ),
    );
  }
}
