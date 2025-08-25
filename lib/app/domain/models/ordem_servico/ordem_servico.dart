import 'package:freezed_annotation/freezed_annotation.dart';
part 'ordem_servico.freezed.dart';
part 'ordem_servico.g.dart';

@freezed
abstract class OrdemServico with _$OrdemServico {
  const factory OrdemServico({
    required int id,
    required int idEmpresa,
    required int idEmpresaDestinataria,
    required String numeroPedido,
    required int tipo,
    required int status,
    required String dataHoraInicio,
    required String dataHoraFim,
    required int idVeiculo,
    required int idFuncionario,
    required String prazoFinal,
    required String dataHoraPrazoFinal,
    required int tentativas,
    required String latitude,
    required String longitude,
    required String informacoesAdicionais,
    required String motivoCancelamento,
    required String comentario,
    required String urlAssinaturaDigital,
    required String responsavel,
    required String dataHora,
  }) = _OrdemServico;

  factory OrdemServico.fromJson(Map<String, Object?> json) =>
      _$OrdemServicoFromJson(json);
}
