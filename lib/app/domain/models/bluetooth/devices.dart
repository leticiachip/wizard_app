import 'package:freezed_annotation/freezed_annotation.dart';
part 'devices.freezed.dart';
part 'devices.g.dart';

@freezed
abstract class Devices with _$Devices {
  const factory Devices({required String? nome, required String mac}) = _Devices;

  factory Devices.fromJson(Map<String, Object?> json) =>
      _$DevicesFromJson(json);
}
