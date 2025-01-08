import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/login_tablet.dart';
import '../../domain/usecases/login_usecase.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUsecase useCase;

  LoginBloc(this.useCase) : super(InitialLogin()) {
    on<Login>((event, emit) async {
      emit(LoadingLogin());

      try {
        final isSuccess = await useCase.login(event.item);
        if (isSuccess) {
          emit(SuccessLogin());
        } else {
          emit(ErrorLogin('Failed to login.'));
        }
      } catch (e) {
        emit(ErrorLogin('Failed to login. Detail : $e'));
      }
    });

    on<Logout>((event, emit) async {
      emit(LoadingLogin());

      try {
        final isSuccess = await useCase.logout();
        print('isSuccess: ${isSuccess}');
        if (isSuccess) {
          print('Logout: success');
          emit(SuccessLogout());
        } else {
          emit(ErrorLogin('Failed to logo.'));
        }
      } catch (e) {
        emit(ErrorLogin('Failed to logo. Detail : $e'));
      }
    });
  }
}
