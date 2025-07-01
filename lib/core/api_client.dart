import 'package:dio/dio.dart';

abstract class ApiClient{
  final Dio _dio = Dio();

  ApiClient(){
    _dio.options.headers['content-type'] = 'application/json';
    _dio.options.baseUrl = 'http://10.0.0.2:8000/api/';
  }
  Dio get dio => _dio;
}