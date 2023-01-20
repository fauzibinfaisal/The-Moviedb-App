import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:the_moviedb_app/utilities/apiRequestStatus.dart';

class Functions {
  static showSnackBar(String message, String subMessage, IconData icon) {
    Get.snackbar(
      message,
      subMessage,
      padding: EdgeInsets.all(15),
      snackPosition: SnackPosition.BOTTOM,
      margin: EdgeInsets.all(25),
      icon: Icon(icon, size: 21),
    );
  }

  static bool checkConnectionError(e) {
    if (e.toString().contains('SocketException') ||
        e.toString().contains('HandshakeException')) {
      return true;
    } else {
      return false;
    }
  }

  static APIRequestStatus checkError(e) {
    if (Functions.checkConnectionError(e)) {
      return APIRequestStatus.connectionError;
    } else {
      return APIRequestStatus.error;
    }
  }
}
