import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastShow {
  static void _showToast({
    required String message,
    Color backgroundColor = Colors.black,
    Color textColor = Colors.white,
    ToastGravity gravity = ToastGravity.SNACKBAR,
  }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: gravity,
      timeInSecForIosWeb: 3,
      backgroundColor: backgroundColor,
      textColor: textColor,
      fontSize: 16.0,
      webShowClose: false,
      webPosition: "right",
    );
  }

  static void success({required String message}) {
    _showToast(
      message: message,
      backgroundColor: Colors.green,
      textColor: Colors.white,
    );
  }

  static void error({required String message}) {
    _showToast(
      message: message,
      backgroundColor: Colors.red,
      textColor: Colors.white,
    );
  }

  static void warning({required String message}) {
    _showToast(
      message: message,
      backgroundColor: Colors.orange,
      textColor: Colors.white,
    );
  }

  static void info({required String message}) {
    _showToast(
      message: message,
      backgroundColor: Colors.blue,
      textColor: Colors.white,
    );
  }

  static void custom({
    required String message,
    required Color backgroundColor,
    required Color textColor,
    ToastGravity gravity = ToastGravity.TOP,
  }) {
    _showToast(
      message: message,
      backgroundColor: backgroundColor,
      textColor: textColor,
      gravity: gravity,
    );
  }

  static void close() {
    Fluttertoast.cancel();
  }
}
