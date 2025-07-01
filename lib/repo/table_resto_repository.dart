import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:project_flutter/core/api_client.dart';
import 'package:project_flutter/models/param/table_resto_param.dart';
import 'package:project_flutter/models/table_resto_model.dart';
import 'package:project_flutter/response/table_resto_create_response.dart';


class TableRestoRepository extends ApiClient {
  
  // ... (method getTableRestos dan addTableResto yang sudah ada)

  // METHOD BARU UNTUK UPDATE
  Future<TableRestoCreateResponse> updateTableResto(
    int id, // Kita butuh ID untuk tahu data mana yang di-update
    TableRestoParam tableRestoParam,
  ) async {
    try {
      // API endpoint untuk update biasanya menggunakan ID, contoh: 'table-resto-list/1'
      var response = await dio.put(
        'table-resto-list/$id', // Menggunakan method PUT dan menyertakan ID
        data: tableRestoParam.toJson(),
      );
      debugPrint('TableResto PUT (Update) : ${response.data}');
      // Kita bisa menggunakan response model yang sama dengan create
      return TableRestoCreateResponse.fromJson(response.data);
    } on DioException catch (e) {
      // Jika ingin pesan error yang lebih spesifik dari API
      // String errorMessage = e.response?.data['message'] ?? 'Terjadi kesalahan';
      // throw Exception(errorMessage);
      throw Exception(e);
    }
  }
}


  Future<TableRestoCreateResponse> addTableResto(
      TableRestoParam tableRestoParam,
      ) async {
    try {
      //Options _options = Options(headers: {'Authorization': 'Token ...',},);
      var response = await dio.post(
        'table-resto-list',
        //options: _options,
        data: tableRestoParam.toJson(),
      );
      debugPrint('TableResto POST : ${response.data}');
      return TableRestoCreateResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(e);
    }
  }

