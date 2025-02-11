import 'dart:io';

import 'package:farm_fresh/controller/auth_controller.dart';
import 'package:farm_fresh/theme/app_color.dart';
import 'package:farm_fresh/utils/common_toolbar.dart';
import 'package:farm_fresh/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../generated/assets.dart';
import '../l10n/locale_keys.g.dart';
import '../theme/app_layout.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: Platform.isAndroid ? true : false,
      child: Scaffold(
        backgroundColor: appBackgroundColor,
        appBar: CommonToolbar(
          title: "",
          onBack: () => Get.back(),
        ),
        body: GetBuilder<AuthController>(builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                  child: Image.asset(
                Assets.brandingIcon,
                width: 60.rs(),
              )),
              3.rs().H(),
              LocaleKeys.loginSignup.tr.appCommonText(
                  color: blackTextColor,
                  size: 4.5.rs(),
                  weight: FontWeight.w500),
              3.rs().H(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.rs()),
                child: LocaleKeys.weWillSendTextMessageToVerify.tr
                    .appCommonText(
                        color: darkViewGray,
                        size: 3.5.rs(),
                        weight: FontWeight.w400),
              ),
              15.rs().H(),
              Container(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.rs()),
                  child: commonTextFieldWithPrefixText(
                    prefixText: "+91",
                    controller: controller.phoneControllerLogin,
                    hintText: LocaleKeys.enterPhoneNumber,
                    inputFormatters: [LengthLimitingTextInputFormatter(14)],
                    keyboardType: TextInputType.phone,
                    hintTextSize: 3.5.rs(),
                    height: 12.rs(),
                    horizontalContentPadding: 3.rs(),
                    topBoxPadding: .7.rs(),
                    weight: FontWeight.w300,
                  ),
                ),
              ),
              20.rs().H(),
              Container(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.rs()),
                  child: ElevatedButton(
                    onPressed: () {
                      if (controller.isLoadingSendBtn.value == false) {
                        controller.isLoadingSendBtn.value = true;
                        controller.verifyPhoneNumber(context);
                        controller.update();
                      }
                    },
                    child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 3.rs(), vertical: 3.5.rs()),
                        child: controller.isLoadingSendBtn.value == true
                            ? SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: whiteColor,
                                ),
                              )
                            : LocaleKeys.send.appCommonText(
                                color: whiteColor,
                                size: 3.rs(),
                                weight: FontWeight.w700)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: appColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
