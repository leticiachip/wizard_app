// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'etapa.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Etapa _$EtapaFromJson(Map<String, dynamic> json) => _Etapa(
  id: (json['id'] as num?)?.toInt(),
  titulo: json['titulo'] as String?,
  ordem: (json['ordem'] as num).toInt(),
  acoes: (json['acoes'] as List<dynamic>)
      .map((e) => Acoes.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$EtapaToJson(_Etapa instance) => <String, dynamic>{
  'id': instance.id,
  'titulo': instance.titulo,
  'ordem': instance.ordem,
  'acoes': instance.acoes,
};
