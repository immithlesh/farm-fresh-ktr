import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../theme/app_color.dart';

class AppProgressBottom extends StatelessWidget {
  const AppProgressBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ModalBarrier(
          // color: Colors.black.withOpacity(0.5),
          dismissible: false, // Prevent clicks behind the loader
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: 100, // Adjust width as needed
            height: 50, // Adjust height as needed
            child: SpinKitThreeInOut(
              size: 40,
              duration: Duration(milliseconds: 1500),
              itemBuilder: (BuildContext context, int index) {
                return DecoratedBox(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: appColor,
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
