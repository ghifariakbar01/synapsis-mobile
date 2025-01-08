import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../features/auth/data/repo/login_repository_impl.dart';

part 'init_event.dart';
part 'init_state.dart';

class InitBloc extends Bloc<InitEvent, InitState> {
  final LoginRepositoryImpl _loginRepositoryImpl;
  InitBloc(this._loginRepositoryImpl) : super(Initial()) {
    on<StartAppEvent>((event, emit) async {
      final isLoggedIn = await _loginRepositoryImpl.isLoggedIn;
      print('isLoggedIn: ${isLoggedIn}');

      if (isLoggedIn) {
        emit(Auth());
      } else {
        emit(Unauth());
      }
    });
  }
}
