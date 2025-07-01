import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:project_flutter/core/api_client.dart';
import 'package:project_flutter/models/param/table_resto_param.dart';
import 'package:project_flutter/models/table_resto_model.dart';
import 'package:project_flutter/response/table_resto_create_response.dart';


class TableRestoRepository extends ApiClient {
  Future<List<TableRestoModel>> getTableRestos() async {
    try {
      var response = await dio.get('table-resto-list');
      debugPrint('Table Resto GET ALL : ${response.data}');
      List list = response.data;
      List<TableRestoModel> listTableResto =
      list.map((element) => TableRestoModel.fromJson(element)).toList();
      return listTableResto;
    } on DioException catch (e) {
      throw Exception(e);
      //debugPrint(e.toString());
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
}
