import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/device.dart';
import '../../../domain/usecases/fetch_usecase.dart';

part 'device_event.dart';
part 'device_state.dart';

class DeviceBloc extends Bloc<DeviceEvent, DeviceState> {
  final FetchUsecase useCase;

  DeviceBloc(this.useCase) : super(Initial()) {
    on<FetchEvent>((event, emit) async {
      emit(Loading());

      try {
        final resp = await useCase.deviceBy(id: event.id);

        emit(Loaded(resp));
      } catch (e) {
        emit(Error('Failed to fetch. Detail : $e'));
      }
    });
  }
}
