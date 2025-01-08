import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../data/datasources/on_duty_datasource.dart';
import '../../data/dto/message_dto.dart';

// import '../../domain/entities/on_duty_tablet.dart';
// import '../../domain/usecases/on_duty_usecase.dart';

part 'on_duty_event.dart';
part 'on_duty_state.dart';

class OnDutyBloc extends Bloc<OnDutyEvent, OnDutyState> {
  final OnDutyDatasource datasource;

  OnDutyBloc(this.datasource) : super(Initial()) {
    on<Subscribe>((event, emit) async {
      emit(Loading());

      try {
        datasource.subscribeToWebSocket(onError: (error) {
          print("WebSocket error: $error");

          if (error is WebSocketChannelException) {
            if (error.inner != null) {
              final err = error.inner as dynamic;
              emit(Error('Websocket inner error: ${err.message.toString()}'));
            }
            emit(Error('Websocket error: ${error.message}'));
          }
        });

        emit(Success());
      } catch (e) {
        emit(Error('Failed to subscribe. Detail : $e'));
      }
    });

    on<Fetch>((event, emit) async {
      emit(Loading());

      try {
        final msg = await datasource.messages();

        emit(Full(msg));
      } catch (e) {
        emit(Error('Failed to fetch. Detail : $e'));
      }
    });

    on<Close>((event, emit) async {
      emit(Loading());

      try {
        datasource.closeWebSocket();

        emit(Success());
      } catch (e) {
        emit(Error('Failed to close. Detail : $e'));
      }
    });
  }
}
