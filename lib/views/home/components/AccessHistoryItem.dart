import 'package:dzid/helpers/BoxHelper.dart';
import 'package:dzid/helpers/TextHelper.dart';
import 'package:dzid/utils/SizeConfig.dart';
import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class AccessHistoryItem extends StatelessWidget {
  const AccessHistoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15.0),
      padding: EdgeInsets.symmetric(horizontal: 25.0,vertical: 15.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(color: CustomColors.grayColor1.withOpacity(.22),blurRadius: 20.0,spreadRadius: 12.0)
          ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                decoration: BoxDecoration(
                  color: Color(0xFFE6FEED)
                ),
                child: TextHelper.create(text: "مقبول",weight: FontWeight.w600,color: Color(0xFF20BE00)),
              ),
              Expanded(
                child: TextHelper.create(text: "حالة تسجيل الدخول",weight: FontWeight.w600,alignment: TextAlign.start),
              )
            ],
          ),
          BoxHelper.create(context: context,height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextHelper.create(text: "تطبيق الحكومة الرقمية",weight: FontWeight.w500,color: CustomColors.text2,size: SizeConfig.fontSize(12.0)),
              BoxHelper.create(context: context,width: 10.0),
              Icon(Icons.app_blocking),
            ],
          ),
          BoxHelper.create(context: context,height: 15.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextHelper.create(text: "التاريخ: 15 ديسمبر 2024، الساعة 2:45 مساءً",weight: FontWeight.w500,color: CustomColors.text2,size:  SizeConfig.fontSize(12.0)),
              BoxHelper.create(context: context,width: 10.0),
              Icon(Icons.access_time_outlined),
            ],
          ),
        ],
      ),
    );
  }
}
