import 'package:farm_fresh/utils/extension.dart';
import 'package:farm_fresh/utils/shared_preference.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/app_color.dart';

void longLog(String stringData) {
  const int chunkSize = 500;
  for (int i = 0; i < stringData.length; i += chunkSize) {
    print(stringData.substring(i,
        i + chunkSize < stringData.length ? i + chunkSize : stringData.length));
  }
}

void languageChangeBottomSheet(BuildContext contextMain) {
  var selectedLanguage = PreferenceManager.getLocale();
  var language = (selectedLanguage == "en") ? 0 : 1;
  showModalBottomSheet(
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
    ),
    context: contextMain,
    builder: (BuildContext context) {
      return Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          padding: EdgeInsets.all(5.rs()),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              "Choose Language".appCommonText(
                  color: appTextGray,
                  size: 4.rs(),
                  weight: FontWeight.w500,
                  align: TextAlign.start),
              5.rs().H(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    child: Radio(
                      value: 0,
                      activeColor: appColor,
                      groupValue: language ?? 0,
                      onChanged: (value) {
                        PreferenceManager.setLocale("en");
                        language = value!;
                        Get.updateLocale(Locale("en"));
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 2.rs()),
                      child: "English".appCommonText(
                          color: appTextGray,
                          size: 4.rs(),
                          weight: FontWeight.w500,
                          align: TextAlign.start),
                    ),
                  ),
                ],
              ),
              5.rs().H(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    child: Radio(
                      value: 1,
                      activeColor: appColor,
                      groupValue: language,
                      onChanged: (value) {
                        PreferenceManager.setLocale("hi");
                        language = value!;
                        Get.updateLocale(Locale("hi"));
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 2.rs()),
                      child: "Hindi".appCommonText(
                          color: appTextGray,
                          size: 4.rs(),
                          weight: FontWeight.w500,
                          align: TextAlign.start),
                    ),
                  ),
                ],
              ),
              20.rs().H()
            ],
          ),
        ),
      );
    },
  );
}
