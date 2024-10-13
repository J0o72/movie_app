import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiService {
  final String _baseURL = 'https://api.themoviedb.org/3/';
  final String _apiKey = 'fe8e2816d6b03b41e25ea3a9690c07b0';
  final Dio _dio;

  ApiService(this._dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get('$_baseURL$endPoint&api_key=$_apiKey');
    return response.data;
  }

  Future<void> post({required String endPoint, @required dynamic body}) async {
    await _dio.post('$_baseURL$endPoint&api_key=$_apiKey', data: body);
  }
}
