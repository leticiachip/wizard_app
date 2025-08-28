import 'package:freezed_annotation/freezed_annotation.dart';
part 'opcao_checklist.freezed.dart';
part 'opcao_checklist.g.dart';


@freezed
abstract class OpcaoChecklist with _$OpcaoChecklist {
  const factory OpcaoChecklist({
    required int? id,
    required String? descricao,
  }) = _OpcaoChecklist;

  factory OpcaoChecklist.fromJson(Map<String, Object?> json) =>
      _$OpcaoChecklistFromJson(json);
}