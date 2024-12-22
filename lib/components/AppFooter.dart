import 'package:dzid/helpers/TextHelper.dart';
import 'package:dzid/utils/SizeConfig.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';

class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  @override
  Widget build(BuildContext context) {
     return TextHelper.create(text: "IDENTITY v0.1b",weight: FontWeight.w600,size: SizeConfig.fontSize(13.0),color: CustomColors.grayColor4);
  }
}
