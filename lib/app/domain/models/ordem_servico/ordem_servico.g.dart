// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ordem_servico.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrdemServico _$OrdemServicoFromJson(Map<String, dynamic> json) =>
    _OrdemServico(
      id: (json['id'] as num).toInt(),
      idEmpresa: (json['idEmpresa'] as num).toInt(),
      idEmpresaDestinataria: (json['idEmpresaDestinataria'] as num).toInt(),
      numeroPedido: json['numeroPedido'] as String,
      tipo: (json['tipo'] as num).toInt(),
      status: (json['status'] as num).toInt(),
      dataHoraInicio: json['dataHoraInicio'] as String,
      dataHoraFim: json['dataHoraFim'] as String,
      idVeiculo: (json['idVeiculo'] as num).toInt(),
      idFuncionario: (json['idFuncionario'] as num).toInt(),
      prazoFinal: json['prazoFinal'] as String,
      dataHoraPrazoFinal: json['dataHoraPrazoFinal'] as String,
      tentativas: (json['tentativas'] as num).toInt(),
      latitude: json['latitude'] as String,
      longitude: json['longitude'] as String,
      informacoesAdicionais: json['informacoesAdicionais'] as String,
      motivoCancelamento: json['motivoCancelamento'] as String,
      comentario: json['comentario'] as String,
      urlAssinaturaDigital: json['urlAssinaturaDigital'] as String,
      responsavel: json['responsavel'] as String,
      dataHora: json['dataHora'] as String,
    );

Map<String, dynamic> _$OrdemServicoToJson(_OrdemServico instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idEmpresa': instance.idEmpresa,
      'idEmpresaDestinataria': instance.idEmpresaDestinataria,
      'numeroPedido': instance.numeroPedido,
      'tipo': instance.tipo,
      'status': instance.status,
      'dataHoraInicio': instance.dataHoraInicio,
      'dataHoraFim': instance.dataHoraFim,
      'idVeiculo': instance.idVeiculo,
      'idFuncionario': instance.idFuncionario,
      'prazoFinal': instance.prazoFinal,
      'dataHoraPrazoFinal': instance.dataHoraPrazoFinal,
      'tentativas': instance.tentativas,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'informacoesAdicionais': instance.informacoesAdicionais,
      'motivoCancelamento': instance.motivoCancelamento,
      'comentario': instance.comentario,
      'urlAssinaturaDigital': instance.urlAssinaturaDigital,
      'responsavel': instance.responsavel,
      'dataHora': instance.dataHora,
    };
