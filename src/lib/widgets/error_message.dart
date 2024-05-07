import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ErrorMessage {
  static const int errorDuration = 3;

  static void displayDioError(DioError error, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('An error occured: ${error.message}'),
        duration: const Duration(seconds: errorDuration),
      ),
    );
  }

  static void displayError(String error, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(error),
        duration: const Duration(seconds: errorDuration),
      ),
    );
  }
}