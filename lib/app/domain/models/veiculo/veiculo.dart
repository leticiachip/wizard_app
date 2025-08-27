import 'package:freezed_annotation/freezed_annotation.dart';
part 'veiculo.freezed.dart';
part 'veiculo.g.dart';

@freezed
abstract class Veiculo with _$Veiculo {
  const factory Veiculo({
    required int? id,
    required String? montadora,
    required String modelo,
    required int ano,
    required String placa,
  }) = _Veiculo;

  factory Veiculo.fromJson(Map<String, Object?> json) =>
      _$VeiculoFromJson(json);
}
