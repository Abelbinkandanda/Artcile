import 'dart:io';

import 'package:dio/dio.dart';
import 'dart:developer' as dev;

class DioServices {
  var dio = Dio();
  static const String baseUrl =
      "https://abkcorp.000webhostapp.com/article/connection.php";
  Future<Response> post(String url, Map<String, dynamic> body) async {
    url = formater(url);
    var response = await dio.post(url,
        options: Options(
          headers: {
            "Content-type": "application/json",
          },
        ),
        data: body);
    return response;
  }

  Future<Response> get(String url) async {
    url = formater(url);
    var response = await dio.get(url,
        options: Options(headers: {
          "Content-type": "application/json",
        }));
    return response;
  }

  Future<Response> login() async {
    var response = await dio.get(
        "https://abkcorp.000webhostapp.com/article/connection.php",
        options: Options(headers: {
          "Content-type": "application/json",
        }));
    return response;
  }

  Future<Response> patch(String url, dynamic data) async {
    url = formater(url);
    var response = await dio.patch(url,
        options: Options(
          headers: {
            "Content-type": "application/json",
          },
        ),
        data: data);
    return response;
  }

  static String formater(String url) {
    return baseUrl + url;
  }
}
