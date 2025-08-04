import 'package:freezed_annotation/freezed_annotation.dart';
part 'usuario.freezed.dart';
part 'usuario.g.dart';

@freezed
abstract class Usuario with _$Usuario {
  const factory Usuario({
    required String id,
    required String nome,
    required String telefone,
    required String endereco,
  }) = _Usuario;

  factory Usuario.fromJson(Map<String, Object?> json) =>
      _$UsuarioFromJson(json);
}
