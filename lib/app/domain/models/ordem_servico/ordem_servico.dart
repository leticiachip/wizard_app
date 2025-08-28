// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
part 'ordem_servico.freezed.dart';
part 'ordem_servico.g.dart';

@freezed
abstract class OrdemServico with _$OrdemServico {
   factory OrdemServico({
    required int? id,

    @JsonKey(name: 'companyId')
    required int? idEmpresa,

    @JsonKey(name: 'companyName')
    required String? nomeEmpresa,

    @JsonKey(name: 'recipientCompanyId')
    required int? idEmpresaDestinataria,

    @JsonKey(name: 'orderNumber')
    required String? numeroPedido,

    @JsonKey(name: 'workflowId')
    required int? tipo,

    @JsonKey(name: 'serviceOrderStatusId')
    required int? status,

    @JsonKey(name: 'startTimestamp')
    String? dataHoraInicio,

    @JsonKey(name: 'endTimestamp')
    String? dataHoraFim,

    @JsonKey(name: 'vehicleId')
    required int? idVeiculo,

    @JsonKey(name: 'employeeId')
    required int? idFuncionario,

    @JsonKey(name: 'deadline')
    required int? prazoFinal,

    @JsonKey(name: 'deadlineTimestamp')
    required String? dataHoraPrazoFinal,

    @JsonKey(name: 'attempt')
    required int tentativas,

    @JsonKey(name: 'latitude')
    required String? latitude,

    @JsonKey(name: 'longitude')
    required String? longitude,

    @JsonKey(name: 'additionalInformation')
    required String? informacoesAdicionais,

    @JsonKey(name: 'serviceOrderCancellationDescription')
    String? motivoCancelamento,

    @JsonKey(name: 'comment')
    String? comentario,

    @JsonKey(name: 'digitalSignatureURL')
    String? urlAssinaturaDigital,

    @JsonKey(name: 'employeeFullName')
    required String? responsavel,

    @JsonKey(name: 'timestamp')
    required String? dataHora,
  }) = _OrdemServico;

  factory OrdemServico.fromJson(Map<String, dynamic> json) =>
      _$OrdemServicoFromJson(json);
}