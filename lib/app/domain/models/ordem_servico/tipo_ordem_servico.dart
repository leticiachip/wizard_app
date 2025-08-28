import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wizard_app/app/domain/models/ordem_servico/workflow.dart';
import 'package:wizard_app/app/domain/models/veiculo/veiculo.dart';
part 'tipo_ordem_servico.freezed.dart';
part 'tipo_ordem_servico.g.dart';

@freezed
abstract class TipoOrdemServico with _$TipoOrdemServico {
  const factory TipoOrdemServico({
    required int? id,
    required String? idOrdem,
    required int tipo,
    required int descricaoTipo,
    required Veiculo veiculo,
    required WorkFlow workflow,
  }) = _TipoOrdemServico;

  factory TipoOrdemServico.fromJson(Map<String, Object?> json) =>
      _$TipoOrdemServicoFromJson(json);
}
