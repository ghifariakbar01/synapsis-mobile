import 'package:bloc/bloc.dart';

class LoginCubit extends Cubit<String> {
  LoginCubit() : super('32750418');

  update(String newText) {
    emit(newText);
  }
}
