import 'dart:io';

import 'package:farm_fresh/l10n/locale_keys.g.dart';
import 'package:farm_fresh/utils/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ImagePickerService {
  final ImagePicker _picker = ImagePicker();
  final ImageCropper _cropper = ImageCropper();

  Future<bool> _requestPermission(Permission permission) async {
    if (await permission.isGranted) {
      return true;
    } else {
      var result = await permission.request();
      return result.isGranted;
    }
  }

  Future<bool> _requestPermissionForMedia() async {
    if (Platform.isAndroid &&
        (await Permission.storage.isGranted ||
            await Permission.mediaLibrary.isGranted)) {
      return true;
    } else {
      var readPermission = await Permission.photos.request();
      return readPermission.isGranted;
    }
  }

  Future<File?> _cropImage(File imageFile) async {
    final croppedFile = await _cropper.cropImage(
      sourcePath: imageFile.path,
    );

    return croppedFile != null ? File(croppedFile.path) : null;
  }

  Future<File?> pickImageFromGallery(BuildContext context) async {
    bool hasPermission = await _requestPermissionForMedia();
    if (!hasPermission) {
      CustomSnackbar.show(
          context: context,
          message: LocaleKeys.photoGalleryPermissionRequired.tr);

      return null;
    }

    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      File? croppedFile = await _cropImage(File(pickedFile.path));
      return croppedFile;
    }
    return null;
  }

  Future<File?> takePhoto(BuildContext context) async {
    bool hasCameraPermission = await _requestPermission(Permission.camera);
    bool hasMediaPermission = await _requestPermissionForMedia();

    if (!hasCameraPermission || !hasMediaPermission) {
      CustomSnackbar.show(
          context: context,
          message: LocaleKeys.cameraMediaPermissionRequired.tr);

      return null;
    }

    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      File? croppedFile = await _cropImage(File(pickedFile.path));
      return croppedFile;
    }
    return null;
  }
}
