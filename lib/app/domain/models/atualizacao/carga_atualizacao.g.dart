// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carga_atualizacao.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CargaAtualizacao _$CargaAtualizacaoFromJson(Map<String, dynamic> json) =>
    _CargaAtualizacao(
      id: (json['id'] as num?)?.toInt(),
      versao: (json['versao'] as num).toDouble(),
      carga: (json['carga'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$CargaAtualizacaoToJson(_CargaAtualizacao instance) =>
    <String, dynamic>{
      'id': instance.id,
      'versao': instance.versao,
      'carga': instance.carga,
    };
