// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checklist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CheckList _$CheckListFromJson(Map<String, dynamic> json) => _CheckList(
  id: (json['id'] as num).toInt(),
  tipo: (json['tipo'] as num).toInt(),
  descricao: json['descricao'] as String,
  idFuncionario: (json['idFuncionario'] as num).toInt(),
  checkListItem: (json['checkListItem'] as List<dynamic>)
      .map((e) => ChecklistItem.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CheckListToJson(_CheckList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tipo': instance.tipo,
      'descricao': instance.descricao,
      'idFuncionario': instance.idFuncionario,
      'checkListItem': instance.checkListItem,
    };
