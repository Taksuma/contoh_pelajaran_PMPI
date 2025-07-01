part of 'update_table_resto_bloc.dart';

@immutable
sealed class UpdateTableRestoEvent {}

final class UpdateTableRestoPressed extends UpdateTableRestoEvent {
  final int id;
  final TableRestoParam tableRestoParam;

  UpdateTableRestoPressed({required this.id, required this.tableRestoParam});
}