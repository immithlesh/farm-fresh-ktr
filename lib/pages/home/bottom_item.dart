import 'package:farm_fresh/utils/extension.dart';
import 'package:flutter/material.dart';

import '../../theme/app_color.dart';

class BottomItem extends StatelessWidget {
  final IconData iconData;
  final String label;
  final bool isSelected;
  final VoidCallback onPressed;

  const BottomItem({
    Key? key,
    required this.iconData,
    required this.label,
    required this.isSelected,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = isSelected ? appColor : appTextGray;

    return MaterialButton(
      padding: EdgeInsets.only(left: 1.rs(), right: 1.rs(), bottom: 1.rs()),
      onPressed: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            iconData,
            color: color,
            size: 4.5.rs(),
          ),
          // Image.asset(
          //   iconData,color: color,width: 4.5.rs(),height: 4.5.rs(),
          // ),
          Padding(
            padding: EdgeInsets.only(top: .5.rs()),
            child: Text(
              label,
              style: TextStyle(color: color, fontSize: 3.rs()),
            ),
          ),
        ],
      ),
    );
  }
}
