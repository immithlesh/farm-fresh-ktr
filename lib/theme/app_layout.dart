
import 'package:farm_fresh/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:google_fonts/google_fonts.dart';

import '../generated/assets.dart';
import 'app_color.dart';

SizedBox commonTextField(
    {required TextEditingController controller,
    required String hintText,
    bool isPasswordField = false,
    bool obscureText = false,
    bool lightOutline = true,
    int maxLine = 1,
    TextInputAction textInputAction = TextInputAction.next,
    double hintTextSize = 16,
    double height = 60,
    double horizontalContentPadding = 20,
    double topBoxPadding = 10,
    FontWeight weight = FontWeight.w500,
    Color fillColor = whiteColor,
    Color normalOutline = lightOutlineGray,
    String? Function(String?)? validation,
    void Function(String)? onChange,
    List<TextInputFormatter>? inputFormatters,
    TextInputType? keyboardType,
    bool readOnly = false,
    required Widget suffixIcon,
    FocusNode? focusNode}) {
  return SizedBox(
    height: height,
    child: Padding(
      padding: EdgeInsets.only(top: topBoxPadding),
      child: TextFormField(
        readOnly: readOnly,
        onChanged: onChange,
        validator: validation,
        controller: controller,
        maxLines: maxLine,
        focusNode: focusNode,
        cursorColor: appColor,
        autofocus: false,
        style: GoogleFonts.sora(
          fontSize: hintTextSize,
          color: blackTextColor,
          fontWeight: weight,
        ),
        inputFormatters: inputFormatters,
        obscureText: obscureText,
        textInputAction: textInputAction,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          hintText: hintText,
          enabled: true,
          contentPadding: EdgeInsets.symmetric(
              horizontal: horizontalContentPadding, vertical: 10),
          hintStyle: hintTextStyle(
              size: hintTextSize, weight: weight, color: hintTextColor),
          // suffixIcon: isPasswordField ? suffixIcon : suffixIcon,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: lightOutline ? lightOutlineGray : viewGray,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(7),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: appColor,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(7),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(7),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: whiteColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          filled: true,
          fillColor: fillColor,
        ),
      ),
    ),
  );
}

SizedBox commonTextFieldWithSuffix(
    {required TextEditingController controller,
    required String hintText,
    bool isPasswordField = false,
    bool obscureText = false,
    bool lightOutline = true,
    int maxLine = 1,
    TextInputAction textInputAction = TextInputAction.next,
    double hintTextSize = 16,
    double height = 60,
    double horizontalContentPadding = 20,
    double topBoxPadding = 10,
    FontWeight weight = FontWeight.w500,
    Color fillColor = whiteColor,
    Color normalOutline = lightOutlineGray,
    String? Function(String?)? validation,
    void Function(String)? onChange,
    List<TextInputFormatter>? inputFormatters,
    TextInputType? keyboardType,
    bool readOnly = false,
    required Widget suffixIcon}) {
  return SizedBox(
    height: height,
    child: Padding(
      padding: EdgeInsets.only(top: topBoxPadding),
      child: TextFormField(
        readOnly: readOnly,
        onChanged: onChange,
        validator: validation,
        controller: controller,
        maxLines: maxLine,
        cursorColor: appColor,
        autofocus: false,
        style: GoogleFonts.sora(
          fontSize: hintTextSize,
          color: blackTextColor,
          fontWeight: weight,
        ),
        inputFormatters: inputFormatters,
        obscureText: obscureText,
        textInputAction: textInputAction,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hintText,
          enabled: true,
          contentPadding: EdgeInsets.symmetric(
              horizontal: horizontalContentPadding, vertical: 10),
          hintStyle: hintTextStyle(
              size: hintTextSize, weight: weight, color: hintTextColor),
          suffixIcon: isPasswordField ? suffixIcon : suffixIcon,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: lightOutline ? lightOutlineGray : viewGray,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(7),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: appColor,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(7),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(7),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: whiteColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          filled: true,
          fillColor: fillColor,
        ),
      ),
    ),
  );
}
SizedBox commonTextFieldWithPrefixText(
    {required TextEditingController controller,
    required String hintText,
    bool isPasswordField = false,
    bool obscureText = false,
    bool lightOutline = true,
    int maxLine = 1,
    TextInputAction textInputAction = TextInputAction.next,
    double hintTextSize = 16,
    double height = 60,
    double horizontalContentPadding = 20,
    double topBoxPadding = 10,
    FontWeight weight = FontWeight.w500,
    Color fillColor = whiteColor,
    Color normalOutline = lightOutlineGray,
    String? Function(String?)? validation,
    void Function(String)? onChange,
    List<TextInputFormatter>? inputFormatters,
    TextInputType? keyboardType,
      required String prefixText,
    bool readOnly = false}) {
  return SizedBox(
    height: height,
    child: Padding(
      padding: EdgeInsets.only(top: topBoxPadding),
      child: TextFormField(
        readOnly: readOnly,
        onChanged: onChange,
        validator: validation,
        controller: controller,
        maxLines: maxLine,
        cursorColor: appColor,
        autofocus: false,
        style: GoogleFonts.sora(
          fontSize: hintTextSize,
          color: blackTextColor,
          fontWeight: weight,
        ),
        inputFormatters: inputFormatters,
        obscureText: obscureText,
        textInputAction: textInputAction,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          prefixText: prefixText,
          hintText: hintText,
          enabled: true,
          contentPadding: EdgeInsets.symmetric(
              horizontal: horizontalContentPadding, vertical: 10),
          hintStyle: hintTextStyle(
              size: hintTextSize, weight: weight, color: hintTextColor),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: lightOutline ? lightOutlineGray : viewGray,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(7),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: appColor,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(7),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(7),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: whiteColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          filled: true,
          fillColor: fillColor,
        ),
      ),
    ),
  );
}

SizedBox commonTextFieldPassword(
    {required TextEditingController controller,
    required String hintText,
    required FocusNode focusNode,
    bool isPasswordField = false,
    bool obscureText = false,
    int maxLine = 1,
    TextInputAction textInputAction = TextInputAction.next,
    num hintTextSize = 16,
    double height = 50,
    Color fillColor = whiteColor,
    String? Function(String?)? validation,
    void Function(String)? onChange,
    List<TextInputFormatter>? inputFormatters,
    TextInputType? keyboardType,
    bool readOnly = false,
    required Widget suffixIcon}) {
  return SizedBox(
    height: height,
    child: TextFormField(
      readOnly: readOnly,
      onChanged: onChange,
      validator: validation,
      controller: controller,
      maxLines: maxLine,
      autofocus: false,
      style: GoogleFonts.sora(
        fontSize: 16,
        color: appColor,
        fontWeight: FontWeight.w500,
      ),
      inputFormatters: inputFormatters,
      obscureText: obscureText,
      textInputAction: TextInputAction.next,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        enabled: true,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        hintStyle: hintTextStyle(
            size: hintTextSize, weight: FontWeight.w500, color: hintTextColor),
        suffixIcon: isPasswordField ? suffixIcon : const SizedBox(),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: whiteColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: appColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: whiteColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        filled: true,
        fillColor: fillColor,
      ),
    ),
  );
}

Widget commonAppBar(
    {required String leadingAsset,
    Function()? leadingOnTap,
    String title = ''}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      GestureDetector(
        onTap: leadingOnTap,
        child: commonSvgPicture(image: leadingAsset, boxFit: BoxFit.contain),
      ),
      title.appCommonText(
          size: 28,
          weight: FontWeight.w700,
          color: whiteColor,
          align: TextAlign.center),
      SvgPicture.asset(
        Assets.appIcon,
        fit: BoxFit.contain,
        // ignore: deprecated_member_use
        color: Colors.transparent,
      ),
    ],
  );
}

Widget commonCircularProgressIndicator() {
  return const Center(
      child: CircularProgressIndicator(
    color: appColor,
  ));
}

GestureDetector commonAppButton({
  required Function() onTap,
  required String title,
  Color btnColor = appColor,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 50,
      decoration: BoxDecoration(
          color: btnColor, borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: title.appCommonText(
          color: whiteColor,
          size: 20,
          weight: FontWeight.w700,
          align: TextAlign.end,
        ),
      ),
    ),
  );
}

commonSvgPicture(
    {required String image,
    double? height,
    double? width,
    BoxFit boxFit = BoxFit.fill}) {
  return SvgPicture.asset(image, height: height, width: width, fit: boxFit);
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: capitalize(newValue.text),
      selection: newValue.selection,
    );
  }
}

String capitalize(String value) {
  if (value.trim().isEmpty) return "";
  return "${value[0].toUpperCase()}${value.substring(1).toLowerCase()}";
}

class CharacterSpaceInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final RegExp regex = RegExp(r'^[a-zA-Z ]*$');
    String newString = newValue.text;
    if (!regex.hasMatch(newString)) {
      newString = oldValue.text;
    }
    return TextEditingValue(
      text: newString,
      selection: TextSelection.collapsed(offset: newString.length),
    );
  }
}

class EmojiFilteringTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (containsEmoji(newValue.text)) {
      return oldValue;
    }
    return newValue;
  }

  bool containsEmoji(String text) {
    final emojiRegex =
        RegExp(r'[\u{1F600}-\u{1F64F}\u{1F300}-\u{1F5FF}\u{1F680}-\u{1F6FF}]');
    return emojiRegex.hasMatch(text);
  }
}

class NoSpaceInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final newString = newValue.text.replaceAll(' ', '');
    final selectionIndex =
        newValue.selection.baseOffset - newValue.text.length + newString.length;

    return TextEditingValue(
      text: newString,
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}
