// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'etapas_ordem_servico.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Devices _$DevicesFromJson(Map<String, dynamic> json) => _Devices(
  id: (json['id'] as num?)?.toInt(),
  tipo: (json['tipo'] as num).toInt(),
  descricao: json['descricao'] as String,
);

Map<String, dynamic> _$DevicesToJson(_Devices instance) => <String, dynamic>{
  'id': instance.id,
  'tipo': instance.tipo,
  'descricao': instance.descricao,
};
