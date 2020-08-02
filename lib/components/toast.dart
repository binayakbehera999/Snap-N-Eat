import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:snap_n_eat/utils/constants.dart';

class ToastMsg {
  static showToast(String msg) {
    Fluttertoast.showToast(
        msg: "$msg",
        gravity: ToastGravity.BOTTOM,
        backgroundColor: primaryColor,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
