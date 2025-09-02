// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usuario.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Usuario _$UsuarioFromJson(Map<String, dynamic> json) => _Usuario(
  id: json['id'] as String,
  nome: json['nome'] as String,
  cpf: json['cpf'] as String,
  telefone: json['telefone'] as String,
  endereco: json['endereco'] as String,
);

Map<String, dynamic> _$UsuarioToJson(_Usuario instance) => <String, dynamic>{
  'id': instance.id,
  'nome': instance.nome,
  'cpf': instance.cpf,
  'telefone': instance.telefone,
  'endereco': instance.endereco,
};
