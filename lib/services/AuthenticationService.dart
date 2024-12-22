import 'dart:async';
import 'dart:math';

import 'package:dzid/services/GlobalService.dart';
import 'package:flutter/material.dart';

class AuthenticationService with ChangeNotifier{
  //check the NIN
  bool ninLoading = false;
  bool get getNinLoading => ninLoading;
  bool checkLoading = false;
  bool get isCheckLoading => checkLoading;
  bool otpLoading = false;
  bool get isOtpLoading => otpLoading;
  bool isPhoneNumberVisible = false;
  bool sendOtp = false;
  bool get isOtpSent => sendOtp;
  bool idSelected = false;
  bool get isIDSelected => idSelected;
  generateOTP({required context}){
    print("generate OTP Code");
    final random = Random();
    final otp = (100000 + random.nextInt(900000)).toString();
/*
    GlobalService().showNotification(title: "رمز OTP", body: "$otpمرحباً\n رمز otp الخاص بك هو:", notificationsId: 1);
*/
    sendOtp = true;
    notifyListeners();


  }
  verifyOTP({required context}){

  }
  updateIDSelection(value){
    idSelected = value;
    notifyListeners();
  }
  updatePhoneNumberVisibleState(state) async{
    ninLoading = true;
    notifyListeners();
    Future.delayed(Duration(seconds: 1),(){
      isPhoneNumberVisible = state;
      ninLoading = false;
      notifyListeners();
    });

  }
}