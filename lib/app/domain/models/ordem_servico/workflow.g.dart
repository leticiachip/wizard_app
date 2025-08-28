// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workflow.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WorkFlow _$WorkFlowFromJson(Map<String, dynamic> json) => _WorkFlow(
  id: (json['id'] as num?)?.toInt(),
  descricao: json['descricao'] as String?,
  etapas: (json['etapas'] as List<dynamic>)
      .map((e) => Etapa.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$WorkFlowToJson(_WorkFlow instance) => <String, dynamic>{
  'id': instance.id,
  'descricao': instance.descricao,
  'etapas': instance.etapas,
};
