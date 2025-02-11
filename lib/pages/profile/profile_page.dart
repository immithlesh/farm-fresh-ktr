import 'package:farm_fresh/controller/profile_controller.dart';
import 'package:farm_fresh/generated/assets.dart';
import 'package:farm_fresh/pages/profile/setting_page.dart';
import 'package:farm_fresh/theme/app_color.dart';
import 'package:farm_fresh/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme/app_layout.dart';
import '../../utils/app_progress.dart';
import '../../utils/loader_controller.dart';
import '../firebase_db.dart';

class ProfilePage extends StatelessWidget {
  // ProfileController profileController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GetBuilder<ProfileController>(
          initState: (state) {},
          builder: (controller) {
            controller.loadUserProfile();
            return Scaffold(
                backgroundColor: appBackgroundColor,
                body: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            10.rs().H(),
                            GestureDetector(
                              onTap: () {
                                Get.to(SettingPageState());
                              },
                              child: Padding(
                                padding: EdgeInsets.only(right: 5.rs()),
                                child: Align(
                                  alignment: Alignment.bottomRight,
                                  child: Icon(
                                    Icons.settings_applications_rounded,
                                    size: 10.rs(),
                                    color: appColor,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Stack(
                                children: [
                                  controller.selectedImage.value.isNotEmpty
                                      ? ClipOval(
                                          child: Container(
                                            color: whiteColor,
                                            child: Image.network(
                                              loadingBuilder: (context, child,
                                                  loadingProgress) {
                                                if (loadingProgress == null) {
                                                  return child;
                                                } else {
                                                  return AppProgress();
                                                }
                                              },
                                              controller.selectedImage.value,
                                              width: 30.rs(),
                                              height: 30.rs(),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        )
                                      : ClipOval(
                                          child: Container(
                                            color: whiteColor,
                                            child: Image.asset(
                                              Assets.user,
                                              width: 30.rs(),
                                              height: 30.rs(),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                  Positioned(
                                    bottom: 15,
                                    right: 1,
                                    child: GestureDetector(
                                      onTap: () {
                                        controller
                                            .pickImageFromGallery(context);
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                            color: whiteColor,
                                            shape: BoxShape.circle),
                                        child: Icon(
                                          Icons.camera_alt,
                                          color: appColor,
                                          size: 4.rs(),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 3.rs(), vertical: 3.rs()),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: whiteColor,
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        width: 1, color: lightOutlineGray)),
                                padding: EdgeInsets.all(3.rs()),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    2.rs().H(),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 45.rs(),
                                              alignment: Alignment.centerLeft,
                                              padding: EdgeInsets.only(
                                                  top: 1.5.rs()),
                                              child: (controller
                                                      .userNameSaved.value)
                                                  .appCommonText(
                                                      color: appBlack,
                                                      align: TextAlign.start,
                                                      weight: FontWeight.w600,
                                                      size: 3.8.rs()),
                                            ),
                                            1.rs().H(),
                                            Container(
                                              alignment: Alignment.topLeft,
                                              width: 35.rs(),
                                              child: (controller
                                                      .userPhoneNumberSaved
                                                      .value)
                                                  .appCommonText(
                                                      color: textGray,
                                                      weight: FontWeight.w400,
                                                      size: 3.rs()),
                                            ),
                                          ],
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            if (controller.isSelected) {
                                              controller.setSelected = false;
                                            } else {
                                              controller.focusNode
                                                  .requestFocus();
                                              controller.setSelected = true;
                                              controller.update();
                                              controller
                                                      .fullNameControllerProfile
                                                      .text =
                                                  controller
                                                      .userNameSaved.value;
                                              controller.emailControllerProfile
                                                      .text =
                                                  controller
                                                      .userEmailSaved.value;
                                              controller
                                                      .addressControllerProfile
                                                      .text =
                                                  controller
                                                      .userAddressSaved.value;
                                              controller.phoneControllerProfile
                                                      .text =
                                                  controller
                                                      .userPhoneNumberSaved
                                                      .value;
                                            }
                                          },
                                          style: controller.isSelected
                                              ? ElevatedButton.styleFrom(
                                                  backgroundColor: appColor,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0),
                                                  ),
                                                )
                                              : ElevatedButton.styleFrom(
                                                  backgroundColor: Colors.white,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0),
                                                    side: BorderSide(
                                                        color: appColor),
                                                  ),
                                                ),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 2.5.rs()),
                                            child: (controller.isSelected
                                                    ? "Cancel"
                                                    : "Edit Profile")
                                                .appCommonText(
                                                    color: controller.isSelected
                                                        ? whiteColor
                                                        : appColor,
                                                    size: 3.5.rs(),
                                                    weight: FontWeight.w400),
                                          ),
                                        )
                                      ],
                                    ),
                                    4.rs().H(),
                                    Container(
                                      alignment: Alignment.topLeft,
                                      width: 35.rs(),
                                      child: "Email ID".appCommonText(
                                          color: appColor,
                                          weight: FontWeight.w300,
                                          size: 3.rs()),
                                    ),
                                    Container(
                                      alignment: Alignment.topLeft,
                                      child: (controller.userEmailSaved.value)
                                          .appCommonText(
                                              align: TextAlign.start,
                                              color: textGray,
                                              weight: FontWeight.w300,
                                              size: 3.rs()),
                                    ),
                                    4.rs().H(),
                                    Container(
                                      alignment: Alignment.topLeft,
                                      width: 35.rs(),
                                      child: "Address".appCommonText(
                                          color: appColor,
                                          weight: FontWeight.w300,
                                          size: 3.rs()),
                                    ),
                                    Container(
                                      alignment: Alignment.topLeft,
                                      child: (controller.userAddressSaved.value)
                                          .appCommonText(
                                              align: TextAlign.start,
                                              color: textGray,
                                              weight: FontWeight.w300,
                                              size: 3.rs()),
                                    ),
                                    4.rs().H(),
                                    Container(
                                      alignment: Alignment.topLeft,
                                      child:
                                          "View and update your name, email, address and profile picture. Tap the settings icon for more options and customization."
                                              .appCommonText(
                                                  align: TextAlign.start,
                                                  color: textGray,
                                                  weight: FontWeight.w300,
                                                  size: 2.8.rs()),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            /**MiddleView*/
                            controller.isSelected
                                ? Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 3.rs(), vertical: 3.rs()),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Column(
                                        children: [
                                          Container(
                                              width: double.infinity,
                                              child: commonTextField(
                                                  focusNode:
                                                      controller.focusNode,
                                                  weight: FontWeight.w300,
                                                  keyboardType:
                                                      TextInputType.name,
                                                  controller: controller
                                                      .fullNameControllerProfile,
                                                  hintText: "Full Name",
                                                  hintTextSize: 3.5.rs(),
                                                  inputFormatters: [
                                                    LengthLimitingTextInputFormatter(
                                                        40),
                                                  ],
                                                  horizontalContentPadding:
                                                      3.rs(),
                                                  topBoxPadding: .7.rs(),
                                                  height: 12.rs(),
                                                  suffixIcon: SizedBox())),
                                          2.rs().H(),
                                          Container(
                                              width: double.infinity,
                                              child: commonTextField(
                                                  weight: FontWeight.w300,
                                                  keyboardType: TextInputType
                                                      .emailAddress,
                                                  controller: controller
                                                      .emailControllerProfile,
                                                  hintText: "Email",
                                                  inputFormatters: [
                                                    NoSpaceInputFormatter()
                                                  ],
                                                  hintTextSize: 3.5.rs(),
                                                  horizontalContentPadding:
                                                      3.rs(),
                                                  topBoxPadding: .7.rs(),
                                                  height: 12.rs(),
                                                  suffixIcon: SizedBox())),
                                          2.rs().H(),
                                          Container(
                                              width: double.infinity,
                                              child: commonTextField(
                                                  weight: FontWeight.w300,
                                                  textInputAction:
                                                      TextInputAction.done,
                                                  keyboardType: TextInputType
                                                      .streetAddress,
                                                  controller: controller
                                                      .addressControllerProfile,
                                                  hintText: "Full address",
                                                  hintTextSize: 3.5.rs(),
                                                  horizontalContentPadding:
                                                      3.rs(),
                                                  topBoxPadding: .7.rs(),
                                                  height: 12.rs(),
                                                  suffixIcon: SizedBox())),
                                          2.rs().H(),
                                          Container(
                                            width: double.infinity,
                                            child: SizedBox(
                                              height: 12.5.rs(),
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    top: .7.rs()),
                                                child: GestureDetector(
                                                  onTap: () {},
                                                  child: AbsorbPointer(
                                                    absorbing: true,
                                                    child: TextFormField(
                                                      controller: controller
                                                          .phoneControllerProfile,
                                                      maxLines: 1,
                                                      cursorColor: appColor,
                                                      style: GoogleFonts.sora(
                                                        fontSize: 3.5.rs(),
                                                        color: blackTextColor,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                      ),
                                                      inputFormatters: [
                                                        LengthLimitingTextInputFormatter(
                                                          12,
                                                        ),
                                                        NoSpaceInputFormatter()
                                                      ],
                                                      textInputAction:
                                                          TextInputAction.next,
                                                      keyboardType:
                                                          TextInputType.phone,
                                                      decoration:
                                                          InputDecoration(
                                                        hintText: "Mobile",
                                                        enabled: true,
                                                        contentPadding:
                                                            EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        3.rs(),
                                                                    vertical:
                                                                        10),
                                                        hintStyle: hintTextStyle(
                                                            size: 3.5.rs(),
                                                            weight:
                                                                FontWeight.w300,
                                                            color:
                                                                hintTextColor),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: viewGray,
                                                            width: 1,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(7),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              const BorderSide(
                                                            color: appColor,
                                                            width: 2,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(7),
                                                        ),
                                                        filled: true,
                                                        fillColor: viewGray,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          3.rs().H(),
                                          Container(
                                            width: double.infinity,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                FocusScope.of(context)
                                                    .unfocus();
                                                updateUserProfile(
                                                        controller
                                                            .fullNameControllerProfile
                                                            .text,
                                                        controller
                                                            .addressControllerProfile
                                                            .text,
                                                        controller
                                                            .emailControllerProfile
                                                            .text)
                                                    .then(
                                                  (value) {
                                                    controller
                                                        .loadUserProfile();
                                                    controller.setSelected =
                                                        false;
                                                    controller.update();
                                                  },
                                                );
                                              },
                                              child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 5.rs(),
                                                      vertical: 3.5.rs()),
                                                  child: "Update".appCommonText(
                                                      color: whiteColor,
                                                      size: 4.rs(),
                                                      weight: FontWeight.w700)),
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: appColor,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                : Container(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ));
          },
        ),
        GetBuilder<LoaderController>(builder: (ctrl) {
          return ctrl.isLoading ? const AppProgress() : Container();
        }),
      ],
    );
  }
}
