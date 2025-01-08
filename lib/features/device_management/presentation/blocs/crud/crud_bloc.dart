import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/device_register.dart';
import '../../../domain/usecases/crud_usecase.dart';

part 'crud_event.dart';
part 'crud_state.dart';

class CrudBloc extends Bloc<CrudEvent, CrudState> {
  final CrudUsecase crudUsecase;

  CrudBloc(this.crudUsecase) : super(Initial()) {
    on<RegisterEvent>((event, emit) async {
      emit(Loading());

      try {
        final isSuccess = await crudUsecase.register(event.register);
        if (isSuccess) {
          emit(SuccessRegister());
        } else {
          emit(Error('Failed to register.'));
        }
      } catch (e) {
        emit(Error('Failed to register. Detail : $e'));
      }
    });

    on<ActivateEvent>((event, emit) async {
      emit(Loading());

      try {
        final isSuccess = await crudUsecase.activate(event.id);
        if (isSuccess) {
          emit(SuccessActivate());
        } else {
          emit(Error('Failed to activate.'));
        }
      } catch (e) {
        emit(Error('Failed to activate. Detail : $e'));
      }
    });
  }
}
