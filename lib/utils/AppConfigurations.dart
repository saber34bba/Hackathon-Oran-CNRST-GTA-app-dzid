import 'package:flutter/services.dart';

class AppConfigurations {
  updateScreenOverlay({required statusBarColor,required statusBarBrightness,required systemNavigationBarColor,required statusBarIconBrightness,required systemNavigationBarIconBrightness}){
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: statusBarColor,
      statusBarBrightness: statusBarBrightness,
      systemNavigationBarColor: systemNavigationBarColor,
      systemNavigationBarIconBrightness: systemNavigationBarIconBrightness,
      statusBarIconBrightness: statusBarIconBrightness,
    ));
  }
}