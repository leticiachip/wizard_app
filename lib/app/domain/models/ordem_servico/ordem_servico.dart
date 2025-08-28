// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
part 'ordem_servico.freezed.dart';
part 'ordem_servico.g.dart';

@freezed
abstract class OrdemServico with _$OrdemServico {
  factory OrdemServico({
    required int? id,

    @JsonKey(name: 'companyId') required int? idEmpresa,

    @JsonKey(name: 'companyName') required String? nomeEmpresa,

    @JsonKey(name: 'recipientCompanyId') required int? idEmpresaDestinataria,

    @JsonKey(name: 'recipientCompanyName')
    required String? nomeEmpresaDestinaria,

    @JsonKey(name: 'recipientCompanyLegalName')
    required String? nomeLegalEmpresaDestinaria,

    @JsonKey(name: 'orderNumber') required String? numeroPedido,

    @JsonKey(name: 'workflowId') required int? tipo,

    @JsonKey(name: 'workflowName') required String? nomeFluxoTrabalho,

    @JsonKey(name: 'workflowDescription')
    required String? descricaoFluxoTrabalho,

    @JsonKey(name: 'serviceOrderStatusId') required int? status,

    @JsonKey(name: 'serviceOrderStatusDescription')
    required String? descricaoStatusOrdem,

    @JsonKey(name: 'startTimestamp') String? dataHoraInicio,

    @JsonKey(name: 'endTimestamp') String? dataHoraFim,

    @JsonKey(name: 'vehicleId') required int? idVeiculo,

    @JsonKey(name: 'vehicleExternalId') required String? veiculoIdExterno,

    @JsonKey(name: 'vehicleLicensePlate') required String? placaVeiculo,

    @JsonKey(name: 'employeeId') required int? idFuncionario,

    @JsonKey(name: 'employeeFullName') required String? nomeCompletoResposavel,

    @JsonKey(name: 'deadline') required int? prazoFinal,

    @JsonKey(name: 'deadlineTimestamp') required String? dataHoraPrazoFinal,

    @JsonKey(name: 'attempt') required int tentativas,

    @JsonKey(name: 'latitude') required String? latitude,

    @JsonKey(name: 'longitude') required String? longitude,

    @JsonKey(name: 'additionalInformation')
    required String? informacoesAdicionais,

@JsonKey(name: 'serviceOrderCancellationId')
    String? idOrdemCancelamento,

    @JsonKey(name: 'serviceOrderCancellationDescription')
    String? motivoCancelamento,

    @JsonKey(name: 'comment') String? comentario,

    @JsonKey(name: 'digitalSignatureURL') String? urlAssinaturaDigital,

    @JsonKey(name: 'timestamp') required String? dataHora,
  }) = _OrdemServico;

  factory OrdemServico.fromJson(Map<String, dynamic> json) =>
      _$OrdemServicoFromJson(json);
}
