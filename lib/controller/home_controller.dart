import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt currentIndex = 0.obs;
  PageController pageController = PageController(initialPage: 0);

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createUserInFirestore() async {
    final User? user = _auth.currentUser;
    if (user != null) {
      final userProfile = {
        'phoneNumber': user.phoneNumber,
        'createdAt': Timestamp.now(),
        'deviceOS': Platform.operatingSystem,
      };

      // Create or update user document in Firestore
      await _firestore
          .collection('users')
          .doc(user.uid)
          .set(userProfile, SetOptions(merge: true));
      print('User profile created or updated in Firestore');
    }
  }
}
