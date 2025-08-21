import 'package:freezed_annotation/freezed_annotation.dart';
part 'atualizacao_connect.freezed.dart';
part 'atualizacao_connect.g.dart';

@freezed
abstract class CargaConnect with _$CargaConnect {
  const factory CargaConnect({required String? id, required String arquivo}) = _CargaAtualizacao;

  factory CargaConnect.fromJson(Map<String, Object?> json) =>
      _$CargaConnectFromJson(json);
}