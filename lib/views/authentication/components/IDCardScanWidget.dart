import 'package:dzid/services/AuthenticationService.dart';
import 'package:dzid/views/home/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

import '../../../constants/colors.dart';
import '../../../helpers/BoxHelper.dart';
import '../../../helpers/TextHelper.dart';
import '../../../utils/SizeConfig.dart';

class IDCardScan extends StatefulWidget {
  const IDCardScan({super.key});

  @override
  State<IDCardScan> createState() => _IDCardScanState();
}
class _IDCardScanState extends State<IDCardScan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundColor2,
      body: Consumer<AuthenticationService>(
        builder: (context,service,child){
          return Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(

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
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/applogo.png",height: 70.0,width: 70.0,),
                    BoxHelper.create(context: context,height: SizeConfig.scaleHeightValue(32)),
                    TextHelper.create(text: "الخطوة الأخيرة: مسح الهوية الوطنية.",weight: FontWeight.w600,size: 20.0),
                    BoxHelper.create(context: context,height: SizeConfig.scaleHeightValue(32)),
                    TextHelper.create(text: "وجه الكاميرا نحو الهوية الوطنية لتأكيد بياناتك",weight: FontWeight.w500,size: 13.0),
                    BoxHelper.create(context: context,height: 25.0),
                    Container(
                      height: 200.0,
                      width: BoxHelper.fullWidth(context),
                      decoration: BoxDecoration(
                        border: Border.all(color: CustomColors.primary,width: 3.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.image,color: CustomColors.grayColor4,size: 35.0,),
                              BoxHelper.create(context: context,height: 15.0),
                              TextHelper.create(text: "اختيار الملف",weight: FontWeight.w600,size: 14.0),
                            ],
                          )
                      ),
                    ),
                    BoxHelper.create(context: context,height: SizeConfig.scaleHeight),
                    BoxHelper.create(context: context,height: 25.0),
                    !service.isIDSelected ? Row(
                      children: [
                        Expanded(
                          child:  Container(
                            height: 2.0,
                            width: BoxHelper.fullWidth(context),
                            decoration: BoxDecoration(
                                color: CustomColors.grayColor1
                            ),
                          ),
                        ),
                        BoxHelper.create(context: context,width: 7.0,height: 0.0),
                        TextHelper.create(text: "او",weight: FontWeight.w600,size: 13.0,color: CustomColors.grayColor4),
                        BoxHelper.create(context: context,width: 7.0,height: 0.0),
                        Expanded(
                          child: Container(
                            height: 2.0,
                            width: BoxHelper.fullWidth(context),
                            decoration: BoxDecoration(
                                color: CustomColors.grayColor1
                            ),
                          ),
                        ),
                      ],
                    ) : SizedBox(),
                    BoxHelper.create(context: context,height: 25.0),
                    SizedBox(
                      height: 45.0,
                      width: BoxHelper.fullWidth(context),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: CustomColors.primary,
                        ),
                        onPressed: (){
                          service.updateIDSelection(true);
                          if(service.isIDSelected){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
                          }
                        },
                        child: Center(
                            child:TextHelper.create(text:"متابعة",weight: FontWeight.w600,color: Colors.white,size: 14.0)
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      )
    );
  }
}
