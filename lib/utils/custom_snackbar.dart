import 'package:farm_fresh/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../theme/app_color.dart';

class CustomSnackbar {
  static void show({
    required BuildContext context,
    required String message,
    String title = "Error !",
    Color textColor = whiteColor,
    Color backgroundColor = appColor,
    IconData iconData = Icons.info_outline,
  }) {
    ScaffoldMessenger.of(context).clearSnackBars();
    final snackBar = SnackBar(
      content: Row(
        children: [
          Icon(
            iconData,
            color: textColor,
          ),
          SizedBox(width: 8),
          Expanded(
            child: message.appCommonText(
                color: textColor,
                size: 3.5.rs(),
                weight: FontWeight.w400,
                align: TextAlign.start),
          ),
        ],
      ),
      backgroundColor: backgroundColor,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

class CustomRoundedSnackbar {
  static void show({
    required BuildContext context,
    required String message,
    Color textColor = Colors.white,
    Color backgroundColor = Colors.black,
    IconData iconData = Icons.info_outline,
  }) {
    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: EdgeInsets.all(10.0),
      content: Row(
        children: [
          Icon(
            iconData,
            color: textColor,
          ),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              message,
              style: TextStyle(
                color: textColor,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: backgroundColor,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

class ShowToast {
  static void showToast({
    required BuildContext context,
    required String message,
    Color textColor = whiteColor,
    Color backgroundColor = appColor,
    IconData iconData = Icons.info_outline,
  }) {
    FToast fToast = FToast();
    fToast.init(context);
    fToast.showToast(
        child: Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      color: backgroundColor,
      child: Row(
        children: [
          SizedBox(width: 8),
          Icon(
            iconData,
            color: textColor,
          ),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              message,
              style: TextStyle(
                color: textColor,
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
