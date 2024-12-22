import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_sliding_toast/flutter_sliding_toast.dart';
import 'package:intl/intl.dart' as Intl;

import 'package:permission_handler/permission_handler.dart';

import '../constants/colors.dart';
import '../helpers/TextHelper.dart';
import '../utils/DioInterceptor.dart';

class GlobalService{
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  final Dio _dio = DioInterceptor().instance();
  requestNotificationPermission() async{
    var status = await Permission.notification.status;
    if(status.isDenied){
      await Permission.notification.request();
    }
  }
  static void handleBackgroundNotification(NotificationResponse response){
    print("Notification: Background");
  }
  showNotification({required title,required body,required notificationsId}) async{
    const AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails("notif-99", "manager_notification",
        importance: Importance.max,
        priority: Priority.high);
    NotificationDetails notificationDetails = NotificationDetails(android: androidNotificationDetails);
    await flutterLocalNotificationsPlugin.show(0, "$title", "$body", notificationDetails);
  }
  showToast({required context,required title,required type}){
    InteractiveToast.slide(
        context,
        title: TextHelper.create(text:title, size: 10.0,weight: FontWeight.w600,alignment: TextAlign.center),
        toastSetting: const SlidingToastSetting(
          animationDuration: Duration(seconds: 1),
          displayDuration: Duration(seconds: 4),
          toastStartPosition: ToastPosition.top,
          toastAlignment: Alignment.topCenter,
        ),
        toastStyle: ToastStyle(titleLeadingGap: 10,progressBarColor: type == "success" ? CustomColors.greenColor : (type == "warning" ? CustomColors.yellowColor : CustomColors.danger)),

    );
  }
  String formatDate({required date}){
    DateTime parsedDate = DateTime.parse(date);
    return Intl.DateFormat('yyyy-MM-dd : HH:mm').format(parsedDate.toLocal());
  }

}