import 'package:dzid/components/AppLogo.dart';
import 'package:dzid/helpers/BoxHelper.dart';
import 'package:dzid/helpers/TextHelper.dart';
import 'package:dzid/services/AuthenticationService.dart';
import 'package:dzid/services/GlobalService.dart';
import 'package:dzid/utils/SizeConfig.dart';
import 'package:dzid/views/authentication/components/OTPLayoutWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sliding_toast/flutter_sliding_toast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({super.key});

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  int state = 0;
  bool isConfirmed = false;
  final ninController = TextEditingController(text: "");
  final phoneNumberController = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundColor2,
      body: SizedBox(
        height: BoxHelper.fullHeight(context),
        width: BoxHelper.fullWidth(context),
        child: Consumer<AuthenticationService>(
          builder: (context,service,child){
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BoxHelper.create(context: context,height: SizeConfig.scaleHeightValue(140.0)),
                  AppLogo(height: 110.0, width: 110.0),
                  BoxHelper.create(context: context,height: 60.0),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: SizeConfig.scaleWidthValue(25)),
                    child: !service.isOtpSent ? Container(
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
                          TextHelper.create(text: "مرحبًا بك!",weight: FontWeight.w600,size: SizeConfig.fontSize(20.0)),
                          BoxHelper.create(context: context,height: 20.0),
                          TextHelper.create(text: "أدخل رقم الهوية الوطنية الخاص بك للمتابعة",weight: FontWeight.w500,size:  SizeConfig.fontSize(16.0)),
                          BoxHelper.create(context: context,height: 5.0),
                          TextHelper.create(text: "رقم الهوية الوطنية الخاص بك يساعدنا في التحقق من هويتك بأمان وسرعة",weight: FontWeight.w500,size: SizeConfig.fontSize(14.0)),
                          BoxHelper.create(context: context,height: 30.0),
                          Directionality(
                              textDirection: TextDirection.rtl,
                              child:Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextHelper.create(alignment: TextAlign.start,text: "أدخل رقم الهوية الوطنية (NIN)", size:  SizeConfig.fontSize(14.0),weight: FontWeight.w500,color: CustomColors.textColor2),
                                  BoxHelper.create(context: context,height: 15.0),
                                  Container(
                                    height: 45.0,
                                    width: BoxHelper.fullWidth(context),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5.0),
                                      border: Border.all(color: CustomColors.grayColor4.withOpacity(.22), width: .8),
                                      boxShadow: [
                                        BoxShadow(color: CustomColors.grayColor1.withOpacity(.2), blurRadius: 15.0, spreadRadius: 10.0)
                                      ],
                                    ),
                                    child: TextFormField(
                                        enabled: service.isPhoneNumberVisible ? false : true,
                                        keyboardType: TextInputType.number,
                                        textInputAction: TextInputAction.next,
                                        controller: ninController,
                                        maxLength: 80, // Adjusted maximum length
                                        style: GoogleFonts.poppins(
                                          fontSize: SizeConfig.fontSize(16.0),
                                          fontWeight: FontWeight.w500,
                                        ),
                                        autovalidateMode: AutovalidateMode.onUserInteraction,

                                        decoration: InputDecoration(
                                            counterText: "",
                                            border: InputBorder.none,
                                            hintText: "مثال: 06 60 47 85 75",
                                            hintStyle: GoogleFonts.poppins(
                                                fontSize: SizeConfig.fontSize(15.0),
                                                fontWeight: FontWeight.w500,
                                                color: CustomColors.grayColor3
                                            ),
                                            contentPadding: const EdgeInsets.only(bottom: 7.0,left: 10.0,right: 10.0)
                                        ),
                                        textDirection: TextDirection.rtl
                                    ),
                                  ),
                                  service.isPhoneNumberVisible ? Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      BoxHelper.create(context: context,height: 20.0),
                                      TextHelper.create(alignment: TextAlign.start,text: "أدخل رقم الهاتف المحمول", size:  SizeConfig.fontSize(14.0),weight: FontWeight.w500,color: CustomColors.textColor2),
                                      BoxHelper.create(context: context,height: 10.0),
                                      Container(
                                        height: 45.0,
                                        width: BoxHelper.fullWidth(context),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(5.0),
                                          border: Border.all(color: CustomColors.grayColor4.withOpacity(.22), width: .8),
                                          boxShadow: [
                                            BoxShadow(color: CustomColors.grayColor1.withOpacity(.2), blurRadius: 15.0, spreadRadius: 10.0)
                                          ],
                                        ),
                                        child: TextFormField(
                                            controller: phoneNumberController,
                                            keyboardType: TextInputType.number,
                                            textInputAction: TextInputAction.next,
                                            maxLength: 80, // Adjusted maximum length
                                            style: GoogleFonts.poppins(
                                              fontSize:SizeConfig.fontSize(16.0),
                                              fontWeight: FontWeight.w500,
                                            ),
                                            autovalidateMode: AutovalidateMode.onUserInteraction,
                                            decoration: InputDecoration(
                                              /*                 prefix: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            BoxHelper.create(context: context,width: 4.0),
                                            TextHelper.create(text: "+213",weight: FontWeight.w600), BoxHelper.create(context: context,width: 4.0),
                                            Icon(Icons.arrow_drop_down),
                                          ],
                                        ),*/
                                                counterText: "",
                                                border: InputBorder.none,
                                                hintText: "06 60 61 62 41",
                                                hintStyle: GoogleFonts.poppins(
                                                    color: CustomColors.grayColor2,
                                                    fontSize: SizeConfig.fontSize(16.0)
                                                ),
                                                contentPadding: const EdgeInsets.only(bottom: 7.0,left: 10.0,right: 10.0)
                                            ),
                                            textDirection: TextDirection.rtl
                                        ),
                                      ),
                                    ],
                                  ) : SizedBox(),
                                  BoxHelper.create(context: context,height: 20.0),
                                  SizedBox(
                                    height: 45.0,
                                    width: BoxHelper.fullWidth(context),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: CustomColors.primary,
                                      ),
                                      onPressed: (){
                                        if(ninController.value.text.isEmpty){
                                          return GlobalService().showToast(context: context, title: "يرجى إدخال رقم الهوية الوطنية", type: "warning");
                                        }
                                        RegExp regex = RegExp(r'^\d{18}$');
                                        print(regex.hasMatch(ninController.value.text));
                                        if(!regex.hasMatch(ninController.value.text)){
                                          return GlobalService().showToast(context: context, title: "يرجى إدخال رقم الهوية الوطنية الصحيح", type: "warn");
                                        }
                                        if(service.isPhoneNumberVisible){
                                          if(phoneNumberController.value.text.isEmpty){
                                            return GlobalService().showToast(context: context, title: "الرجاء إدخال رقم الهاتف", type: "warn");
                                          }
                                          RegExp regex = RegExp(r'^\d{10}$');
                                          if(!regex.hasMatch(phoneNumberController.value.text)){
                                            return GlobalService().showToast(context: context, title:"يُرجى إدخال رقم هاتف صحيح", type: "warn");
                                          }
                                        }
                                        if(service.isPhoneNumberVisible){
                                          service.generateOTP(context: context);
                                        }
                                        service.updatePhoneNumberVisibleState(true);
                                      },
                                      child: Center(
                                          child: !service.getNinLoading ? TextHelper.create(text: "تحقق",weight: FontWeight.w600,color: Colors.white,size: SizeConfig.scaleHeightValue(13.0)) : SizedBox(
                                            height: 25.0,
                                            width: 25.0,
                                            child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white),),
                                          )
                                      ),
                                    ),
                                  ),

                                ],
                              )
                          )
                        ],
                      ),
                    ) : OTPLayoutWidget(),
                  ),
                ],
              ),
            );
          },
        )
      ),
    );
  }
}
