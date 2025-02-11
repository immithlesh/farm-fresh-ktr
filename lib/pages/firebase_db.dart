import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../utils/shared_preference.dart';

Future<Map<String, dynamic>?> getUserProfile() async {
  DocumentSnapshot userDoc = await FirebaseFirestore.instance
      .collection('users')
      .doc(PreferenceManager.getUserId())
      .get();

  if (userDoc.exists) {
    return userDoc.data() as Map<String, dynamic>?;
  } else {
    print('User not found');
    return null;
  }
}

Future<bool?> checkUserExistDB(String userId) async {
  DocumentSnapshot userDoc =
      await FirebaseFirestore.instance.collection('users').doc(userId).get();
  if (userDoc.exists) {
    return true;
  } else {
    print('User not found');
    return false;
  }
}

Future<void> updateUserProfile(
    String username, String address, String email) async {
  final Map<String, dynamic> updates = {};

  updates['userName'] = username;
  updates['address'] = address;
  updates['email'] = email;

  await FirebaseFirestore.instance
      .collection('users')
      .doc(PreferenceManager.getUserId())
      .update(updates);

  print('User profile updated with additional fields');
}

Future<void> updateUserProfilePicture(String profileUrl) async {
  final Map<String, dynamic> updates = {};

  updates['profileImage'] = profileUrl;

  await FirebaseFirestore.instance
      .collection('users')
      .doc(PreferenceManager.getUserId())
      .update(updates);

  print('User profile picture updated');
}

Future<String?> uploadUserImage(File imageFile) async {
  try {
    // Create a reference to the location in Firebase Storage
    final storageRef = FirebaseStorage.instance
        .ref()
        .child('user_images/${PreferenceManager.getUserId()}');

    // Upload the file
    final uploadTask = storageRef.putFile(imageFile);

    // Wait for the upload to complete
    final snapshot = await uploadTask;

    // Get the download URL
    final imageUrl = await snapshot.ref.getDownloadURL();

    print('User image uploaded successfully: $imageUrl');
    return imageUrl;
  } catch (e) {
    print('Error uploading user image: $e');
    return null;
  }
}
