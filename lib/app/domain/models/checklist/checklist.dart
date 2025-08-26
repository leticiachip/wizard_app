import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wizard_app/app/domain/models/checklist/checklist_item.dart';
part 'checklist.freezed.dart';
part 'checklist.g.dart';

@freezed
abstract class CheckList with _$CheckList {
  const factory CheckList({
    required int id,
    required int tipo,
    required String descricao,
    required int idFuncionario,
    required List<ChecklistItem> checkListItem,
  }) = _CheckList;

  factory CheckList.fromJson(Map<String, Object?> json) =>
      _$CheckListFromJson(json);
}
