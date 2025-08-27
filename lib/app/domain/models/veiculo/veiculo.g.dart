// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'veiculo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Veiculo _$VeiculoFromJson(Map<String, dynamic> json) => _Veiculo(
  id: (json['id'] as num?)?.toInt(),
  montadora: json['montadora'] as String?,
  modelo: json['modelo'] as String,
  ano: (json['ano'] as num).toInt(),
  placa: json['placa'] as String,
);

Map<String, dynamic> _$VeiculoToJson(_Veiculo instance) => <String, dynamic>{
  'id': instance.id,
  'montadora': instance.montadora,
  'modelo': instance.modelo,
  'ano': instance.ano,
  'placa': instance.placa,
};
