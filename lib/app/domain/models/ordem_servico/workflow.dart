// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
part 'workflow.freezed.dart';
part 'workflow.g.dart';

@freezed
abstract class Workflow with _$Workflow {
  const factory Workflow({
    @JsonKey(name: 'workflowStepActionId') required int? id,
    @JsonKey(name: 'workflowStepActionName') required String nome,
    @JsonKey(name: 'workflowStepActionOrdination') required int ordem,
    @JsonKey(name: 'workflowStepStartTimeStamp') required String dataInicio,
    @JsonKey(name: 'workflowStepEndTimeStamp') required String dataFim,

  }) = _Workflow;

  factory Workflow.fromJson(Map<String, Object?> json) =>
      _$WorkflowFromJson(json);
}
