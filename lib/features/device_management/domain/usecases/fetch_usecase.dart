import '../../data/repo/device_management_repository_impl.dart';
import '../entities/device.dart';

class FetchUsecase {
  final DeviceManagementRepositoryImpl repository;

  FetchUsecase(this.repository);

  Future<Device> deviceBy({required String id}) {
    return repository.deviceBy(id: id);
  }

  Future<Device?> fromStorage() {
    return repository.fromStorage();
  }
}
