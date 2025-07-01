import 'package:project_flutter/response/table_resto_create.dart';

class TableRestoCreateResponse {
  final TableRestoCreate? tableRestoCreate;
  final String message;

  TableRestoCreateResponse(
      {required this.tableRestoCreate, required this.message});

  factory TableRestoCreateResponse.fromJson(Map<String, dynamic> json) {
    TableRestoCreate? tableRestoCreate;
    return TableRestoCreateResponse(
      tableRestoCreate: json['data'] != null
          ? TableRestoCreate.fromJson(json['data'])
          : tableRestoCreate,
      message: json['message'],
    );
  }
}
