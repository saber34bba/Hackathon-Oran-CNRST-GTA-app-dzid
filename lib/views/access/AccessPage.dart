import 'package:align_positioned/align_positioned.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';
import 'package:installed_apps/installed_apps.dart';
import 'package:provider/provider.dart';

import '../../components/AppFooter.dart';
import '../../components/AppLogo.dart';
import '../../constants/colors.dart';
import '../../helpers/BoxHelper.dart';
import '../../helpers/TextHelper.dart';
import '../../services/AuthenticationService.dart';
import '../../services/GlobalService.dart';
import '../../utils/SizeConfig.dart';

class AccessPage extends StatefulWidget {

  AccessPage({super.key});

  @override
  State<AccessPage> createState() => _AccessPageState();
}

class _AccessPageState extends State<AccessPage> {
@override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundColor2,
      body:Stack(
        children: [
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppLogo(height: 110.0, width: 110.0),
                BoxHelper.create(context: context,height: 75.0),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: SizeConfig.scaleWidthValue(25)),
                    child:  Container(
                      width: BoxHelper.fullWidth(context),
                      padding: EdgeInsets.symmetric(horizontal: 15.0,vertical: 20.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(7.0),
                          boxShadow: [
                            BoxShadow(color: CustomColors.grayColor1.withOpacity(.22),blurRadius: 20.0,spreadRadius: 12.0)
                          ]
                      ),
                      child: Column(
                        children: [
                          TextHelper.create(text:"أنت تحاول تسجيل الدخول إلى منصة تطبيق الحكومة الرقمية. هل تقبل ذلك؟",weight: FontWeight.w600,size: SizeConfig.fontSize(13.0),maxLines: 10*5),
                          BoxHelper.create(context: context,height: 35.0),
                          SwipeButton(
                            trackPadding: EdgeInsets.all(6),
                            inactiveTrackColor: CustomColors.grayColor,
                            inactiveThumbColor: CustomColors.grayColor,
                            activeThumbColor: CustomColors.primary,
                            height: 50.0,
                            elevationThumb: 2,
                            activeTrackColor: Colors.white,
                            child: TextHelper.create(text: "اسحب للتأكيد",size: 14.0,color: CustomColors.textColor2),
                            onSwipe: () async{
                              bool? appIsInstalled = await InstalledApps.isAppInstalled("com.mobiurbain.mobiurbain");
                              InstalledApps.startApp("com.mobiurbain.mobiurbain");
                            },
                          ),
                          BoxHelper.create(context: context,height: 25.0),
                          SizedBox(
                            height: 45.0,
                            width: BoxHelper.fullWidth(context),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: .3,
                                  backgroundColor: Color(0xFFFEE8E6)
                              ),
                              onPressed: () async{

                              },
                              child: Center(
                                  child:TextHelper.create(text:"رفض",weight: FontWeight.w600,color: Color(0xFFEE0505),size: 14.0,)
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                ),
              ],
            ),
          ),
          AlignPositioned(
            dy: -10.0,
            alignment: Alignment.bottomCenter,
            child: AppFooter(

            ),
          )
        ],
      )
    );
}
 }
