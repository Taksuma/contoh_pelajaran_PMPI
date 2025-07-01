class TableRestoCreate {
  final int? id;
  final String? code;
  final String? name;
  final int? capacity;
  final String? tableStatus;
  final int? status;

  TableRestoCreate({
    required this.id,
    required this.code,
    required this.name,
    required this.capacity,
    required this.tableStatus,
    required this.status,
  });

  factory TableRestoCreate.fromJson(Map<String, dynamic> json) {
    return TableRestoCreate(
      id: json['id'],
      code: json['code'],
      name: json['name'],
      capacity: json['capacity'],
      tableStatus: json['tableStatus'],
      status: json['status'],
    );
  }
}
