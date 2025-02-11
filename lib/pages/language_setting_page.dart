import 'dart:io';

import 'package:farm_fresh/controller/auth_controller.dart';
import 'package:farm_fresh/pages/login_page.dart';
import 'package:farm_fresh/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../generated/assets.dart';
import '../l10n/locale_keys.g.dart';
import '../theme/app_color.dart';
import '../theme/app_layout.dart';
import '../utils/common_functions.dart';
import '../utils/shared_preference.dart';

class LanguageSettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: Platform.isAndroid ? true : false,
      child: Scaffold(
          // appBar: CommonToolbar(title: LocaleKeys.settingsLanguage.tr,onBack: () => Get.back(),),
          resizeToAvoidBottomInset: false, // Add this line
          backgroundColor: appBackgroundColor,
          body: GetBuilder<AuthController>(builder: (controller) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                20.rs().H(),
                Center(
                    child: Image.asset(
                  Assets.languageSettingIcon,
                  color: appColor,
                  width: 35.rs(),
                  height: 35.rs(),
                )),
                3.rs().H(),
                LocaleKeys.language.tr.appCommonText(
                    color: blackTextColor,
                    size: 4.5.rs(),
                    weight: FontWeight.w500),
                3.rs().H(),
                LocaleKeys.selectLanguageMessage.tr.appCommonText(
                    color: darkViewGray,
                    size: 3.5.rs(),
                    weight: FontWeight.w400),
                15.rs().H(),
                GestureDetector(
                  onTap: () {
                    languageChangeBottomSheet(context);
                  },
                  child: Container(
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.rs()),
                      child: AbsorbPointer(
                        absorbing: true,
                        child: commonTextFieldWithSuffix(
                          controller: controller.languageTextController,
                          suffixIcon: Icon(
                            Icons.arrow_drop_down,
                            color: passColor,
                            size: 5.rs(),
                          ),
                          readOnly: true,
                          hintText: (PreferenceManager.getLocale() == "en")
                              ? "English"
                              : "Hindi",
                          hintTextSize: 3.5.rs(),
                          height: 12.rs(),
                          horizontalContentPadding: 3.rs(),
                          topBoxPadding: .7.rs(),
                          weight: FontWeight.w300,
                          isPasswordField: true,
                        ),
                      ),
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
                        Get.to(LoginPage());
                      },
                      child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 3.rs(), vertical: 3.5.rs()),
                          child: LocaleKeys.next.appCommonText(
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
          })),
    );
  }
}
