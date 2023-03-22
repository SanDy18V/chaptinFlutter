import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Utils {
  static String appname ="Chat Box";
  showInvaliedtoastMessge(String message){
    Get.snackbar(appname, message ,
        snackPosition: SnackPosition.BOTTOM,
        icon: const Icon(Icons.error, color: Colors.red),
        backgroundColor: Colors.white,
        colorText: Colors.black);
  }
  var primaryfont = TextStyle();
}