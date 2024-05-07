import 'package:dio/dio.dart';

extension DioExstensions on Dio {
  Dio askHandBaseUrl() {
    options.baseUrl = 'https://localhost:44319/api/';
    return this;
  }

  Dio askHandAuthorization(String token) {
    options.headers['Authorization'] = 'Bearer $token';
    return this;
  }
}
