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
      numeroPedido: json['orderNumber'] as String?,
      tipo: (json['workflowId'] as num?)?.toInt(),
      status: (json['serviceOrderStatusId'] as num?)?.toInt(),
      dataHoraInicio: json['startTimestamp'] as String?,
      dataHoraFim: json['endTimestamp'] as String?,
      idVeiculo: (json['vehicleId'] as num?)?.toInt(),
      idFuncionario: (json['employeeId'] as num?)?.toInt(),
      prazoFinal: (json['deadline'] as num?)?.toInt(),
      dataHoraPrazoFinal: json['deadlineTimestamp'] as String?,
      tentativas: (json['attempt'] as num).toInt(),
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
      informacoesAdicionais: json['additionalInformation'] as String?,
      motivoCancelamento:
          json['serviceOrderCancellationDescription'] as String?,
      comentario: json['comment'] as String?,
      urlAssinaturaDigital: json['digitalSignatureURL'] as String?,
      responsavel: json['employeeFullName'] as String?,
      dataHora: json['timestamp'] as String?,
    );

Map<String, dynamic> _$OrdemServicoToJson(_OrdemServico instance) =>
    <String, dynamic>{
      'id': instance.id,
      'companyId': instance.idEmpresa,
      'companyName': instance.nomeEmpresa,
      'recipientCompanyId': instance.idEmpresaDestinataria,
      'orderNumber': instance.numeroPedido,
      'workflowId': instance.tipo,
      'serviceOrderStatusId': instance.status,
      'startTimestamp': instance.dataHoraInicio,
      'endTimestamp': instance.dataHoraFim,
      'vehicleId': instance.idVeiculo,
      'employeeId': instance.idFuncionario,
      'deadline': instance.prazoFinal,
      'deadlineTimestamp': instance.dataHoraPrazoFinal,
      'attempt': instance.tentativas,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'additionalInformation': instance.informacoesAdicionais,
      'serviceOrderCancellationDescription': instance.motivoCancelamento,
      'comment': instance.comentario,
      'digitalSignatureURL': instance.urlAssinaturaDigital,
      'employeeFullName': instance.responsavel,
      'timestamp': instance.dataHora,
    };
