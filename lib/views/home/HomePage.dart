import 'package:dzid/constants/colors.dart';
import 'package:dzid/helpers/BoxHelper.dart';
import 'package:dzid/helpers/TextHelper.dart';
import 'package:dzid/utils/SizeConfig.dart';
import 'package:dzid/views/home/components/AccessHistoryItem.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundColor2,
      appBar: AppBar(
        elevation: .2,
        leading: IconButton(onPressed: (){}, icon:SizedBox()),
        centerTitle: true,
        title: Image.asset("assets/images/applogo.png",height: 28.0,)
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BoxHelper.create(context: context,height: 25.0),
              TextHelper.create(text: "مرحبًا بك، أيها المواطن",weight: FontWeight.w600,size: SizeConfig.fontSize(22.0),color: CustomColors.textColor),
              BoxHelper.create(context: context,height: 5.0),
              TextHelper.create(text: "مرحباً بك في تطبيق هويتي",weight: FontWeight.w500,size: SizeConfig.fontSize(15.0),color: CustomColors.grayColor4),
              BoxHelper.create(context: context,height: 30.0),
              TextHelper.create(text: "سجل محاولات تسجيل الدخول",weight: FontWeight.w600,size: SizeConfig.fontSize(14.0),color: CustomColors.textColor),
              BoxHelper.create(context: context,height: 10.0),
              ListView.builder(
                itemCount: 3,
                shrinkWrap: true,
                itemBuilder: (context,index){
                  return AccessHistoryItem(
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
