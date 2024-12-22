import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  double height;
  double width;
  AppLogo({required this.height,required this.width,super.key});

  @override
  Widget build(BuildContext context) {
    return  Transform.scale(
        scale: 3.5,
        child: Image.asset("assets/images/applogo1.png",height: height,width: width)
    );
  }
}
