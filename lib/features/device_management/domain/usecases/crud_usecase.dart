import '../../data/repo/device_management_repository_impl.dart';
import '../entities/device_register.dart';

class CrudUsecase {
  final DeviceManagementRepositoryImpl repository;

  CrudUsecase(this.repository);

  Future<bool> get hasStorage => repository.hasStorage;

  Future<bool> register(DeviceRegister register) {
    return repository.register(
      id: register.id,
      snHeadUnit: register.snHeadUnit,
    );
  }

  Future<bool> activate(String id) {
    return repository.activate(id: id);
  }
}
