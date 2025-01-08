import '../entities/device.dart';

abstract class DeviceManagementRepository {
  Future<bool> register({required String id, required String snHeadUnit});
  Future<Device> deviceBy({required String id});
  Future<Device?> fromStorage();
  Future<bool> activate({required String id});
}
