import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
class Helper {
  static  String convertDate(String? inputDate) {
    if(inputDate==""){
      return "";
    } else{
      DateTime dateTime = DateTime.parse(inputDate!);
      String formattedDate = DateFormat('dd-MM-yyyy').format(dateTime);
      return formattedDate;
    }
  }

  static  String convertDateTime(String inputDate) {
    if(inputDate.isEmpty){
      return "";
    }
    DateTime dateTime = DateTime.parse(inputDate);
    String formattedDate = DateFormat('dd-MM-yyyy hh-mm-ss').format(dateTime);
    return formattedDate;
  }

  static String convertMapToFormUrlEncoded(Map<String, String> map) {
    return map.entries
        .map((entry) =>
    '${Uri.encodeComponent(entry.key)}=${Uri.encodeComponent(entry.value)}')
        .join('&');
  }

  static String getDateTimeNow(bool date, bool time){
    {
      DateTime now = DateTime.now();

      String formattedDate = DateFormat('yyyy-MM-dd').format(now);
      print('Tanggal: $formattedDate');

      String formattedTime = DateFormat('HH:mm:ss').format(now);
      print('Waktu: $formattedTime');

      if (date && time){
        return "$formattedDate $formattedTime";
      } else if(date){
        return formattedDate;
      } else if (time){
        return formattedTime;
      } else{
        return "";
      }
    }
  }

  static bool validate(GlobalKey<FormState> form) {
    if (form.currentState!.validate()){
      return true;
    }
    return false;
  }
}