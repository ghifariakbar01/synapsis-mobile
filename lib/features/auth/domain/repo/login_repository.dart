import '../entities/login_tablet.dart';

abstract class LoginRepository {
  Future<bool> loginTablet({required LoginTablet item});
  Future<bool> logout();
}
