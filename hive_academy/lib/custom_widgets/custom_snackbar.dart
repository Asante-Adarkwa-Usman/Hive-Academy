import 'package:flutter/material.dart';
import 'package:get/get.dart';

customSnackbar(String title, String message, String type) {
  return GetSnackBar(
      title: title,
      message: message,
      backgroundColor:
          type == 'error' ? Colors.redAccent : Colors.grey.shade800,
      snackPosition: SnackPosition.BOTTOM,
      snackStyle: SnackStyle.GROUNDED,
      duration: const Duration(seconds: 6));
}
