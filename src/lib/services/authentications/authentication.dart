import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:src/models/authentications/login.dart';
import 'package:src/models/authentications/register.dart';
import 'package:src/utils/error_handling/error.dart';
import 'package:src/utils/error_handling/result.dart';
import 'package:src/utils/exstensions/dio.dart';

class AuthenticationService {
  final authentication = 'Authentication';
  final key = 'Token';
  final sessionExpiredMessage = 'Your session as expired';
  final storage = const FlutterSecureStorage();

  Future<bool> register({required RegisterModel registerModel}) async {
    final baseUrl = Dio().askHandBaseUrl();
    try {
      var response = await baseUrl.post('$authentication/Register', data: registerModel.toJson());
      storeToken(token: response.data[key]);
      return true;
    } on DioError {
      return false;
    }
  }

  Future<bool> login({required LoginModel loginModel}) async {
    final baseUrl = Dio().askHandBaseUrl();
    try {
      var response = await baseUrl.post('$authentication/Login', data: { loginModel.toJson() });
      storeToken(token: response.data[key]);
      return true;
    } on DioError {
      return false;
    }
  }

  Future<void> storeToken({required String token}) async {
    await storage.write(key: key, value: token);
  }

  Future<Result<String>> retrieveToken(BuildContext context) async {
    var token = await storage.read(key: key);
    if (token == null) {
      return Result.failure(Error('test', 'test'));
    }

    return Result.success(token);
  }
}
