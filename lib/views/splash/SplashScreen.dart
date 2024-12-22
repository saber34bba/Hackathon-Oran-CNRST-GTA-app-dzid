import 'package:align_positioned/align_positioned.dart';
import 'package:dzid/components/AppFooter.dart';
import 'package:dzid/components/AppLogo.dart';
import 'package:dzid/constants/colors.dart';
import 'package:dzid/helpers/BoxHelper.dart';
import 'package:dzid/services/AuthenticationService.dart';
import 'package:dzid/views/authentication/AuthenticationPage.dart';
import 'package:flutter/material.dart';
import 'package:installed_apps/app_info.dart';
import 'package:installed_apps/installed_apps.dart';

import '../../services/GlobalService.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((time){
      GlobalService().requestNotificationPermission();
    });
    Future.delayed(Duration(seconds: 2),(){
         Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=> AuthenticationPage()));
    });
    checkInstalledApp();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundColor2,
      body: SizedBox(
        height: BoxHelper.fullHeight(context),
        width: BoxHelper.fullWidth(context),
        child: Stack(
          children: [
            Center(
                child: AppLogo(height: 150.0, width: 150.0)
            ),
            AlignPositioned(
              dy: -10.0,
              alignment: Alignment.bottomCenter,
              child: AppFooter(),
            ),
          ],
        )
      )
    );
  }
  checkInstalledApp() async{

  }
}
