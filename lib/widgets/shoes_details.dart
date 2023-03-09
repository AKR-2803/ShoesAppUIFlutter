import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'dart:math' as math;
import 'package:myshoesapp/ui_helper/helper_functions.dart';
import 'package:myshoesapp/widgets/custom_bottom_appbar.dart';
import 'package:myshoesapp/widgets/custom_floating_action_button.dart';
import 'package:readmore/readmore.dart';

class ShoesDetails extends StatefulWidget {
  final shoeName;
  ShoesDetails({Key? key, this.shoeName}) : super(key: key);

  @override
  _ShoesDetailsState createState() => _ShoesDetailsState();
}

class _ShoesDetailsState extends State<ShoesDetails> {
  int _currentIndexColor = 0;
  int _currentIndexSize = 0;
  int index = 0;
  List _myColorOptions = [];
  List _myColorImages = [];

  @override
  void initState() {
    super.initState();
    readColorsData();
  }

  Future<void> readColorsData() async {
    final String response =
        await rootBundle.loadString("assets/files/myshoes_colors.json");
    final data = jsonDecode(response);

    final String responseColorImages =
        await rootBundle.loadString("assets/files/color_options.json");
    final dataColorImages = jsonDecode(responseColorImages);

    setState(() {
      _myColorOptions = data["colors"];
      _myColorImages = dataColorImages["colorImages"];
      _currentIndexColor == 1 ? index = 5 : index = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // toolbarHeight: 55,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              flex: 3,
              child: PageView.builder(
                  itemCount: 5,
                  // physics: PageScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    // print("............index = $index");
                    return _currentIndexColor == 0
                        ? Image.asset(
                            _myColorImages[index]["imagePath"],
                          )
                        : Image.asset(_myColorImages[index + 5]["imagePath"],
                            colorBlendMode: BlendMode.colorDodge);
                  })

              //index   = 0 1 2 3 4 5 6 7 8 9
              //current = 0         1

              // Container(
              //   // color: Colors.green,
              //   child: Transform.rotate(
              //       angle: -math.pi / 8,
              //       child: Image.asset("assets/images/shoe_2.png")),
              // )

              ),
          Expanded(
            flex: 5,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50)),
                color: Color.fromARGB(231, 232, 231, 231),
              ),
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HelperFunctions().boxHeight15(giveHeight: 10),

                  // Text("${widget.shoeName}"),
                  Text("${widget.shoeName}",
                      style: HelperFunctions().weight500size15(
                          giveWeight: FontWeight.w900,
                          giveSize: 30,
                          giveColor: Colors.black)),
                  HelperFunctions().boxHeight15(),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow[800],
                        size: 18,
                      ),

                      Text(
                        " 5.0",
                        style: HelperFunctions().weight500size15(
                            giveColor: Colors.black, giveSize: 18),
                      ),
                      Text(
                        "(1162 Reviews)",
                        style: TextStyle(color: Colors.black54, fontSize: 18),
                      ),
                      // boxHeight15(),
                    ],
                  ),
                  HelperFunctions().boxHeight15(),
                  ReadMoreText(
                    "Nike Air Max Pro Mobile App Registration.user interface.",
                    trimLines: 2,
                    trimCollapsedText: "read more",
                    trimExpandedText: " show less",
                    textScaleFactor: 1.2,
                  ),
                  HelperFunctions().boxHeight15(),

                  Text(
                    "Select Color: ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  HelperFunctions().boxHeight15(giveHeight: 5),
                  SizedBox(
                    height: 70,
                    width: double.infinity,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _myColorOptions.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                _currentIndexColor = index;
                              });
                            },
                            child: Container(
                              height: 70,
                              margin: EdgeInsets.only(right: 8),
                              padding: EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: index == _currentIndexColor
                                      ? HelperFunctions().myOrange
                                      : Color.fromARGB(255, 173, 173, 173)),
                              child: CircleAvatar(
                                minRadius: 28,
                                backgroundImage: NetworkImage(
                                    // scale: 1.5,
                                    _myColorOptions[index]["imageURL"]),
                              ),
                            ),
                          );
                        }),
                  ),

                  HelperFunctions().boxHeight15(giveHeight: 5),
                  const Text(
                    "Size: ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),

                  SizedBox(
                    height: 70,
                    width: double.infinity,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            InkWell(
                              onTap: () => setState(() {
                                _currentIndexSize = index;
                              }),
                              child: Container(
                                height: 50,
                                width: 50,
                                // color: myOrange,
                                decoration: HelperFunctions().radiusContainer15(
                                  giveRadius: 10,
                                  giveColor: _currentIndexSize == index
                                      ? HelperFunctions().myOrange
                                      : Color.fromARGB(73, 0, 0, 0),
                                  giveWidth: 2,
                                  giveBorderColor: Colors.white70,
                                ),

                                alignment: Alignment.center,
                                child: Text(
                                  "${index + 40}",
                                  style: HelperFunctions()
                                      .weight500size15(giveSize: 15),
                                ),
                              ),
                            ),
                            HelperFunctions().boxwidth15(),
                          ],
                        );
                      },
                    ),
                  ),

                  Container(
                    height: 80,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: HelperFunctions().myBrown,
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Price",
                              style: TextStyle(
                                  color: Colors.white60, fontSize: 16),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "\₹13,799",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 22),
                            )
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: HelperFunctions().myOrange,
                            minimumSize: Size(170, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: Text("Add to Bag",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16)),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: myCustomFloatingActionButton,
      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
      bottomNavigationBar: myCustomBottomAppBar,
    );
  }
}
