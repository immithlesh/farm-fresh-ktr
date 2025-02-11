import 'package:get/get.dart';

class LoaderController extends GetxController {
  bool _isLoading = false;
  bool _isLoadingBottom = false;

  bool get isLoading => _isLoading;
  bool get isLoadingBottom => _isLoadingBottom;

  void showLoading() {
    _isLoading = true;
    update();
  }
  void showLoadingBottom() {
    _isLoadingBottom = true;
    update();
  }

  void hideLoading() {
    _isLoading = false;
    update();
  }
  void hideLoadingBottom() {
    _isLoadingBottom = false;
    update();
  }
}

class Loader {
  var loadingCtrl = Get.find<LoaderController>();

  void showLoading() => loadingCtrl.showLoading();
  void showLoadingBottom() => loadingCtrl.showLoadingBottom();

  void hideLoading() => loadingCtrl.hideLoading();
  void hideLoadingBottom() => loadingCtrl.hideLoadingBottom();
}
