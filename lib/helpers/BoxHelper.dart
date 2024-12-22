import 'package:flutter/cupertino.dart';

class BoxHelper{
  static create({required context,height,width}){
    return SizedBox(height: height ?? 25.0,width: width ?? MediaQuery.of(context).size.width,);
  }
  static fullWidth(context){
    return MediaQuery.of(context).size.width;
  }
  static fullHeight(context){
    return MediaQuery.of(context).size.height;
  }
}