import 'package:freezed_annotation/freezed_annotation.dart';
part 'carga_atualizacao.freezed.dart';
part 'carga_atualizacao.g.dart';

@freezed
abstract class CargaAtualizacao with _$CargaAtualizacao {
  const factory CargaAtualizacao({required int? id, required double versao, required List<String> carga}) = _CargaAtualizacao;

  factory CargaAtualizacao.fromJson(Map<String, Object?> json) =>
      _$CargaAtualizacaoFromJson(json);
}