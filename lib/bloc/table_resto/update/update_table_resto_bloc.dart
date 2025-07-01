import 'package:bloc/bloc.dart';
import 'package:project_flutter/models/param/table_resto_param.dart';
import 'package:project_flutter/response/table_resto_create_response.dart';
import 'package:meta/meta.dart';
import 'package:project_flutter/repo/table_resto_repository.dart';

part 'update_table_resto_event.dart';
part 'update_table_resto_state.dart';

class UpdateTableRestoBloc extends Bloc<UpdateTableRestoEvent, UpdateTableRestoState> {
  final tableRestoRepository = TableRestoRepository();

  UpdateTableRestoBloc() : super(UpdateTableRestoInitial()) {
    on<UpdateTableRestoPressed>(_onUpdateTableRestoPressed);
  }

  Future<void> _onUpdateTableRestoPressed(
    UpdateTableRestoPressed event,
    Emitter<UpdateTableRestoState> emit,
  ) async {
    try {
      emit(UpdateTableRestoLoading());
      TableRestoCreateResponse response =
          await tableRestoRepository.updateTableResto(event.id, event.tableRestoParam);
      emit(UpdateTableRestoSuccess(tableRestoCreateResponse: response));
    } catch (e) {
      emit(UpdateTableRestoError(message: e.toString()));
    }
  }
}