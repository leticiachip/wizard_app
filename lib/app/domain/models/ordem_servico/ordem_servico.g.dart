// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ordem_servico.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrdemServico _$OrdemServicoFromJson(Map<String, dynamic> json) =>
    _OrdemServico(
      id: (json['id'] as num?)?.toInt(),
      idEmpresa: (json['companyId'] as num?)?.toInt(),
      nomeEmpresa: json['companyName'] as String?,
      idEmpresaDestinataria: (json['recipientCompanyId'] as num?)?.toInt(),
      nomeEmpresaDestinaria: json['recipientCompanyName'] as String?,
      nomeLegalEmpresaDestinaria: json['recipientCompanyLegalName'] as String?,
      numeroPedido: json['orderNumber'] as String?,
      tipo: (json['workflowId'] as num?)?.toInt(),
      nomeFluxoTrabalho: json['workflowName'] as String?,
      descricaoFluxoTrabalho: json['workflowDescription'] as String?,
      status: (json['serviceOrderStatusId'] as num?)?.toInt(),
      descricaoStatusOrdem: json['serviceOrderStatusDescription'] as String?,
      dataHoraInicio: json['startTimestamp'] as String?,
      dataHoraFim: json['endTimestamp'] as String?,
      idVeiculo: (json['vehicleId'] as num?)?.toInt(),
      veiculoIdExterno: json['vehicleExternalId'] as String?,
      placaVeiculo: json['vehicleLicensePlate'] as String?,
      idFuncionario: (json['employeeId'] as num?)?.toInt(),
      nomeCompletoResposavel: json['employeeFullName'] as String?,
      prazoFinal: (json['deadline'] as num?)?.toInt(),
      dataHoraPrazoFinal: json['deadlineTimestamp'] as String?,
      tentativas: (json['attempt'] as num).toInt(),
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
      informacoesAdicionais: json['additionalInformation'] as String?,
      idOrdemCancelamento: json['serviceOrderCancellationId'] as String?,
      motivoCancelamento:
          json['serviceOrderCancellationDescription'] as String?,
      comentario: json['comment'] as String?,
      urlAssinaturaDigital: json['digitalSignatureURL'] as String?,
      dataHora: json['timestamp'] as String?,
    );

Map<String, dynamic> _$OrdemServicoToJson(_OrdemServico instance) =>
    <String, dynamic>{
      'id': instance.id,
      'companyId': instance.idEmpresa,
      'companyName': instance.nomeEmpresa,
      'recipientCompanyId': instance.idEmpresaDestinataria,
      'recipientCompanyName': instance.nomeEmpresaDestinaria,
      'recipientCompanyLegalName': instance.nomeLegalEmpresaDestinaria,
      'orderNumber': instance.numeroPedido,
      'workflowId': instance.tipo,
      'workflowName': instance.nomeFluxoTrabalho,
      'workflowDescription': instance.descricaoFluxoTrabalho,
      'serviceOrderStatusId': instance.status,
      'serviceOrderStatusDescription': instance.descricaoStatusOrdem,
      'startTimestamp': instance.dataHoraInicio,
      'endTimestamp': instance.dataHoraFim,
      'vehicleId': instance.idVeiculo,
      'vehicleExternalId': instance.veiculoIdExterno,
      'vehicleLicensePlate': instance.placaVeiculo,
      'employeeId': instance.idFuncionario,
      'employeeFullName': instance.nomeCompletoResposavel,
      'deadline': instance.prazoFinal,
      'deadlineTimestamp': instance.dataHoraPrazoFinal,
      'attempt': instance.tentativas,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'additionalInformation': instance.informacoesAdicionais,
      'serviceOrderCancellationId': instance.idOrdemCancelamento,
      'serviceOrderCancellationDescription': instance.motivoCancelamento,
      'comment': instance.comentario,
      'digitalSignatureURL': instance.urlAssinaturaDigital,
      'timestamp': instance.dataHora,
    };
