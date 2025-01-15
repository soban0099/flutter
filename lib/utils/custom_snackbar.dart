import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../utils/styles.dart';

class CustomSnackBar {
  static show(String message, {bool showOnTop = true, bool increaseDuration = false}) {
    Fluttertoast.showToast(msg: message, toastLength: increaseDuration ? Toast.LENGTH_LONG : Toast.LENGTH_SHORT, gravity: showOnTop ? ToastGravity.TOP : ToastGravity.BOTTOM, timeInSecForIosWeb: 1, backgroundColor: Styles.black, textColor: Colors.white, fontSize: 16.0);
  }
}
