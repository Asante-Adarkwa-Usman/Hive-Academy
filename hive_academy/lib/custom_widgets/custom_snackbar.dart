import 'package:flutter/material.dart';
import 'package:get/get.dart';

customSnackbar(title, message, type) {
  Get.snackbar(title, message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: type == 'success'
          ? Colors.green
          : type == 'error'
              ? Colors.red
              : Colors.orange,
      borderRadius: 10,
      margin: const EdgeInsets.all(10),
      duration: const Duration(seconds: 3),
      colorText: Colors.white);
}
