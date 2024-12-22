import 'package:dzid/views/authentication/components/IDCardScanWidget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

import '../../../constants/colors.dart';
import '../../../helpers/BoxHelper.dart';
import '../../../helpers/TextHelper.dart';
import '../../../utils/SizeConfig.dart';

class OTPLayoutWidget extends StatefulWidget {
  const OTPLayoutWidget({super.key});

  @override
  State<OTPLayoutWidget> createState() => _OTPLayoutWidgetState();
}

class _OTPLayoutWidgetState extends State<OTPLayoutWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
          TextHelper.create(text: "أدخل رمز التحقق",weight: FontWeight.w600,size: 20.0),
          BoxHelper.create(context: context,height: 20.0),
          TextHelper.create(text: "تم إرسال رمز التحقق إلى رقم هاتفك",weight: FontWeight.w500,size: SizeConfig.fontSize(16.0)),
          BoxHelper.create(context: context,height: 25.0),
          SizedBox(
            child: Pinput(
              focusedPinTheme: PinTheme(
                  height: SizeConfig.scaleHeightValue(57),
                  width: SizeConfig.scaleWidthValue(57),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8), // Scaled corners
                    border: Border.all(color: CustomColors.primary,width: 3 ),

                  ),
                  textStyle: GoogleFonts.inter(
                      fontSize: SizeConfig.fontSize(30.34),
                      fontWeight: FontWeight.w600,
                      color:CustomColors.primary
                  )
              ),
              submittedPinTheme: PinTheme(
                  height: SizeConfig.scaleHeightValue(57),
                  width: SizeConfig.scaleWidthValue(57),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8), // Scaled corners
                    border: Border.all(color: CustomColors.primary,width: 3 ),

                  ),
                  textStyle: GoogleFonts.inter(
                      fontSize: SizeConfig.fontSize(30.34),
                      fontWeight: FontWeight.w600,
                      color:CustomColors.primary
                  )
              ),
              errorPinTheme: PinTheme(
                  height: SizeConfig.scaleHeightValue(57),
                  width: SizeConfig.scaleWidthValue(57),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8), // Scaled corners
                    border: Border.all(color: CustomColors.danger,width: 3 ),

                  ),
                  textStyle: GoogleFonts.inter(
                      fontSize: SizeConfig.fontSize(30.34),
                      fontWeight: FontWeight.w600,
                      color:CustomColors.danger
                  )
              ),
              preFilledWidget: TextHelper.create(
                  text: "0",
                  weight: FontWeight.w600,
                  size: SizeConfig.fontSize(30.34),
                  color: CustomColors.grayColor1
              ),
              defaultPinTheme: PinTheme(
                  height: SizeConfig.scaleHeightValue(57),
                  width: SizeConfig.scaleWidthValue(57),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8), // Scaled corners
                    border: Border.all(color: CustomColors.grayColor2),
                  ),
                  textStyle: GoogleFonts.inter(
                      fontSize: SizeConfig.fontSize(30.34),
                      fontWeight: FontWeight.w600,
                      color:CustomColors.grayColor1
                  )
              ),
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              length: 5,
              separatorBuilder: (index){
                return SizedBox(width: SizeConfig.scaleWidthValue(16));
              },
            ),
          ),
          BoxHelper.create(context: context,height: 25.0),
          SizedBox(
            height: 45.0,
            width: BoxHelper.fullWidth(context),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: CustomColors.primary,
              ),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>IDCardScan()));
              },
              child: Center(
                  child:TextHelper.create(text: "تحقق",weight: FontWeight.w600,color: Colors.white,size: 14.0)
              ),
            ),
          ),
          BoxHelper.create(context: context,height: 15.0),
          TextHelper.create(text: "إعادة إرسال الرمز",weight: FontWeight.w500,size: 14.0,color: CustomColors.primary),
          BoxHelper.create(context: context,height: 15.0),
        ],
      ),
    );
  }
}
