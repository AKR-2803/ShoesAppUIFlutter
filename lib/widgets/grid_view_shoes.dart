import 'dart:convert';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myshoesapp/ui_helper/helper_functions.dart';
import 'shoes_details.dart';
// import 'package:practice_one/main.dart';

/*
abcdefghijklmnopsqrstuvwxyz
abcdefghijklmnopqrstuvwxyz
abcdefghijklmnopqrstuvwxyz
abcdefghjijklmnopqrstuvexyz
abcdefghijklmnopqrstuvwxyz
abcdefghijklmnopqrstuvwxyz
abcdefghijklmnopqrstuvwxyz
abcdefghijklmnopqrstuvwxyz
abcdefdghijklmnopqrstuvwxyz
abcdefghijkklmnopqrstuvwxyz
abcdefghijklmnopqrstuvwxyz
abcdefghijlklmnopqrstuvwxyz
abcdefghijklmnoopqrstuvwxyz
abcdefghijklmnopqrstuvwxyz
abcdefghijklmnopqrstuvexyz
abcdedfghijklmnopqrstuvwxyz
abdce
abcdefgjhjojkoijklmnopqrstuvwxyz
abcdefghijklmnopqrstuvwxyz
abcdefghijklmnopqrstuvwxyz


*/

class GridViewShoes extends StatefulWidget {
  int currenIndexOfCategory;
  GridViewShoes({Key? key, required this.currenIndexOfCategory})
      : super(key: key);

  @override
  _GridViewShoesState createState() => _GridViewShoesState();
}

class _GridViewShoesState extends State<GridViewShoes> {
  List _myShoes = [];
  // List categories = ["LifeStyle", "Basketball", "Running", "Football", "Women"];
  List fileNames = [
    // "assets/files/myshoes.json",
    "assets/files/myshoes_basketball.json",
    "assets/files/myshoes.json",
    // "assets/files/myshoes_basketball.json",
    "assets/files/myshoes.json",
    // "assets/files/myshoes_basketball.json",
    "assets/files/myshoes_basketball.json",
    // "assets/files/myshoes_basketball.json",
    "assets/files/myshoes.json",
    // "assets/files/myshoes.json",
  ];

  void initState() {
    super.initState();
    readShoesData();
  }

  Future<void> readShoesData() async {
    final String response =
        await rootBundle.loadString(fileNames[widget.currenIndexOfCategory]);
    final data = jsonDecode(response);

    setState(() {
      _myShoes = data["shoes"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return _myShoes.isNotEmpty
        ? Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.8,
                  mainAxisExtent: 250,
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                ),
                itemCount: _myShoes.length,
                itemBuilder: (context, index) {
                  return Card(
                    key: ValueKey(_myShoes[index]["id"]),
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ShoesDetails(
                                    shoeName: _myShoes[index]["desc"])));
                      },
                      child: Container(
                        // height: 200,
                        // width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  // border: Border.all(color: Colors.black, width: 4),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Transform.rotate(
                                    angle: -math.pi / 6,
                                    child: Image.asset(
                                      _myShoes[index]["imgPath"],
                                      alignment: Alignment.topCenter,
                                    )),
                              ),
                              Container(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          "Men's Shoes + ${widget.currenIndexOfCategory}",
                                          style: TextStyle(
                                            color: HelperFunctions().myOrange,
                                            fontWeight: FontWeight.w600,
                                          )),
                                      HelperFunctions()
                                          .boxHeight15(giveHeight: 5),
                                      Text(_myShoes[index]["desc"],
                                          style: TextStyle(
                                            fontWeight: FontWeight.w900,
                                            fontSize: 18,
                                          )),
                                      HelperFunctions()
                                          .boxHeight15(giveHeight: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("₹${_myShoes[index]["price"]}",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w900,
                                                fontSize: 17,
                                              )),
                                          InkWell(
                                            onTap: () {
                                              showDialog(
                                                  context: context,
                                                  builder: (context) =>
                                                      HelperFunctions()
                                                          .myAlertDialog(
                                                        context: context,
                                                      ));
                                            },
                                            child: CircleAvatar(
                                              backgroundColor: Colors.black,
                                              child: Icon(
                                                Icons
                                                    .add_shopping_cart_outlined,
                                                size: 20,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          )
        : Center(
            child: ElevatedButton(
                onPressed: () {
                  readShoesData();
                },
                child: Text("Nothing fetched, Check")));
  }
}
