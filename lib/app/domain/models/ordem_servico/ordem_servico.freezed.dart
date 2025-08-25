// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ordem_servico.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrdemServico {

 int get id; int get idEmpresa; int get idEmpresaDestinataria; String get numeroPedido; int get tipo; int get status; String get dataHoraInicio; String get dataHoraFim; int get idVeiculo; int get idFuncionario; String get prazoFinal; String get dataHoraPrazoFinal; int get tentativas; String get latitude; String get longitude; String get informacoesAdicionais; String get motivoCancelamento; String get comentario; String get urlAssinaturaDigital; String get responsavel; String get dataHora;
/// Create a copy of OrdemServico
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrdemServicoCopyWith<OrdemServico> get copyWith => _$OrdemServicoCopyWithImpl<OrdemServico>(this as OrdemServico, _$identity);

  /// Serializes this OrdemServico to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrdemServico&&(identical(other.id, id) || other.id == id)&&(identical(other.idEmpresa, idEmpresa) || other.idEmpresa == idEmpresa)&&(identical(other.idEmpresaDestinataria, idEmpresaDestinataria) || other.idEmpresaDestinataria == idEmpresaDestinataria)&&(identical(other.numeroPedido, numeroPedido) || other.numeroPedido == numeroPedido)&&(identical(other.tipo, tipo) || other.tipo == tipo)&&(identical(other.status, status) || other.status == status)&&(identical(other.dataHoraInicio, dataHoraInicio) || other.dataHoraInicio == dataHoraInicio)&&(identical(other.dataHoraFim, dataHoraFim) || other.dataHoraFim == dataHoraFim)&&(identical(other.idVeiculo, idVeiculo) || other.idVeiculo == idVeiculo)&&(identical(other.idFuncionario, idFuncionario) || other.idFuncionario == idFuncionario)&&(identical(other.prazoFinal, prazoFinal) || other.prazoFinal == prazoFinal)&&(identical(other.dataHoraPrazoFinal, dataHoraPrazoFinal) || other.dataHoraPrazoFinal == dataHoraPrazoFinal)&&(identical(other.tentativas, tentativas) || other.tentativas == tentativas)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.informacoesAdicionais, informacoesAdicionais) || other.informacoesAdicionais == informacoesAdicionais)&&(identical(other.motivoCancelamento, motivoCancelamento) || other.motivoCancelamento == motivoCancelamento)&&(identical(other.comentario, comentario) || other.comentario == comentario)&&(identical(other.urlAssinaturaDigital, urlAssinaturaDigital) || other.urlAssinaturaDigital == urlAssinaturaDigital)&&(identical(other.responsavel, responsavel) || other.responsavel == responsavel)&&(identical(other.dataHora, dataHora) || other.dataHora == dataHora));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,idEmpresa,idEmpresaDestinataria,numeroPedido,tipo,status,dataHoraInicio,dataHoraFim,idVeiculo,idFuncionario,prazoFinal,dataHoraPrazoFinal,tentativas,latitude,longitude,informacoesAdicionais,motivoCancelamento,comentario,urlAssinaturaDigital,responsavel,dataHora]);

@override
String toString() {
  return 'OrdemServico(id: $id, idEmpresa: $idEmpresa, idEmpresaDestinataria: $idEmpresaDestinataria, numeroPedido: $numeroPedido, tipo: $tipo, status: $status, dataHoraInicio: $dataHoraInicio, dataHoraFim: $dataHoraFim, idVeiculo: $idVeiculo, idFuncionario: $idFuncionario, prazoFinal: $prazoFinal, dataHoraPrazoFinal: $dataHoraPrazoFinal, tentativas: $tentativas, latitude: $latitude, longitude: $longitude, informacoesAdicionais: $informacoesAdicionais, motivoCancelamento: $motivoCancelamento, comentario: $comentario, urlAssinaturaDigital: $urlAssinaturaDigital, responsavel: $responsavel, dataHora: $dataHora)';
}


}

/// @nodoc
abstract mixin class $OrdemServicoCopyWith<$Res>  {
  factory $OrdemServicoCopyWith(OrdemServico value, $Res Function(OrdemServico) _then) = _$OrdemServicoCopyWithImpl;
@useResult
$Res call({
 int id, int idEmpresa, int idEmpresaDestinataria, String numeroPedido, int tipo, int status, String dataHoraInicio, String dataHoraFim, int idVeiculo, int idFuncionario, String prazoFinal, String dataHoraPrazoFinal, int tentativas, String latitude, String longitude, String informacoesAdicionais, String motivoCancelamento, String comentario, String urlAssinaturaDigital, String responsavel, String dataHora
});




}
/// @nodoc
class _$OrdemServicoCopyWithImpl<$Res>
    implements $OrdemServicoCopyWith<$Res> {
  _$OrdemServicoCopyWithImpl(this._self, this._then);

  final OrdemServico _self;
  final $Res Function(OrdemServico) _then;

/// Create a copy of OrdemServico
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? idEmpresa = null,Object? idEmpresaDestinataria = null,Object? numeroPedido = null,Object? tipo = null,Object? status = null,Object? dataHoraInicio = null,Object? dataHoraFim = null,Object? idVeiculo = null,Object? idFuncionario = null,Object? prazoFinal = null,Object? dataHoraPrazoFinal = null,Object? tentativas = null,Object? latitude = null,Object? longitude = null,Object? informacoesAdicionais = null,Object? motivoCancelamento = null,Object? comentario = null,Object? urlAssinaturaDigital = null,Object? responsavel = null,Object? dataHora = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,idEmpresa: null == idEmpresa ? _self.idEmpresa : idEmpresa // ignore: cast_nullable_to_non_nullable
as int,idEmpresaDestinataria: null == idEmpresaDestinataria ? _self.idEmpresaDestinataria : idEmpresaDestinataria // ignore: cast_nullable_to_non_nullable
as int,numeroPedido: null == numeroPedido ? _self.numeroPedido : numeroPedido // ignore: cast_nullable_to_non_nullable
as String,tipo: null == tipo ? _self.tipo : tipo // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int,dataHoraInicio: null == dataHoraInicio ? _self.dataHoraInicio : dataHoraInicio // ignore: cast_nullable_to_non_nullable
as String,dataHoraFim: null == dataHoraFim ? _self.dataHoraFim : dataHoraFim // ignore: cast_nullable_to_non_nullable
as String,idVeiculo: null == idVeiculo ? _self.idVeiculo : idVeiculo // ignore: cast_nullable_to_non_nullable
as int,idFuncionario: null == idFuncionario ? _self.idFuncionario : idFuncionario // ignore: cast_nullable_to_non_nullable
as int,prazoFinal: null == prazoFinal ? _self.prazoFinal : prazoFinal // ignore: cast_nullable_to_non_nullable
as String,dataHoraPrazoFinal: null == dataHoraPrazoFinal ? _self.dataHoraPrazoFinal : dataHoraPrazoFinal // ignore: cast_nullable_to_non_nullable
as String,tentativas: null == tentativas ? _self.tentativas : tentativas // ignore: cast_nullable_to_non_nullable
as int,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as String,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as String,informacoesAdicionais: null == informacoesAdicionais ? _self.informacoesAdicionais : informacoesAdicionais // ignore: cast_nullable_to_non_nullable
as String,motivoCancelamento: null == motivoCancelamento ? _self.motivoCancelamento : motivoCancelamento // ignore: cast_nullable_to_non_nullable
as String,comentario: null == comentario ? _self.comentario : comentario // ignore: cast_nullable_to_non_nullable
as String,urlAssinaturaDigital: null == urlAssinaturaDigital ? _self.urlAssinaturaDigital : urlAssinaturaDigital // ignore: cast_nullable_to_non_nullable
as String,responsavel: null == responsavel ? _self.responsavel : responsavel // ignore: cast_nullable_to_non_nullable
as String,dataHora: null == dataHora ? _self.dataHora : dataHora // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [OrdemServico].
extension OrdemServicoPatterns on OrdemServico {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrdemServico value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrdemServico() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrdemServico value)  $default,){
final _that = this;
switch (_that) {
case _OrdemServico():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrdemServico value)?  $default,){
final _that = this;
switch (_that) {
case _OrdemServico() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int idEmpresa,  int idEmpresaDestinataria,  String numeroPedido,  int tipo,  int status,  String dataHoraInicio,  String dataHoraFim,  int idVeiculo,  int idFuncionario,  String prazoFinal,  String dataHoraPrazoFinal,  int tentativas,  String latitude,  String longitude,  String informacoesAdicionais,  String motivoCancelamento,  String comentario,  String urlAssinaturaDigital,  String responsavel,  String dataHora)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrdemServico() when $default != null:
return $default(_that.id,_that.idEmpresa,_that.idEmpresaDestinataria,_that.numeroPedido,_that.tipo,_that.status,_that.dataHoraInicio,_that.dataHoraFim,_that.idVeiculo,_that.idFuncionario,_that.prazoFinal,_that.dataHoraPrazoFinal,_that.tentativas,_that.latitude,_that.longitude,_that.informacoesAdicionais,_that.motivoCancelamento,_that.comentario,_that.urlAssinaturaDigital,_that.responsavel,_that.dataHora);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int idEmpresa,  int idEmpresaDestinataria,  String numeroPedido,  int tipo,  int status,  String dataHoraInicio,  String dataHoraFim,  int idVeiculo,  int idFuncionario,  String prazoFinal,  String dataHoraPrazoFinal,  int tentativas,  String latitude,  String longitude,  String informacoesAdicionais,  String motivoCancelamento,  String comentario,  String urlAssinaturaDigital,  String responsavel,  String dataHora)  $default,) {final _that = this;
switch (_that) {
case _OrdemServico():
return $default(_that.id,_that.idEmpresa,_that.idEmpresaDestinataria,_that.numeroPedido,_that.tipo,_that.status,_that.dataHoraInicio,_that.dataHoraFim,_that.idVeiculo,_that.idFuncionario,_that.prazoFinal,_that.dataHoraPrazoFinal,_that.tentativas,_that.latitude,_that.longitude,_that.informacoesAdicionais,_that.motivoCancelamento,_that.comentario,_that.urlAssinaturaDigital,_that.responsavel,_that.dataHora);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int idEmpresa,  int idEmpresaDestinataria,  String numeroPedido,  int tipo,  int status,  String dataHoraInicio,  String dataHoraFim,  int idVeiculo,  int idFuncionario,  String prazoFinal,  String dataHoraPrazoFinal,  int tentativas,  String latitude,  String longitude,  String informacoesAdicionais,  String motivoCancelamento,  String comentario,  String urlAssinaturaDigital,  String responsavel,  String dataHora)?  $default,) {final _that = this;
switch (_that) {
case _OrdemServico() when $default != null:
return $default(_that.id,_that.idEmpresa,_that.idEmpresaDestinataria,_that.numeroPedido,_that.tipo,_that.status,_that.dataHoraInicio,_that.dataHoraFim,_that.idVeiculo,_that.idFuncionario,_that.prazoFinal,_that.dataHoraPrazoFinal,_that.tentativas,_that.latitude,_that.longitude,_that.informacoesAdicionais,_that.motivoCancelamento,_that.comentario,_that.urlAssinaturaDigital,_that.responsavel,_that.dataHora);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrdemServico implements OrdemServico {
  const _OrdemServico({required this.id, required this.idEmpresa, required this.idEmpresaDestinataria, required this.numeroPedido, required this.tipo, required this.status, required this.dataHoraInicio, required this.dataHoraFim, required this.idVeiculo, required this.idFuncionario, required this.prazoFinal, required this.dataHoraPrazoFinal, required this.tentativas, required this.latitude, required this.longitude, required this.informacoesAdicionais, required this.motivoCancelamento, required this.comentario, required this.urlAssinaturaDigital, required this.responsavel, required this.dataHora});
  factory _OrdemServico.fromJson(Map<String, dynamic> json) => _$OrdemServicoFromJson(json);

@override final  int id;
@override final  int idEmpresa;
@override final  int idEmpresaDestinataria;
@override final  String numeroPedido;
@override final  int tipo;
@override final  int status;
@override final  String dataHoraInicio;
@override final  String dataHoraFim;
@override final  int idVeiculo;
@override final  int idFuncionario;
@override final  String prazoFinal;
@override final  String dataHoraPrazoFinal;
@override final  int tentativas;
@override final  String latitude;
@override final  String longitude;
@override final  String informacoesAdicionais;
@override final  String motivoCancelamento;
@override final  String comentario;
@override final  String urlAssinaturaDigital;
@override final  String responsavel;
@override final  String dataHora;

/// Create a copy of OrdemServico
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrdemServicoCopyWith<_OrdemServico> get copyWith => __$OrdemServicoCopyWithImpl<_OrdemServico>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrdemServicoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrdemServico&&(identical(other.id, id) || other.id == id)&&(identical(other.idEmpresa, idEmpresa) || other.idEmpresa == idEmpresa)&&(identical(other.idEmpresaDestinataria, idEmpresaDestinataria) || other.idEmpresaDestinataria == idEmpresaDestinataria)&&(identical(other.numeroPedido, numeroPedido) || other.numeroPedido == numeroPedido)&&(identical(other.tipo, tipo) || other.tipo == tipo)&&(identical(other.status, status) || other.status == status)&&(identical(other.dataHoraInicio, dataHoraInicio) || other.dataHoraInicio == dataHoraInicio)&&(identical(other.dataHoraFim, dataHoraFim) || other.dataHoraFim == dataHoraFim)&&(identical(other.idVeiculo, idVeiculo) || other.idVeiculo == idVeiculo)&&(identical(other.idFuncionario, idFuncionario) || other.idFuncionario == idFuncionario)&&(identical(other.prazoFinal, prazoFinal) || other.prazoFinal == prazoFinal)&&(identical(other.dataHoraPrazoFinal, dataHoraPrazoFinal) || other.dataHoraPrazoFinal == dataHoraPrazoFinal)&&(identical(other.tentativas, tentativas) || other.tentativas == tentativas)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.informacoesAdicionais, informacoesAdicionais) || other.informacoesAdicionais == informacoesAdicionais)&&(identical(other.motivoCancelamento, motivoCancelamento) || other.motivoCancelamento == motivoCancelamento)&&(identical(other.comentario, comentario) || other.comentario == comentario)&&(identical(other.urlAssinaturaDigital, urlAssinaturaDigital) || other.urlAssinaturaDigital == urlAssinaturaDigital)&&(identical(other.responsavel, responsavel) || other.responsavel == responsavel)&&(identical(other.dataHora, dataHora) || other.dataHora == dataHora));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,idEmpresa,idEmpresaDestinataria,numeroPedido,tipo,status,dataHoraInicio,dataHoraFim,idVeiculo,idFuncionario,prazoFinal,dataHoraPrazoFinal,tentativas,latitude,longitude,informacoesAdicionais,motivoCancelamento,comentario,urlAssinaturaDigital,responsavel,dataHora]);

@override
String toString() {
  return 'OrdemServico(id: $id, idEmpresa: $idEmpresa, idEmpresaDestinataria: $idEmpresaDestinataria, numeroPedido: $numeroPedido, tipo: $tipo, status: $status, dataHoraInicio: $dataHoraInicio, dataHoraFim: $dataHoraFim, idVeiculo: $idVeiculo, idFuncionario: $idFuncionario, prazoFinal: $prazoFinal, dataHoraPrazoFinal: $dataHoraPrazoFinal, tentativas: $tentativas, latitude: $latitude, longitude: $longitude, informacoesAdicionais: $informacoesAdicionais, motivoCancelamento: $motivoCancelamento, comentario: $comentario, urlAssinaturaDigital: $urlAssinaturaDigital, responsavel: $responsavel, dataHora: $dataHora)';
}


}

/// @nodoc
abstract mixin class _$OrdemServicoCopyWith<$Res> implements $OrdemServicoCopyWith<$Res> {
  factory _$OrdemServicoCopyWith(_OrdemServico value, $Res Function(_OrdemServico) _then) = __$OrdemServicoCopyWithImpl;
@override @useResult
$Res call({
 int id, int idEmpresa, int idEmpresaDestinataria, String numeroPedido, int tipo, int status, String dataHoraInicio, String dataHoraFim, int idVeiculo, int idFuncionario, String prazoFinal, String dataHoraPrazoFinal, int tentativas, String latitude, String longitude, String informacoesAdicionais, String motivoCancelamento, String comentario, String urlAssinaturaDigital, String responsavel, String dataHora
});




}
/// @nodoc
class __$OrdemServicoCopyWithImpl<$Res>
    implements _$OrdemServicoCopyWith<$Res> {
  __$OrdemServicoCopyWithImpl(this._self, this._then);

  final _OrdemServico _self;
  final $Res Function(_OrdemServico) _then;

/// Create a copy of OrdemServico
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? idEmpresa = null,Object? idEmpresaDestinataria = null,Object? numeroPedido = null,Object? tipo = null,Object? status = null,Object? dataHoraInicio = null,Object? dataHoraFim = null,Object? idVeiculo = null,Object? idFuncionario = null,Object? prazoFinal = null,Object? dataHoraPrazoFinal = null,Object? tentativas = null,Object? latitude = null,Object? longitude = null,Object? informacoesAdicionais = null,Object? motivoCancelamento = null,Object? comentario = null,Object? urlAssinaturaDigital = null,Object? responsavel = null,Object? dataHora = null,}) {
  return _then(_OrdemServico(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,idEmpresa: null == idEmpresa ? _self.idEmpresa : idEmpresa // ignore: cast_nullable_to_non_nullable
as int,idEmpresaDestinataria: null == idEmpresaDestinataria ? _self.idEmpresaDestinataria : idEmpresaDestinataria // ignore: cast_nullable_to_non_nullable
as int,numeroPedido: null == numeroPedido ? _self.numeroPedido : numeroPedido // ignore: cast_nullable_to_non_nullable
as String,tipo: null == tipo ? _self.tipo : tipo // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int,dataHoraInicio: null == dataHoraInicio ? _self.dataHoraInicio : dataHoraInicio // ignore: cast_nullable_to_non_nullable
as String,dataHoraFim: null == dataHoraFim ? _self.dataHoraFim : dataHoraFim // ignore: cast_nullable_to_non_nullable
as String,idVeiculo: null == idVeiculo ? _self.idVeiculo : idVeiculo // ignore: cast_nullable_to_non_nullable
as int,idFuncionario: null == idFuncionario ? _self.idFuncionario : idFuncionario // ignore: cast_nullable_to_non_nullable
as int,prazoFinal: null == prazoFinal ? _self.prazoFinal : prazoFinal // ignore: cast_nullable_to_non_nullable
as String,dataHoraPrazoFinal: null == dataHoraPrazoFinal ? _self.dataHoraPrazoFinal : dataHoraPrazoFinal // ignore: cast_nullable_to_non_nullable
as String,tentativas: null == tentativas ? _self.tentativas : tentativas // ignore: cast_nullable_to_non_nullable
as int,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as String,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as String,informacoesAdicionais: null == informacoesAdicionais ? _self.informacoesAdicionais : informacoesAdicionais // ignore: cast_nullable_to_non_nullable
as String,motivoCancelamento: null == motivoCancelamento ? _self.motivoCancelamento : motivoCancelamento // ignore: cast_nullable_to_non_nullable
as String,comentario: null == comentario ? _self.comentario : comentario // ignore: cast_nullable_to_non_nullable
as String,urlAssinaturaDigital: null == urlAssinaturaDigital ? _self.urlAssinaturaDigital : urlAssinaturaDigital // ignore: cast_nullable_to_non_nullable
as String,responsavel: null == responsavel ? _self.responsavel : responsavel // ignore: cast_nullable_to_non_nullable
as String,dataHora: null == dataHora ? _self.dataHora : dataHora // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
