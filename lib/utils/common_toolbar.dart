import 'package:farm_fresh/utils/extension.dart';
import 'package:flutter/material.dart';
import '../theme/app_color.dart';

class CommonToolbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Function()? onBack;

  CommonToolbar({required this.title, this.onBack});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: appBackgroundColor,
      shadowColor: Colors.transparent,
      titleSpacing:  2.rs(),
      centerTitle: true,
      title: title.appCommonText(color: blackTextColor,size:  4.rs(),weight: FontWeight.w400),
      leading: onBack != null
          ? IconButton(
        // icon: Image.asset(Assets.back,width:  7.rs(),),
        icon: Icon(Icons.arrow_back_ios_new,size: 7.rs(),color: appColor,),
        onPressed: onBack,
      )
          : null,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight( 12.rs());
}
