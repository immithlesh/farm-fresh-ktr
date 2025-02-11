import 'dart:io';

import 'package:farm_fresh/controller/auth_controller.dart';
import 'package:farm_fresh/theme/app_color.dart';
import 'package:farm_fresh/utils/common_toolbar.dart';
import 'package:farm_fresh/utils/extension.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

import '../generated/assets.dart';
import '../l10n/locale_keys.g.dart';

class VerifyOtpPage extends StatelessWidget {
  AuthController authController = Get.find();
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      constraints: BoxConstraints.tight(Size(50, 50)),
      width: 10.rs(),
      height: 10.rs(),
      margin: EdgeInsets.only(left: 1.rs()),
      textStyle: TextStyle(
          fontSize: 4.rs(), color: appColor, fontWeight: FontWeight.w500),
      decoration: BoxDecoration(
        border: Border.all(color: whiteColor),
        borderRadius: BorderRadius.circular(10),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: appColor),
      color: whiteColor,
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: whiteColor,
      ),
    );
    return SafeArea(
      top: false,
      bottom: Platform.isAndroid ? true : false,
      child: Scaffold(
        backgroundColor: appBackgroundColor,
        appBar: CommonToolbar(
          title: LocaleKeys.verifyOtp,
          onBack: () {
            authController.isLoadingVerifyBtn.value = false;
            Get.back();
          },
        ),
        body: GetBuilder<AuthController>(builder: (controller) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                10.rs().H(),
                Center(
                    child: Image.asset(
                  Assets.messageOtpIcon,
                  width: 30.rs(),
                  height: 30.rs(),
                  color: appColor,
                )),
                10.rs().H(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.rs()),
                  child: (LocaleKeys.enterTheOtp.tr +
                          " +91${controller.phoneControllerLogin.text}")
                      .appCommonText(
                          color: darkViewGray,
                          size: 3.5.rs(),
                          weight: FontWeight.w400),
                ),
                10.rs().H(),
                Pinput(
                  length: 6,
                  defaultPinTheme: submittedPinTheme,
                  focusedPinTheme: focusedPinTheme,
                  submittedPinTheme: submittedPinTheme,
                  pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                  showCursor: true,
                  onChanged: (value) {
                    controller.pinValue.value = value;
                    printData(tittle: "pindata", val: value);
                    if (controller.pinValue.value.length < 6) {
                      controller.isPinComplete.value = false;
                    } else {
                      controller.isPinComplete.value = true;
                    }
                    controller.update();
                  },
                ),
                20.rs().H(),
                Container(
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.rs()),
                    child: ElevatedButton(
                      onPressed: () {
                        if (controller.isLoadingVerifyBtn.value == false) {
                          controller.isLoadingVerifyBtn.value = true;
                          controller.signInWithPhoneNumber();
                          controller.update();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: appColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                      child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 3.rs(), vertical: 3.5.rs()),
                          child: controller.isLoadingVerifyBtn.value == true
                              ? SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: whiteColor,
                                  ),
                                )
                              : LocaleKeys.verify.appCommonText(
                                  color: whiteColor,
                                  size: 3.rs(),
                                  weight: FontWeight.w700)),
                    ),
                  ),
                ),
                5.rs().H(),
                RichText(
                    text: TextSpan(
                        text: "Didn't get the OTP? ",
                        style: GoogleFonts.sora(
                            color: darkViewGray,
                            fontSize: 3.rs(),
                            fontWeight: FontWeight.w300),
                        children: [
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            controller.verifyPhoneNumber(context);
                          },
                        text: "Resend",
                        style: GoogleFonts.sora(
                            color: blackTextColor,
                            decoration: TextDecoration.underline,
                            fontSize: 3.5.rs(),
                            fontWeight: FontWeight.w500),
                      )
                    ]))
              ],
            ),
          );
        }),
      ),
    );
  }
}
