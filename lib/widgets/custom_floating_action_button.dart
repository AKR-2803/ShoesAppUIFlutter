import 'package:flutter/material.dart';
import 'package:myshoesapp/ui_helper/helper_functions.dart';

Widget myCustomFloatingActionButton = FloatingActionButton(
  onPressed: () {},
  backgroundColor:  HelperFunctions().myOrange,
  child: const Icon(
    Icons.home_filled,
    color: Colors.white,
    size: 35,
  ),
);
