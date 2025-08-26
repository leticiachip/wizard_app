import 'package:freezed_annotation/freezed_annotation.dart';
part 'etapas_ordem_servico.freezed.dart';
part 'etapas_ordem_servico.g.dart';

@freezed
abstract class EtapasOrdemServico with _$EtapasOrdemServico {
  const factory EtapasOrdemServico({required int? id, required int tipo, required String descricao}) = _Devices;

  factory EtapasOrdemServico.fromJson(Map<String, Object?> json) =>
      _$EtapasOrdemServicoFromJson(json);
}