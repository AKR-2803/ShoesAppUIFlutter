import 'package:flutter/material.dart';
import 'package:myshoesapp/providers/counter_provider.dart';
import 'package:provider/provider.dart';

class HelperFunctions {
  //primary theme colors
  Color myOrange = const Color.fromRGBO(237, 82, 48, 1);
  Color myBrown = const Color.fromRGBO(38, 34, 32, 1);

  //alert dialog box
  AlertDialog myAlertDialog({
    required BuildContext context,
    String? content = 'Add this item to Cart?',
    String? title = 'Add to Cart',
    String? option1 = 'Yes',
    String? option2 = 'Cancel',
    bool? showSnackBar = false,
    Color dialogColor = const Color.fromRGBO(38, 34, 32, 1),
    Color titleColor = Colors.white,
    Color contentColor = Colors.white,
    Color optionButtonColor = Colors.white,
    Color optionTextColor = const Color.fromRGBO(38, 34, 32, 1),
  }) {
    return AlertDialog(
      title: Text(
        "$title",
        style: TextStyle(fontWeight: FontWeight.w800, color: titleColor),
      ),
      content: Text(
        "$content",
        style: TextStyle(color: contentColor),
      ),
      actions: [
        ElevatedButton(
            onPressed: () {
              context.read<Counter>().increment();
              if (showSnackBar == true) {
                ScaffoldMessenger.of(context).showSnackBar(mySnackBar());
              }
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(primary: optionButtonColor),
            child: Text(
              "$option1",
              style: weight500size15(
                giveWeight: FontWeight.w800,
                giveColor: optionTextColor,
              ),
            )),
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(primary: optionButtonColor),
            child: Text(
              "$option2",
              style: weight500size15(
                giveWeight: FontWeight.w800,
                giveColor: optionTextColor,
              ),
            ))
      ],
      backgroundColor: dialogColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }

  //textstyle with weight: 500, size : 15
  TextStyle weight500size15(
      {Color? giveColor = Colors.white,
      FontWeight? giveWeight = FontWeight.w500,
      double? giveSize = 15}) {
    return TextStyle(
        fontWeight: giveWeight, fontSize: giveSize, color: giveColor);
  }

  //sizedBox with height
  SizedBox boxHeight15({double giveHeight = 15}) {
    return SizedBox(
      height: giveHeight,
    );
  }

  //sizedBox with width
  SizedBox boxwidth15({double giveWidth = 15}) {
    return SizedBox(
      width: giveWidth,
    );
  }

  //default BoxDecoration with border radius 15
  BoxDecoration radiusContainer15(
      {double giveRadius = 15,
      Color giveColor = Colors.redAccent,
      double giveWidth = 2,
      Color giveBorderColor = const Color.fromARGB(255, 173, 173, 173)}) {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(giveRadius),
        color: giveColor,
        border: Border.all(
          color: giveBorderColor,
          width: giveWidth,
        ));
  }

  //defualt snackBar
  SnackBar mySnackBar({
    double? giveSnackBarWidth,
    double giveSnackBarBorderRadius = 8,
    String giveSnackBarContent = "Set content of snackbar.",
    Color giveSnackBarContentColor = Colors.white,
    FontWeight giveSnackBarContentWeight = FontWeight.w500,
    Duration giveSnackBarDuration = const Duration(seconds: 2),
    bool wantActionInSnackBar = false,
    String giveSnackBarActionLabel = "NameThisLabel",
    Color? giveSnackBarActionTextColor = Colors.white70,
    Color? giveSnackBarActionDisabledTextColor = Colors.red,
    Key? giveKey,
  }) {
    return SnackBar(
      content: Text(giveSnackBarContent,
          style: weight500size15(
              giveColor: giveSnackBarContentColor,
              giveWeight: giveSnackBarContentWeight)),
      behavior: SnackBarBehavior.floating,
      width: giveSnackBarWidth,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          giveSnackBarBorderRadius,
        ),
      ),
      backgroundColor: HelperFunctions().myBrown,
      duration: giveSnackBarDuration,
      action: wantActionInSnackBar == true
          ? SnackBarAction(
              label: giveSnackBarActionLabel,
              textColor: giveSnackBarActionTextColor,
              disabledTextColor: giveSnackBarActionDisabledTextColor,
              onPressed: () {},
              key: giveKey,
            )
          : SnackBarAction(label: "", onPressed: () {}),
    );
  }
}
