import 'package:farm_fresh/controller/profile_controller.dart';
import 'package:farm_fresh/utils/common_functions.dart';
import 'package:farm_fresh/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../generated/assets.dart';
import '../../../../theme/app_color.dart';
import '../../../../utils/app_webview.dart';
import '../../../../utils/common_toolbar.dart';
import '../../../../utils/loader_controller.dart';
import '../../l10n/locale_keys.g.dart';
import '../../utils/constants.dart';

class SettingPageState extends StatelessWidget {
  final LoaderController loaderController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonToolbar(
        title: LocaleKeys.settings.tr,
        onBack: () => Get.back(),
      ),
      backgroundColor: appBackgroundColor,
      body: GetBuilder<ProfileController>(builder: (controller) {
        return Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 3.rs(), vertical: 3.rs()),
                      child: Container(
                        decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(5)),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 3.rs()),
                              child: Container(
                                color: viewGray,
                                height: .20.rs(),
                              ),
                            ),
                            Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  splashColor: appBackgroundColor,
                                  onTap: () {
                                    languageChangeBottomSheet(context);
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 4.5.rs()),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsets.only(left: 3.rs()),
                                          child: Image.asset(
                                            Assets.languageIcon,
                                            width: 4.rs(),
                                          ),
                                        ),
                                        4.rs().W(),
                                        "Change Language".appCommonText(
                                            weight: FontWeight.w400,
                                            color: blackTextColor,
                                            size: 3.rs())
                                      ],
                                    ),
                                  ),
                                )),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 3.rs()),
                              child: Container(
                                color: viewGray,
                                height: .20.rs(),
                              ),
                            ),
                            Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  splashColor: appBackgroundColor,
                                  onTap: () {
                                    changePageWithDelay(WebViewWidgetApp(
                                        initialUrl: PRIVACY_URL,
                                        title: "PRIVACY POLICY"));
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 4.5.rs()),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsets.only(left: 3.rs()),
                                          child: Image.asset(
                                            Assets.privacy,
                                            width: 4.rs(),
                                          ),
                                        ),
                                        4.rs().W(),
                                        "Privacy".appCommonText(
                                            weight: FontWeight.w400,
                                            color: blackTextColor,
                                            size: 3.rs())
                                      ],
                                    ),
                                  ),
                                )),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 3.rs()),
                              child: Container(
                                color: viewGray,
                                height: .20.rs(),
                              ),
                            ),
                            Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  splashColor: appBackgroundColor,
                                  onTap: () {
                                    Get.to(WebViewWidgetApp(
                                      initialUrl: ABOUT_US_URL,
                                      title: "About Us",
                                    ));
                                    // changePageWithDelay(TopFaq());
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 4.5.rs()),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsets.only(left: 3.rs()),
                                          child: Image.asset(
                                            Assets.aboutUs,
                                            width: 4.rs(),
                                            color: appColor,
                                          ),
                                        ),
                                        4.rs().W(),
                                        "About Us".appCommonText(
                                            weight: FontWeight.w400,
                                            color: blackTextColor,
                                            size: 3.rs())
                                      ],
                                    ),
                                  ),
                                )),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 3.rs()),
                              child: Container(
                                color: viewGray,
                                height: .20.rs(),
                              ),
                            ),
                            Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  splashColor: appBackgroundColor,
                                  onTap: () {
                                    showDialog(
                                      barrierDismissible: false,
                                      context: context,
                                      builder: (context) {
                                        return logoutDialog(context);
                                      },
                                    );
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 4.5.rs()),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsets.only(left: 3.rs()),
                                          child: Image.asset(
                                            Assets.logoutNav,
                                            width: 4.rs(),
                                          ),
                                        ),
                                        4.rs().W(),
                                        "Logout".appCommonText(
                                            weight: FontWeight.w400,
                                            color: blackTextColor,
                                            size: 3.rs())
                                      ],
                                    ),
                                  ),
                                )),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 3.rs()),
                              child: Container(
                                color: viewGray,
                                height: .20.rs(),
                              ),
                            ),
                            Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  splashColor: appBackgroundColor,
                                  onTap: () {
                                    showDialog(
                                      barrierDismissible: false,
                                      context: context,
                                      builder: (context) {
                                        return deleteAccountDialog(context);
                                      },
                                    );
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 4.5.rs()),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsets.only(left: 3.rs()),
                                          child: Icon(
                                            Icons.delete_outline,
                                            color: appRedColorDim,
                                            size: 5.rs(),
                                          ),
                                        ),
                                        4.rs().W(),
                                        "Delete Account".appCommonText(
                                            weight: FontWeight.w400,
                                            color: appRedColorDim,
                                            size: 3.rs())
                                      ],
                                    ),
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
