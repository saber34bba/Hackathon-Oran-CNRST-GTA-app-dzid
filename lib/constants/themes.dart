import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

class Themes {
  static final defaultPinTheme = PinTheme(
    width: 50,
    height: 56,
    textStyle: GoogleFonts.poppins(
      fontSize: 17,
      color: const Color.fromRGBO(30, 60, 87, 1),
    ),
    margin: EdgeInsets.symmetric(horizontal: 7.0),
    decoration: BoxDecoration(
      color: Color.fromRGBO(222, 231, 240, .57),
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: Colors.transparent),
    ),
  );
  static const PinBorderColor = Color.fromRGBO(114, 178, 238, 1);
  static const PinErrorColor = Color.fromRGBO(255, 234, 238, 1);
  static const PinFillColor = Color.fromRGBO(222, 231, 240, .57);
}