import '../../data/dto/device_dto.dart';

class Device {
  final String id;
  final DeviceDto device;

  Device(this.id, this.device);

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'device': device.toJson(),
    };
  }

  factory Device.fromJson(Map<String, dynamic> map) {
    return Device(
      (map['id'] ?? '') as String,
      DeviceDto.fromJson(map['device'] as Map<String, dynamic>),
    );
  }
}
