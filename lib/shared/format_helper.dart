import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FormatHelper {
  static String formatN0(BuildContext context, double number) {
    if (number == null) number = 0.0;
    var formatter = NumberFormat.decimalPattern();
    return formatter.format(number);
  }

  static String formatN2(BuildContext context, double number) {
    if (number == null) number = 0.00;
    var formatter = NumberFormat.decimalPattern();
    return formatter.format(number);
  }

  static String formatDate(String? strDateTime) {
    if (strDateTime == null || strDateTime.isEmpty) return "";

    var dateTime = new DateFormat("dd.MM.yyyy").parse(strDateTime);
    return dateTime.day.toString() + "." + dateTime.month.toString() + "." + dateTime.year.toString();
  }
}
