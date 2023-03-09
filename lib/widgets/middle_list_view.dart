import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myshoesapp/ui_helper/helper_functions.dart';
import 'package:myshoesapp/widgets/grid_view_shoes.dart';
// import 'package:practice_one/main.dart';

class MiddleListView extends StatefulWidget {
  const MiddleListView({Key? key}) : super(key: key);

  @override
  _MiddleListViewState createState() => _MiddleListViewState();
}

class _MiddleListViewState extends State<MiddleListView>
    with TickerProviderStateMixin {
  List _myItems = [];
  int _currentIndex = 0;

  void initState() {
    super.initState();
    readJsonData();
  }

  Future<void> readJsonData() async {
    final String response =
        await rootBundle.loadString("assets/files/items.json");
    final data = jsonDecode(response);
    setState(() {
      _myItems = data["products"];
      print("..length is : ${_myItems.length}");
    });
  }

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 5, vsync: this);

    return Column(
      children: [
        TabBar(
          controller: tabController,
          isScrollable: true,
          indicatorColor: Colors.transparent,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          tabs: [
            for (int i = 0; i < 5; i++)
              Tab(
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 70,
                      width: 140,
                      child: Card(
                        // elevation: 3,
                        color: _currentIndex == i
                            ? HelperFunctions().myOrange
                            : const Color.fromARGB(255, 241, 241, 241),
                        // margin: EdgeInsets.all(10),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.white, width: 0.5),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              maxRadius: 20.0,
                              backgroundImage:
                                  NetworkImage(_myItems[i]["imageURL"]),
                            ),
                            HelperFunctions().boxwidth15(giveWidth: 5),
                            Text(
                              _myItems[i]["name"],
                              style: TextStyle(
                                  color: _currentIndex == i
                                      ? Colors.white
                                      : Colors.black87,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                    ),
                    HelperFunctions().boxwidth15(giveWidth: 7),
                  ],
                ),
              ),
          ],
        ),
        SizedBox(
          height: 400,
          width: double.maxFinite,
          child: TabBarView(controller: tabController, children: [
            for (int i = 0; i < 5; i++)
              GridViewShoes(currenIndexOfCategory: _currentIndex),
          ]),
        ),
      ],
    );
  }
}







  // @override
  // Widget build(BuildContext context) {
  //   return _myItems.isNotEmpty
  //       ? SingleChildScrollView(
  //           child: SizedBox(
  //             height: 120,
  //             // width: 200,P
              // child: ListView.builder(
              //   shrinkWrap: true,
              //   scrollDirection: Axis.horizontal,
              //   itemCount: _myItems.length,
              //   itemBuilder: (context, int index) {
              //     return InkWell(
              //       onTap: () {
              //         setState(() {
              //           _currentIndex = index;
              //         });
              //         Navigator.push(
              //             context,
              //             MaterialPageRoute(
              //                 builder: (context) => GridViewShoes(
              //                       currenIndexOfCategory: _currentIndex,
              //                     )));
              //       },
              //       child: Padding(
              //         padding: const EdgeInsets.symmetric(horizontal: 5.0),
              //         child: Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: [
              //             SizedBox(
              //               width: 150,
              //               height: 70,
              //               child: Card(
              //                 color: _currentIndex == index
              //                     ? HelperFunctions().myOrange
              //                     : Color.fromARGB(255, 241, 241, 241),
              //                 // margin: EdgeInsets.all(10),
              //                 shape: RoundedRectangleBorder(
              //                   side: BorderSide(color: Colors.white, width: 0.5),
              //                   borderRadius: BorderRadius.circular(50),
              //                 ),
              //                 child: Row(
              //                   mainAxisAlignment: MainAxisAlignment.center,
              //                   children: [
              //                     CircleAvatar(
              //                       maxRadius: 20.0,
              //                       backgroundImage: NetworkImage(
              //                           _myItems[index]["imageURL"]),
              //                     ),
              //                     HelperFunctions().boxwidth15(giveWidth: 5),
              //                     Text(
              //                       _myItems[index]["name"],
              //                       style: TextStyle(
              //                           color: _currentIndex == index
              //                               ? Colors.white
              //                               : Colors.black87,
              //                           fontSize: 14,
              //                           fontWeight: FontWeight.w700),
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //             ),
              //             HelperFunctions().boxwidth15(giveWidth: 7),
              //           ],
              //         ),
              //       ),
              //     );
              //   },
              // ),
  // //           ),
  //         )
  //       : Center(
  //           child: ElevatedButton(
  //               onPressed: () {
  //                 readJsonData();
  //               },
  //               child: Text("Nothing fetched, Check")));
  // }