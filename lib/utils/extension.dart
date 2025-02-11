import 'dart:developer';

import 'package:farm_fresh/controller/home_controller.dart';
import 'package:farm_fresh/pages/login_page.dart';
import 'package:farm_fresh/utils/shared_preference.dart';
import 'package:farm_fresh/utils/sizeutils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/app_color.dart';

extension MediaQueryValues on BuildContext {
  double get width => MediaQuery.of(this).size.width;

  double get height => MediaQuery.of(this).size.height;
}

extension AddSpace on num {
  Widget H() {
    return SizedBox(height: toDouble());
  }

  Widget W() {
    return SizedBox(width: toDouble());
  }
}

extension AppSize on num {
  double rs() {
    return ResponsiveText.size(toDouble());
  }
}

void printData({required dynamic tittle, dynamic val}) {
  log("$tittle:-$val");
}

double responsiveSize(BuildContext context, double size) {
  double unitHeightValue = MediaQuery.of(context).size.width * 0.01;
  return size * unitHeightValue;
  // double screenWidth = MediaQuery.of(context).size.width;
  // return (size / 375) * screenWidth; // 375 is the design width you want to base on
}

void changePageWithDelay(Widget page) {
  Future.delayed(Duration(milliseconds: 300)).then((value) => Get.to(page));
}

void replacePageWithDelay(Widget page) {
  Future.delayed(Duration(milliseconds: 300)).then((value) => Get.offAll(page));
}

Widget logoutDialog(BuildContext context) {
  return AlertDialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    actions: <Widget>[
      FractionallySizedBox(
        widthFactor: 1,
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 5.rs(), horizontal: 5.rs()),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                "Are you sure you want to log out ?".appCommonText(
                    size: 3.5.rs(),
                    color: blackTextColor,
                    weight: FontWeight.w600),
                8.rs().H(),
                GestureDetector(
                  onTap: () {
                    HomeController homeController = Get.find();
                    homeController.currentIndex.value = 0;
                    PreferenceManager.clearData();
                    PreferenceManager.setIsLogIn(false);
                    Get.offAll(LoginPage());
                  },
                  child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: appColor),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 7.5.rs(), vertical: 2.rs()),
                        child: "Log out".appCommonText(
                            size: 3.5.rs(),
                            color: whiteColor,
                            weight: FontWeight.w700),
                      )),
                ),
                2.rs().H(),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(width: .2.rs(), color: appColor),
                          color: whiteColor),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 7.5.rs(), vertical: 2.rs()),
                        child: "Cancel".appCommonText(
                            size: 3.5.rs(),
                            color: appColor,
                            weight: FontWeight.w700),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}

Widget deleteAccountDialog(BuildContext context) {
  return AlertDialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    actions: <Widget>[
      FractionallySizedBox(
        widthFactor: 1,
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 5.rs(), horizontal: 5.rs()),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                "Are you sure you want to delete your account ?".appCommonText(
                    size: 3.5.rs(),
                    color: blackTextColor,
                    weight: FontWeight.w600),
                8.rs().H(),
                GestureDetector(
                  onTap: () {
                    // homeController.deleteAccountApi(context);
                    Get.back();
                  },
                  child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: appRedColor),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 7.5.rs(), vertical: 2.rs()),
                        child: "Delete".appCommonText(
                            size: 3.5.rs(),
                            color: whiteColor,
                            weight: FontWeight.w700),
                      )),
                ),
                2.rs().H(),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(width: .2.rs(), color: appColor),
                          color: whiteColor),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 7.5.rs(), vertical: 2.rs()),
                        child: "Cancel".appCommonText(
                            size: 3.5.rs(),
                            color: appColor,
                            weight: FontWeight.w700),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}

Widget commonDialogWithYesNoDialog(
    BuildContext context,
    String message,
    String buttonPositive,
    String buttonNegative,
    VoidCallback onYes,
    VoidCallback onNo) {
  return AlertDialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    actions: <Widget>[
      FractionallySizedBox(
        widthFactor: 1,
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 5.rs(), horizontal: 5.rs()),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                message.appCommonText(
                  size: 3.5.rs(),
                  color: blackTextColor,
                  weight: FontWeight.w600,
                ),
                8.rs().H(),
                GestureDetector(
                  onTap: () {
                    onYes(); // Invoke the callback for log out
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: appColor,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 7.5.rs(),
                        vertical: 2.rs(),
                      ),
                      child: buttonPositive.appCommonText(
                        size: 3.5.rs(),
                        color: whiteColor,
                        weight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                2.rs().H(),
                GestureDetector(
                  onTap: () {
                    onNo();
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(width: .2.rs(), color: appColor),
                      color: whiteColor,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 7.5.rs(),
                        vertical: 2.rs(),
                      ),
                      child: buttonNegative.appCommonText(
                        size: 3.5.rs(),
                        color: appColor,
                        weight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}

Widget commonDialogWithOkDialog(BuildContext context, String message,
    String buttonPositive, VoidCallback onOK) {
  return AlertDialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    actions: <Widget>[
      FractionallySizedBox(
        widthFactor: 1,
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 5.rs(), horizontal: 5.rs()),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                message.appCommonText(
                  size: 3.5.rs(),
                  color: blackTextColor,
                  weight: FontWeight.w600,
                ),
                8.rs().H(),
                GestureDetector(
                  onTap: () {
                    onOK(); // Invoke the callback for log out
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: appColor,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 7.5.rs(),
                        vertical: 2.rs(),
                      ),
                      child: buttonPositive.appCommonText(
                        size: 3.5.rs(),
                        color: whiteColor,
                        weight: FontWeight.w700,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ],
  );
}

bool isHistory = false;

extension AddText on String {
  Widget appCommonText(
      {Color color = appColor,
      double size = 20,
      TextAlign align = TextAlign.center,
      FontWeight weight = FontWeight.w500,
      TextDecoration? decoration}) {
    return Text(
      this,
      style: GoogleFonts.sora(
          height: 1.5,
          fontSize: size,
          color: color,
          fontWeight: weight,
          decoration: decoration),
      textAlign: align,
    );
  }

  Widget appCommonTextSingleLine(
      {Color color = appColor,
      double size = 20,
      TextAlign align = TextAlign.center,
      FontWeight weight = FontWeight.w500,
      TextDecoration? decoration}) {
    return Text(
      this,
      overflow: TextOverflow.ellipsis,
      style: GoogleFonts.sora(
          height: 1.5,
          fontSize: size,
          color: color,
          fontWeight: weight,
          decoration: decoration),
      textAlign: align,
    );
  }

  Widget appCommonTextWithLine(
      {Color color = appColor,
      double size = 20,
      TextOverflow overflow = TextOverflow.ellipsis,
      TextAlign align = TextAlign.center,
      FontWeight weight = FontWeight.w500,
      TextDecoration? decoration}) {
    return Text(
      this,
      maxLines: 3,
      overflow: overflow,
      style: GoogleFonts.sora(
          fontSize: size,
          color: color,
          fontWeight: weight,
          decoration: decoration),
      textAlign: align,
    );
  }

  bool isValidEmail(String email) {
    final RegExp emailRegex = RegExp(
      r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$',
    );
    return emailRegex.hasMatch(email);
  }

  Widget lightText(
      {Color color = const Color(0XFF0D0D0D),
      num size = 14,
      FontWeight weight = FontWeight.w300,
      TextDecoration? decoration}) {
    return Text(
      this,
      style: defaultTextStyle(
          color: color, size: size, weight: weight, decoration: decoration),
      textAlign: TextAlign.center,
    );
  }
}

TextStyle defaultTextStyle(
    {Color color = const Color(0XFF9A9A9A),
    num size = 14,
    FontWeight weight = FontWeight.normal,
    TextDecoration? decoration}) {
  return GoogleFonts.sora(
      color: color,
      fontSize: size.toDouble(),
      fontWeight: weight,
      decoration: decoration);
}

TextStyle hintTextStyle(
    {Color color = const Color(0XFF9A9A9A),
    num size = 14,
    FontWeight weight = FontWeight.normal,
    TextDecoration? decoration}) {
  return GoogleFonts.sora(
      color: color,
      fontSize: size.toDouble(),
      fontWeight: weight,
      decoration: decoration);
}

TextStyle textFieldTextStyle(
    {Color color = const Color(0XFF0D0D0D),
    num size = 14,
    FontWeight weight = FontWeight.w500,
    TextDecoration? decoration}) {
  return GoogleFonts.sora(
      color: color,
      fontSize: size.toDouble(),
      fontWeight: weight,
      decoration: decoration);
}

String formatStringAmount(String value) {
  double parsedValue = double.tryParse(value) ?? 0.0;

  if (parsedValue == parsedValue.toInt()) {
    return parsedValue.toInt().toString();
  } else {
    return parsedValue.toStringAsFixed(2);
  }
}
