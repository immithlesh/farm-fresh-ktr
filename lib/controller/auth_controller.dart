import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_fresh/pages/home/home_page.dart';
import 'package:farm_fresh/pages/verify_otp_page.dart';
import 'package:farm_fresh/utils/custom_snackbar.dart';
import 'package:farm_fresh/utils/shared_preference.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/firebase_db.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  var verificationId = ''.obs;
  var isPinComplete = false.obs;
  var isLoadingSendBtn = false.obs;
  var isLoadingVerifyBtn = false.obs;
  var pinValue = "".obs;

  TextEditingController languageTextController = TextEditingController();
  TextEditingController phoneControllerLogin = TextEditingController();

  void verifyPhoneNumber(BuildContext context) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: '+91${phoneControllerLogin.text}',
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);

        if (_auth.currentUser != null) {
          checkUserExistDB(_auth.currentUser!.uid).then(
            (isExist) async {
              if (isExist == false) {
                await createUserInFirestore();
              }
            },
          );
          isLoadingSendBtn.value = false;
          isLoadingVerifyBtn.value = false;
          update();
          PreferenceManager.setIsLogIn(true);
          PreferenceManager.setUserId(_auth.currentUser!.uid);
          PreferenceManager.setUserPhone("+91${phoneControllerLogin.text}");
          Get.offAll(HomePage());
        }
        CustomSnackbar.show(
            context: context,
            message:
                'Phone number automatically verified and user signed in: ${_auth.currentUser}');
      },
      verificationFailed: (FirebaseAuthException e) {
        isLoadingSendBtn.value = false;
        update();
        CustomSnackbar.show(
            context: context,
            message:
                'Phone number verification failed. Code: ${e.code}. Message: ${e.message}');
      },
      codeSent: (String verificationId, int? resendToken) {
        isLoadingSendBtn.value = false;
        update();
        this.verificationId.value = verificationId;
        Get.to(() => VerifyOtpPage());
        CustomSnackbar.show(
            context: context,
            message: 'Please check your phone for the verification code.');
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        this.verificationId.value = verificationId;
        print('Verification code: $verificationId');
      },
    );
  }

  void signInWithPhoneNumber() async {
    final PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId.value,
      smsCode: pinValue.value,
    );
    await _auth.signInWithCredential(credential);
    if (_auth.currentUser != null) {
      checkUserExistDB(_auth.currentUser!.uid).then(
        (isExist) async {
          if (isExist == false) {
            await createUserInFirestore();
          }
        },
      );
      isLoadingVerifyBtn.value = false;
      update();
      PreferenceManager.setIsLogIn(true);
      PreferenceManager.setUserId(_auth.currentUser!.uid);
      PreferenceManager.setUserPhone("+91${phoneControllerLogin.text}");
      Get.offAll(HomePage());
    }
    print('Successfully signed in UID: ${_auth.currentUser?.uid}');
  }

  Future<void> createUserInFirestore() async {
    final User? user = _auth.currentUser;
    if (user != null) {
      final userProfile = {
        'phoneNumber': user.phoneNumber,
        'createdAt': Timestamp.now(),
        'deviceOS': Platform.operatingSystem,
      };
      await _firestore
          .collection('users')
          .doc(user.uid)
          .set(userProfile, SetOptions(merge: true));
      print('User profile created or updated in Firestore');
    }
  }
}
