import 'package:cached_network_image/cached_network_image.dart';
import 'package:farm_fresh/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import '../generated/assets.dart';
import 'app_color.dart';

showAppSnackBar(String tittle, {bool status = false}) {
  return Get.showSnackbar(GetSnackBar(
    // message: tittle,
    messageText: tittle.appCommonText(
        size: 18, color: blackTextColor, align: TextAlign.start),
    // messageText: tittle.wallyText(fontSize: 24, fontWeight: wallyLightWeight, color: color),
    borderRadius: 15,
    snackPosition: SnackPosition.BOTTOM,
    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    shouldIconPulse: false,
    icon: Icon(
      status ? Icons.check_circle_outline_rounded : Icons.error_outline,
      color: blackTextColor,
    ),
    backgroundColor: whiteColor,
    duration: const Duration(seconds: 3),
  ));
}

bool isEmailValid(String email) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = RegExp(pattern.toString());
  return regex.hasMatch(email);
}

bool isPhoneNumberValid(String phoneNumber) {
  final RegExp phoneRegex = RegExp(r'^[+0-9]\d*$');
  if (!phoneRegex.hasMatch(phoneNumber)) {
    return false;
  }
  final int minLength = 7;
  final int maxLength = 15;

  return phoneNumber.length >= minLength && phoneNumber.length <= maxLength;
}

bool validatePassword(String password) {
  RegExp regExp = RegExp(
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_])[A-Za-z\d\W_]{8,}$',
  );

  return regExp.hasMatch(password) && password.length >= 8;
}

bool isKeyboardOpen(BuildContext buildContext) {
  return MediaQuery.of(buildContext).viewInsets.bottom > 0;
}

SizedBox commonCachedNetworkImage(
    {required String imageUrl, required double height, required double width}) {
  return SizedBox(
    height: height,
    width: width,
    child: ClipRRect(
        borderRadius: BorderRadius.circular(300),
        child: CachedNetworkImage(
            imageUrl: imageUrl,
            imageBuilder: (context, imageProvider) => Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
            placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: Colors.white.withOpacity(0.4),
                  highlightColor: Colors.white.withOpacity(0.2),
                  enabled: true,
                  child: Container(
                    height: 80,
                    width: 80,
                    color: textGray,
                  ),
                ),
            errorWidget: (context, url, error) => ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: SizedBox(
                    height: 80,
                    width: 80,
                    child: Image.asset(Assets.appIcon,
                        fit: BoxFit.cover),
                  ),
                ))),
  );
}
