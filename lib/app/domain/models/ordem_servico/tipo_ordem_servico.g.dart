// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tipo_ordem_servico.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TipoOrdemServico _$TipoOrdemServicoFromJson(Map<String, dynamic> json) =>
    _TipoOrdemServico(
      id: (json['id'] as num?)?.toInt(),
      idOrdem: json['idOrdem'] as String?,
      tipo: (json['tipo'] as num).toInt(),
      descricaoTipo: (json['descricaoTipo'] as num).toInt(),
      veiculo: Veiculo.fromJson(json['veiculo'] as Map<String, dynamic>),
      workflow: WorkFlow.fromJson(json['workflow'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TipoOrdemServicoToJson(_TipoOrdemServico instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idOrdem': instance.idOrdem,
      'tipo': instance.tipo,
      'descricaoTipo': instance.descricaoTipo,
      'veiculo': instance.veiculo,
      'workflow': instance.workflow,
    };
