import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../theme/app_color.dart';

class AppProgress extends StatelessWidget {
  const AppProgress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ModalBarrier(
          color: Colors.black.withOpacity(0.5),
          dismissible: false, // Prevent clicks behind the loader
        ),
        Center(
          child: Container(
            width: 100, // Adjust width as needed
            height: 100, // Adjust height as needed
            // decoration: BoxDecoration(
            //   color: Colors.white,
            //   borderRadius: BorderRadius.circular(8),
            // ),
            child: SpinKitCircle(
              size: 55,
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
