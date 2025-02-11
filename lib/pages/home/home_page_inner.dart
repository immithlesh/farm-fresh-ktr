import 'package:farm_fresh/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home_controller.dart';

class HomepageInner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      initState: (state) {},
      builder: (controller) {
        return Scaffold(backgroundColor: appBackgroundColor, body: Container());
      },
    );
  }
}
