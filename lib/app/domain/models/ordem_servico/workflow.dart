import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wizard_app/app/domain/models/ordem_servico/etapa.dart';
part 'workflow.freezed.dart';
part 'workflow.g.dart';

@freezed
abstract class WorkFlow with _$WorkFlow {
  const factory WorkFlow({
    required int? id,
    required String? descricao,
    required List<Etapa> etapas,
  }) = _WorkFlow;

  factory WorkFlow.fromJson(Map<String, Object?> json) =>
      _$WorkFlowFromJson(json);
}
