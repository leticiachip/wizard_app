// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workflow.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Workflow _$WorkflowFromJson(Map<String, dynamic> json) => _Workflow(
  id: (json['workflowStepActionId'] as num?)?.toInt(),
  nome: json['workflowStepActionName'] as String,
  ordem: (json['workflowStepActionOrdination'] as num).toInt(),
  dataInicio: json['workflowStepStartTimeStamp'] as String,
  dataFim: json['workflowStepEndTimeStamp'] as String,
);

Map<String, dynamic> _$WorkflowToJson(_Workflow instance) => <String, dynamic>{
  'workflowStepActionId': instance.id,
  'workflowStepActionName': instance.nome,
  'workflowStepActionOrdination': instance.ordem,
  'workflowStepStartTimeStamp': instance.dataInicio,
  'workflowStepEndTimeStamp': instance.dataFim,
};
