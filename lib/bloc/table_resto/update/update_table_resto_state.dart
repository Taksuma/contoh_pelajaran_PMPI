part of 'update_table_resto_bloc.dart';

@immutable
sealed class UpdateTableRestoState {}

final class UpdateTableRestoInitial extends UpdateTableRestoState {}

final class UpdateTableRestoLoading extends UpdateTableRestoState {}

// Kita bisa gunakan response yang sama dari create
final class UpdateTableRestoSuccess extends UpdateTableRestoState {
  final TableRestoCreateResponse tableRestoCreateResponse;
  UpdateTableRestoSuccess({required this.tableRestoCreateResponse});
}

final class UpdateTableRestoError extends UpdateTableRestoState {
  final String message;
  UpdateTableRestoError({required this.message});
}