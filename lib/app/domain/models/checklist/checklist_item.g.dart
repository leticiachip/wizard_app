// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checklist_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChecklistItem _$ChecklistItemFromJson(Map<String, dynamic> json) =>
    _ChecklistItem(
      id: (json['id'] as num).toInt(),
      checklistId: (json['checklistId'] as num).toInt(),
      resumo: json['resumo'] as String,
      campoObrigatorio: (json['campoObrigatorio'] as num).toInt(),
      titulo: json['titulo'] as String,
      descricao: json['descricao'] as String,
      checkBoxHabilitado: (json['checkBoxHabilitado'] as num).toInt(),
      descricaoCheckBox: json['descricaoCheckBox'] as String,
      textFieldHabilitado: (json['textFieldHabilitado'] as num).toInt(),
      dicaTextField: json['dicaTextField'] as String,
      qtdMininaFotoObr: (json['qtdMininaFotoObr'] as num).toInt(),
      qtdMaximaFoto: (json['qtdMaximaFoto'] as num).toInt(),
      delete: (json['delete'] as num).toInt(),
    );

Map<String, dynamic> _$ChecklistItemToJson(_ChecklistItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'checklistId': instance.checklistId,
      'resumo': instance.resumo,
      'campoObrigatorio': instance.campoObrigatorio,
      'titulo': instance.titulo,
      'descricao': instance.descricao,
      'checkBoxHabilitado': instance.checkBoxHabilitado,
      'descricaoCheckBox': instance.descricaoCheckBox,
      'textFieldHabilitado': instance.textFieldHabilitado,
      'dicaTextField': instance.dicaTextField,
      'qtdMininaFotoObr': instance.qtdMininaFotoObr,
      'qtdMaximaFoto': instance.qtdMaximaFoto,
      'delete': instance.delete,
    };
