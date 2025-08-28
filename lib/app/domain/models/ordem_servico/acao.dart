import 'package:freezed_annotation/freezed_annotation.dart';

import '../veiculo/veiculo.dart';
import 'opcao_checklist.dart';
part 'acao.freezed.dart';
part 'acao.g.dart';

@freezed
abstract class Acoes with _$Acoes {
  const factory Acoes({
    required int? id,
    required int? tipo,
    required String descricaoTipo,
    required Veiculo veiculo,
    required List<OpcaoChecklist> checlist,
    required int typeTextField,
    required String descricao,
    required int capturaFotoHabilitado,
    required String descricaoEnvioFoto,
    required int qtdMaximaFoto,
    required int qtdMinimaFoto,
  }) = _Acoes;

  factory Acoes.fromJson(Map<String, Object?> json) =>
      _$AcoesFromJson(json);
}