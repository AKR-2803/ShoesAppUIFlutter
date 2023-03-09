import 'package:flutter/material.dart';

class GridViewShoesBasketball extends StatefulWidget {
  const GridViewShoesBasketball({Key? key}) : super(key: key);

    @override
  _GridViewShoesBasketballState createState() =>
      _GridViewShoesBasketballState();
}

class _GridViewShoesBasketballState extends State<GridViewShoesBasketball> {
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return Card();
        });
  }
}
