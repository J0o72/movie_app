import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiService {
  final String _baseURL = 'https://api.themoviedb.org/3/';
  // final String _apiKey = 'fe8e2816d6b03b41e25ea3a9690c07b0';
  final String token =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmZThlMjgxNmQ2YjAzYjQxZTI1ZWEzYTk2OTBjMDdiMCIsIm5iZiI6MTcyODkwOTE3Mi41NTczMjcsInN1YiI6IjY2ZjJjZDhhMDMxNWI5MWY0NjNiNzJhNyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Vrvq4WgI2nLNtPHvqmCCIXXjTidraR_-oLHb_SlWv3k';
  final Dio _dio;

  ApiService(this._dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get('$_baseURL$endPoint',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'accept': 'application/json',
            'content-type': 'application/json',
          },
        ));
    return response.data;
  }

  Future<void> post({required String endPoint, @required dynamic body}) async {
    var response = await _dio.post(
      '$_baseURL$endPoint',
      data: body,
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
          'accept': 'application/json',
          'content-type': 'application/json',
        },
      ),
    );
    print('${response.data}');
  }
}
