import 'package:freezed_annotation/freezed_annotation.dart';

import 'acao.dart';
part 'etapa.freezed.dart';
part 'etapa.g.dart';

@freezed
abstract class Etapa with _$Etapa {
  const factory Etapa({
    required int? id,
    required String? titulo,
    required int ordem,
    required List<Acoes> acoes,
  }) = _Etapa;

  factory Etapa.fromJson(Map<String, Object?> json) => _$EtapaFromJson(json);
}
