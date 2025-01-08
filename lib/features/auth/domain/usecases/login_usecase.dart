import '../../data/repo/login_repository_impl.dart';
import '../entities/login_tablet.dart';

class LoginUsecase {
  final LoginRepositoryImpl repository;

  LoginUsecase(this.repository);

  Future<bool> login(LoginTablet item) {
    return repository.loginTablet(item: item);
  }

  Future<bool> logout() {
    return repository.logout();
  }
}
