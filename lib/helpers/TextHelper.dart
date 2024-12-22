import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/colors.dart';

class TextHelper {
  static create({
    required String text,
    double? size,
    FontWeight? weight,
    Color? color,
    TextAlign? alignment,
    TextDirection? direction,
    int? maxLines,
    double? lineHeight,
  }) {
    // Determine if the text is Arabic (you might want to refine this check)
    bool isArabic = RegExp(r'[\u0600-\u06FF]').hasMatch(text);

    return Text(
      text,
      maxLines: maxLines ?? 2,
      overflow: TextOverflow.ellipsis,
      textAlign: alignment ?? TextAlign.center,
      textDirection: direction ?? (isArabic ? TextDirection.rtl : TextDirection.ltr),
      style: TextStyle(
        height: lineHeight,
        fontWeight: weight ?? FontWeight.w500,
        color: color ?? CustomColors.textColor,
        fontSize: size ?? 16.0,
        fontFamily: isArabic ? GoogleFonts.changa().fontFamily : GoogleFonts.poppins().fontFamily,
      ),
    );
  }
}
