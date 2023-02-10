import 'package:flutter/material.dart';

BoxDecoration myButtonDecoration({
  double myRadius = 8.0,
  Color myColor = const Color.fromRGBO(242, 102, 62, 1),
}) {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(8),
    color: myColor,
  );
}
