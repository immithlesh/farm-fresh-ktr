import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../pages/firebase_db.dart';
import '../utils/ImagePickerService.dart';
import '../utils/loader_controller.dart';

class ProfileController extends GetxController {
  final loaderController = Get.find<LoaderController>();

  bool _isSelected = false;
  bool get isSelected => _isSelected;
  set setSelected(bool value) {
    _isSelected = value;
    update();
  }

  FocusNode focusNode = FocusNode();

  TextEditingController fullNameControllerProfile = TextEditingController();
  TextEditingController phoneControllerProfile = TextEditingController();
  TextEditingController emailControllerProfile = TextEditingController();
  TextEditingController addressControllerProfile = TextEditingController();
  TextEditingController languageControllerProfile = TextEditingController();

  var userNameSaved = "".obs;
  var userPhoneNumberSaved = "".obs;
  var userEmailSaved = "".obs;
  var userAddressSaved = "".obs;

  Future<void> loadUserProfile() async {
    Map<String, dynamic>? userProfile = await getUserProfile();

    if (userProfile != null) {
      userNameSaved.value = userProfile['userName'] ?? '';
      userEmailSaved.value = userProfile['email'] ?? '';
      userAddressSaved.value = userProfile['address'] ?? '';
      userPhoneNumberSaved.value = userProfile['phoneNumber'] ?? '';
      selectedImage.value = userProfile['profileImage'] ?? '';
    }
    update();
  }

  final ImagePickerService _imagePickerService = ImagePickerService();
  var selectedImage = "".obs;

  Future<void> pickImageFromGallery(BuildContext context) async {
    final image = await _imagePickerService.pickImageFromGallery(context);
    if (image != null) {
      loaderController.showLoading();
      selectedImage.value = (await uploadUserImage(image).then(
        (value) {
          updateUserProfilePicture(value!);
          loaderController.hideLoading();
        },
      ))!;
      update();
    }
  }

  Future<void> takePhoto(BuildContext context) async {
    final image = await _imagePickerService.takePhoto(context);
    if (image != null) {
      loaderController.showLoading();
      selectedImage.value = (await uploadUserImage(image).then(
        (value) {
          updateUserProfilePicture(value!);
          loaderController.hideLoading();
        },
      ))!;
      update();
    }
  }
}
