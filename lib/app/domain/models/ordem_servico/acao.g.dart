// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'acao.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Acoes _$AcoesFromJson(Map<String, dynamic> json) => _Acoes(
  id: (json['id'] as num?)?.toInt(),
  tipo: (json['tipo'] as num?)?.toInt(),
  descricaoTipo: json['descricaoTipo'] as String,
  veiculo: Veiculo.fromJson(json['veiculo'] as Map<String, dynamic>),
  checlist: (json['checlist'] as List<dynamic>)
      .map((e) => OpcaoChecklist.fromJson(e as Map<String, dynamic>))
      .toList(),
  typeTextField: (json['typeTextField'] as num).toInt(),
  descricao: json['descricao'] as String,
  capturaFotoHabilitado: (json['capturaFotoHabilitado'] as num).toInt(),
  descricaoEnvioFoto: json['descricaoEnvioFoto'] as String,
  qtdMaximaFoto: (json['qtdMaximaFoto'] as num).toInt(),
  qtdMinimaFoto: (json['qtdMinimaFoto'] as num).toInt(),
);

Map<String, dynamic> _$AcoesToJson(_Acoes instance) => <String, dynamic>{
  'id': instance.id,
  'tipo': instance.tipo,
  'descricaoTipo': instance.descricaoTipo,
  'veiculo': instance.veiculo,
  'checlist': instance.checlist,
  'typeTextField': instance.typeTextField,
  'descricao': instance.descricao,
  'capturaFotoHabilitado': instance.capturaFotoHabilitado,
  'descricaoEnvioFoto': instance.descricaoEnvioFoto,
  'qtdMaximaFoto': instance.qtdMaximaFoto,
  'qtdMinimaFoto': instance.qtdMinimaFoto,
};
