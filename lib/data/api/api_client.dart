import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/utils/app_constants.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token;
  final String appBaseUrl;

  late Map<String, String> _mainHeaders;

  ApiClient({required this.appBaseUrl}) {
    //ham khoi tao  
    baseUrl = appBaseUrl;
    timeout = Duration(seconds: 30);
    token = AppConstains.TOKEN;
    _mainHeaders = {
      'Content-type': 'application/json; c  harset = UTF-8',
      'Authorization': 'Bearer $token',
    };
  }

  //Phương thức lấy dữ liệu
  Future<Response> getData(
    String uri,
  ) async {
    try {
      Response response = await get(uri);
      return response;
    } catch (e) {
      return Response(
        statusCode: 1,
        statusText: e.toString(),
      );
    }
  }
}
