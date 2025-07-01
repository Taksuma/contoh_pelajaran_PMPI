import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:project_flutter/repo/table_resto_repository.dart';
import 'package:meta/meta.dart';
import 'package:project_flutter/models/table_resto_model.dart';

part 'get_table_resto_event.dart';
part 'get_table_resto_state.dart';

class GetTableRestoBloc extends Bloc<GetTableRestoEvent, GetTableRestoState> {
  final tableRestoRepository = TableRestoRepository();

  GetTableRestoBloc() : super(GetTableRestoInitial()) {
    on<TableRestoFetched>(_onTableRestoFetched);
  }

  FutureOr<void> _onTableRestoFetched(
      TableRestoFetched event,
      Emitter<GetTableRestoState> emit,
      ) async {
    emit(GetTableRestoLoading());
    try {
      List<TableRestoModel> list = await tableRestoRepository.getTableRestos();
      emit(GetTableRestoLoaded(listTableResto: list));
    } catch (e) {
      emit(GetTableRestoError(message: e.toString()));
    }
  }
}
