/*
   Discarded - Use postman instead
*/

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/create_unit.dart';
import '../../domain/usecases/unit_management_usecase.dart';

part 'unit_management_event.dart';
part 'unit_management_state.dart';

class UnitManagementBloc
    extends Bloc<UnitManagementEvent, UnitManagementState> {
  final UnitManagementUsecase useCase;

  UnitManagementBloc(this.useCase) : super(Initial()) {
    on<ProcessEvent>((event, emit) async {
      emit(Loading());

      final isSuccess = await useCase.createUnit(item: event.item);

      if (isSuccess) {
        final isSuccess2 = await useCase.exportRoster();

        if (isSuccess2) {
          emit(Success());
        } else {
          emit(Error('Failed to export.'));
        }
      } else {
        emit(Error('Failed to create Unit.'));
      }
    });
  }
}
