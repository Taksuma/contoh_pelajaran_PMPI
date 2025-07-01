part of 'add_table_resto_bloc.dart';

@immutable
sealed class AddTableRestoState {}

final class AddTableRestoInitial extends AddTableRestoState {}

final class AddTableRestoLoading extends AddTableRestoState {}

final class AddTableRestoSuccess extends AddTableRestoState {
  final TableRestoCreateResponse tableRestoCreateResponse;

  AddTableRestoSuccess({required this.tableRestoCreateResponse});
}

final class AddTableRestoError extends AddTableRestoState {
  final String message;

  AddTableRestoError({required this.message});
}
