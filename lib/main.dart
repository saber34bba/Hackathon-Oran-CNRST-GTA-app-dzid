import 'package:dzid/services/AuthenticationService.dart';
import 'package:dzid/utils/AppConfigurations.dart';
import 'package:dzid/utils/SizeConfig.dart';
import 'package:dzid/views/splash/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'constants/colors.dart';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context, designWidth: 390, designHeight: 800);
    AppConfigurations().updateScreenOverlay(statusBarColor: CustomColors.backgroundColor2, statusBarBrightness: Brightness.dark, systemNavigationBarColor: Colors.white, statusBarIconBrightness: Brightness.dark, systemNavigationBarIconBrightness: Brightness.dark);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=> AuthenticationService()),
      ],
      child: MaterialApp(
          title: 'DZID',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily:GoogleFonts.changa().fontFamily,
            primaryColor: CustomColors.primary,
            colorScheme: ColorScheme.fromSeed(seedColor: CustomColors.primary,),
            useMaterial3: true,
          ),
          home: SplashScreen()
      ),
    );
  }
}


