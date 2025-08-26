import 'package:freezed_annotation/freezed_annotation.dart';
part 'checklist_item.freezed.dart';
part 'checklist_item.g.dart';

@freezed
abstract class ChecklistItem with _$ChecklistItem {
  const factory ChecklistItem({
    required int id,
    required int checklistId,
    required String resumo,
    required int campoObrigatorio,
    required String titulo,
    required String descricao,
    required int checkBoxHabilitado,
    required String descricaoCheckBox,
    required int textFieldHabilitado,
    required String dicaTextField,
    required int qtdMininaFotoObr,
    required int qtdMaximaFoto,
    required int delete,
  }) = _ChecklistItem;

  factory ChecklistItem.fromJson(Map<String, Object?> json) =>
      _$ChecklistItemFromJson(json);
}
