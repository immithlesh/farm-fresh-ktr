import 'package:farm_fresh/pages/login_page.dart';
import 'package:farm_fresh/pages/profile/profile_page.dart';
import 'package:farm_fresh/theme/app_color.dart';
import 'package:farm_fresh/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home_controller.dart';
import '../../utils/shared_preference.dart';
import 'bottom_item.dart';
import 'home_page_inner.dart';
import 'orders_page.dart';

class HomePage extends StatelessWidget {
  final List<Widget> _homeNavigationPages = [
    HomepageInner(),
    OrdersPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      initState: (state) {},
      builder: (controller) {
        return Scaffold(
          bottomNavigationBar: Obx(() => bottomAppBarFun(controller, context)),
          backgroundColor: appBackgroundColor,
          body: PageView(
            controller: controller.pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: _homeNavigationPages,
            onPageChanged: (index) {
              controller.currentIndex.value = index;
            },
          ),
        );
      },
    );
  }

  Widget bottomAppBarFun(HomeController homeController, BuildContext context) {
    return Container(
      color: whiteColor,
      child: BottomAppBar(
        child: Container(
          height: 13.rs(),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              BottomItem(
                iconData: Icons.home,
                label: 'Home',
                isSelected: homeController.currentIndex == 0,
                onPressed: () {
                  _changePage(0, homeController, context);
                },
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 2.rs()),
                child: Container(color: viewGray, width: .25.rs()),
              ),
              BottomItem(
                iconData: Icons.list_alt,
                label: 'Orders',
                isSelected: homeController.currentIndex == 1,
                onPressed: () {
                  // subscriptionController.subscriptionList.clear();
                  _changePage(1, homeController, context);
                },
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 2.rs()),
                child: Container(color: viewGray, width: .25.rs()),
              ),
              BottomItem(
                iconData: Icons.account_circle_rounded,
                label: 'Profile',
                isSelected: homeController.currentIndex == 2,
                onPressed: () {
                  // subscriptionController.subscriptionList.clear();
                  _changePage(2, homeController, context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _changePage(int index, HomeController controller, BuildContext context) {
    if (PreferenceManager.getIsLogIn() == false) {
      showDialog(
        context: context,
        builder: (context) {
          return commonDialogWithYesNoDialog(
            context,
            "Please login first.",
            "Login",
            "cancel",
            () {
              Get.back();
              Get.off(LoginPage());
            },
            () {
              Get.back();
            },
          );
        },
      );
      return;
    }
    if (controller.currentIndex != index) {
      controller.pageController.jumpToPage(index);
      // controller.isShowShimmerRefill=true;
      // controller.isShowShimmerFavorite=true;
    }
  }
}
