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

 int? get id;@JsonKey(name: 'companyId') int? get idEmpresa;@JsonKey(name: 'companyName') String? get nomeEmpresa;@JsonKey(name: 'recipientCompanyId') int? get idEmpresaDestinataria;@JsonKey(name: 'recipientCompanyName') String? get nomeEmpresaDestinaria;@JsonKey(name: 'recipientCompanyLegalName') String? get nomeLegalEmpresaDestinaria;@JsonKey(name: 'orderNumber') String? get numeroPedido;@JsonKey(name: 'workflowId') int? get tipo;@JsonKey(name: 'workflowName') String? get nomeFluxoTrabalho;@JsonKey(name: 'workflowDescription') String? get descricaoFluxoTrabalho;@JsonKey(name: 'serviceOrderStatusId') int? get status;@JsonKey(name: 'serviceOrderStatusDescription') String? get descricaoStatusOrdem;@JsonKey(name: 'startTimestamp') String? get dataHoraInicio;@JsonKey(name: 'endTimestamp') String? get dataHoraFim;@JsonKey(name: 'vehicleId') int? get idVeiculo;@JsonKey(name: 'vehicleExternalId') String? get veiculoIdExterno;@JsonKey(name: 'vehicleLicensePlate') String? get placaVeiculo;@JsonKey(name: 'employeeId') int? get idFuncionario;@JsonKey(name: 'employeeFullName') String? get nomeCompletoResposavel;@JsonKey(name: 'deadline') int? get prazoFinal;@JsonKey(name: 'deadlineTimestamp') String? get dataHoraPrazoFinal;@JsonKey(name: 'attempt') int get tentativas;@JsonKey(name: 'latitude') String? get latitude;@JsonKey(name: 'longitude') String? get longitude;@JsonKey(name: 'additionalInformation') String? get informacoesAdicionais;@JsonKey(name: 'serviceOrderCancellationId') String? get idOrdemCancelamento;@JsonKey(name: 'serviceOrderCancellationDescription') String? get motivoCancelamento;@JsonKey(name: 'comment') String? get comentario;@JsonKey(name: 'digitalSignatureURL') String? get urlAssinaturaDigital;@JsonKey(name: 'timestamp') String? get dataHora;
/// Create a copy of OrdemServico
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrdemServicoCopyWith<OrdemServico> get copyWith => _$OrdemServicoCopyWithImpl<OrdemServico>(this as OrdemServico, _$identity);

  /// Serializes this OrdemServico to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrdemServico&&(identical(other.id, id) || other.id == id)&&(identical(other.idEmpresa, idEmpresa) || other.idEmpresa == idEmpresa)&&(identical(other.nomeEmpresa, nomeEmpresa) || other.nomeEmpresa == nomeEmpresa)&&(identical(other.idEmpresaDestinataria, idEmpresaDestinataria) || other.idEmpresaDestinataria == idEmpresaDestinataria)&&(identical(other.nomeEmpresaDestinaria, nomeEmpresaDestinaria) || other.nomeEmpresaDestinaria == nomeEmpresaDestinaria)&&(identical(other.nomeLegalEmpresaDestinaria, nomeLegalEmpresaDestinaria) || other.nomeLegalEmpresaDestinaria == nomeLegalEmpresaDestinaria)&&(identical(other.numeroPedido, numeroPedido) || other.numeroPedido == numeroPedido)&&(identical(other.tipo, tipo) || other.tipo == tipo)&&(identical(other.nomeFluxoTrabalho, nomeFluxoTrabalho) || other.nomeFluxoTrabalho == nomeFluxoTrabalho)&&(identical(other.descricaoFluxoTrabalho, descricaoFluxoTrabalho) || other.descricaoFluxoTrabalho == descricaoFluxoTrabalho)&&(identical(other.status, status) || other.status == status)&&(identical(other.descricaoStatusOrdem, descricaoStatusOrdem) || other.descricaoStatusOrdem == descricaoStatusOrdem)&&(identical(other.dataHoraInicio, dataHoraInicio) || other.dataHoraInicio == dataHoraInicio)&&(identical(other.dataHoraFim, dataHoraFim) || other.dataHoraFim == dataHoraFim)&&(identical(other.idVeiculo, idVeiculo) || other.idVeiculo == idVeiculo)&&(identical(other.veiculoIdExterno, veiculoIdExterno) || other.veiculoIdExterno == veiculoIdExterno)&&(identical(other.placaVeiculo, placaVeiculo) || other.placaVeiculo == placaVeiculo)&&(identical(other.idFuncionario, idFuncionario) || other.idFuncionario == idFuncionario)&&(identical(other.nomeCompletoResposavel, nomeCompletoResposavel) || other.nomeCompletoResposavel == nomeCompletoResposavel)&&(identical(other.prazoFinal, prazoFinal) || other.prazoFinal == prazoFinal)&&(identical(other.dataHoraPrazoFinal, dataHoraPrazoFinal) || other.dataHoraPrazoFinal == dataHoraPrazoFinal)&&(identical(other.tentativas, tentativas) || other.tentativas == tentativas)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.informacoesAdicionais, informacoesAdicionais) || other.informacoesAdicionais == informacoesAdicionais)&&(identical(other.idOrdemCancelamento, idOrdemCancelamento) || other.idOrdemCancelamento == idOrdemCancelamento)&&(identical(other.motivoCancelamento, motivoCancelamento) || other.motivoCancelamento == motivoCancelamento)&&(identical(other.comentario, comentario) || other.comentario == comentario)&&(identical(other.urlAssinaturaDigital, urlAssinaturaDigital) || other.urlAssinaturaDigital == urlAssinaturaDigital)&&(identical(other.dataHora, dataHora) || other.dataHora == dataHora));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,idEmpresa,nomeEmpresa,idEmpresaDestinataria,nomeEmpresaDestinaria,nomeLegalEmpresaDestinaria,numeroPedido,tipo,nomeFluxoTrabalho,descricaoFluxoTrabalho,status,descricaoStatusOrdem,dataHoraInicio,dataHoraFim,idVeiculo,veiculoIdExterno,placaVeiculo,idFuncionario,nomeCompletoResposavel,prazoFinal,dataHoraPrazoFinal,tentativas,latitude,longitude,informacoesAdicionais,idOrdemCancelamento,motivoCancelamento,comentario,urlAssinaturaDigital,dataHora]);

@override
String toString() {
  return 'OrdemServico(id: $id, idEmpresa: $idEmpresa, nomeEmpresa: $nomeEmpresa, idEmpresaDestinataria: $idEmpresaDestinataria, nomeEmpresaDestinaria: $nomeEmpresaDestinaria, nomeLegalEmpresaDestinaria: $nomeLegalEmpresaDestinaria, numeroPedido: $numeroPedido, tipo: $tipo, nomeFluxoTrabalho: $nomeFluxoTrabalho, descricaoFluxoTrabalho: $descricaoFluxoTrabalho, status: $status, descricaoStatusOrdem: $descricaoStatusOrdem, dataHoraInicio: $dataHoraInicio, dataHoraFim: $dataHoraFim, idVeiculo: $idVeiculo, veiculoIdExterno: $veiculoIdExterno, placaVeiculo: $placaVeiculo, idFuncionario: $idFuncionario, nomeCompletoResposavel: $nomeCompletoResposavel, prazoFinal: $prazoFinal, dataHoraPrazoFinal: $dataHoraPrazoFinal, tentativas: $tentativas, latitude: $latitude, longitude: $longitude, informacoesAdicionais: $informacoesAdicionais, idOrdemCancelamento: $idOrdemCancelamento, motivoCancelamento: $motivoCancelamento, comentario: $comentario, urlAssinaturaDigital: $urlAssinaturaDigital, dataHora: $dataHora)';
}


}

/// @nodoc
abstract mixin class $OrdemServicoCopyWith<$Res>  {
  factory $OrdemServicoCopyWith(OrdemServico value, $Res Function(OrdemServico) _then) = _$OrdemServicoCopyWithImpl;
@useResult
$Res call({
 int? id,@JsonKey(name: 'companyId') int? idEmpresa,@JsonKey(name: 'companyName') String? nomeEmpresa,@JsonKey(name: 'recipientCompanyId') int? idEmpresaDestinataria,@JsonKey(name: 'recipientCompanyName') String? nomeEmpresaDestinaria,@JsonKey(name: 'recipientCompanyLegalName') String? nomeLegalEmpresaDestinaria,@JsonKey(name: 'orderNumber') String? numeroPedido,@JsonKey(name: 'workflowId') int? tipo,@JsonKey(name: 'workflowName') String? nomeFluxoTrabalho,@JsonKey(name: 'workflowDescription') String? descricaoFluxoTrabalho,@JsonKey(name: 'serviceOrderStatusId') int? status,@JsonKey(name: 'serviceOrderStatusDescription') String? descricaoStatusOrdem,@JsonKey(name: 'startTimestamp') String? dataHoraInicio,@JsonKey(name: 'endTimestamp') String? dataHoraFim,@JsonKey(name: 'vehicleId') int? idVeiculo,@JsonKey(name: 'vehicleExternalId') String? veiculoIdExterno,@JsonKey(name: 'vehicleLicensePlate') String? placaVeiculo,@JsonKey(name: 'employeeId') int? idFuncionario,@JsonKey(name: 'employeeFullName') String? nomeCompletoResposavel,@JsonKey(name: 'deadline') int? prazoFinal,@JsonKey(name: 'deadlineTimestamp') String? dataHoraPrazoFinal,@JsonKey(name: 'attempt') int tentativas,@JsonKey(name: 'latitude') String? latitude,@JsonKey(name: 'longitude') String? longitude,@JsonKey(name: 'additionalInformation') String? informacoesAdicionais,@JsonKey(name: 'serviceOrderCancellationId') String? idOrdemCancelamento,@JsonKey(name: 'serviceOrderCancellationDescription') String? motivoCancelamento,@JsonKey(name: 'comment') String? comentario,@JsonKey(name: 'digitalSignatureURL') String? urlAssinaturaDigital,@JsonKey(name: 'timestamp') String? dataHora
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? idEmpresa = freezed,Object? nomeEmpresa = freezed,Object? idEmpresaDestinataria = freezed,Object? nomeEmpresaDestinaria = freezed,Object? nomeLegalEmpresaDestinaria = freezed,Object? numeroPedido = freezed,Object? tipo = freezed,Object? nomeFluxoTrabalho = freezed,Object? descricaoFluxoTrabalho = freezed,Object? status = freezed,Object? descricaoStatusOrdem = freezed,Object? dataHoraInicio = freezed,Object? dataHoraFim = freezed,Object? idVeiculo = freezed,Object? veiculoIdExterno = freezed,Object? placaVeiculo = freezed,Object? idFuncionario = freezed,Object? nomeCompletoResposavel = freezed,Object? prazoFinal = freezed,Object? dataHoraPrazoFinal = freezed,Object? tentativas = null,Object? latitude = freezed,Object? longitude = freezed,Object? informacoesAdicionais = freezed,Object? idOrdemCancelamento = freezed,Object? motivoCancelamento = freezed,Object? comentario = freezed,Object? urlAssinaturaDigital = freezed,Object? dataHora = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,idEmpresa: freezed == idEmpresa ? _self.idEmpresa : idEmpresa // ignore: cast_nullable_to_non_nullable
as int?,nomeEmpresa: freezed == nomeEmpresa ? _self.nomeEmpresa : nomeEmpresa // ignore: cast_nullable_to_non_nullable
as String?,idEmpresaDestinataria: freezed == idEmpresaDestinataria ? _self.idEmpresaDestinataria : idEmpresaDestinataria // ignore: cast_nullable_to_non_nullable
as int?,nomeEmpresaDestinaria: freezed == nomeEmpresaDestinaria ? _self.nomeEmpresaDestinaria : nomeEmpresaDestinaria // ignore: cast_nullable_to_non_nullable
as String?,nomeLegalEmpresaDestinaria: freezed == nomeLegalEmpresaDestinaria ? _self.nomeLegalEmpresaDestinaria : nomeLegalEmpresaDestinaria // ignore: cast_nullable_to_non_nullable
as String?,numeroPedido: freezed == numeroPedido ? _self.numeroPedido : numeroPedido // ignore: cast_nullable_to_non_nullable
as String?,tipo: freezed == tipo ? _self.tipo : tipo // ignore: cast_nullable_to_non_nullable
as int?,nomeFluxoTrabalho: freezed == nomeFluxoTrabalho ? _self.nomeFluxoTrabalho : nomeFluxoTrabalho // ignore: cast_nullable_to_non_nullable
as String?,descricaoFluxoTrabalho: freezed == descricaoFluxoTrabalho ? _self.descricaoFluxoTrabalho : descricaoFluxoTrabalho // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int?,descricaoStatusOrdem: freezed == descricaoStatusOrdem ? _self.descricaoStatusOrdem : descricaoStatusOrdem // ignore: cast_nullable_to_non_nullable
as String?,dataHoraInicio: freezed == dataHoraInicio ? _self.dataHoraInicio : dataHoraInicio // ignore: cast_nullable_to_non_nullable
as String?,dataHoraFim: freezed == dataHoraFim ? _self.dataHoraFim : dataHoraFim // ignore: cast_nullable_to_non_nullable
as String?,idVeiculo: freezed == idVeiculo ? _self.idVeiculo : idVeiculo // ignore: cast_nullable_to_non_nullable
as int?,veiculoIdExterno: freezed == veiculoIdExterno ? _self.veiculoIdExterno : veiculoIdExterno // ignore: cast_nullable_to_non_nullable
as String?,placaVeiculo: freezed == placaVeiculo ? _self.placaVeiculo : placaVeiculo // ignore: cast_nullable_to_non_nullable
as String?,idFuncionario: freezed == idFuncionario ? _self.idFuncionario : idFuncionario // ignore: cast_nullable_to_non_nullable
as int?,nomeCompletoResposavel: freezed == nomeCompletoResposavel ? _self.nomeCompletoResposavel : nomeCompletoResposavel // ignore: cast_nullable_to_non_nullable
as String?,prazoFinal: freezed == prazoFinal ? _self.prazoFinal : prazoFinal // ignore: cast_nullable_to_non_nullable
as int?,dataHoraPrazoFinal: freezed == dataHoraPrazoFinal ? _self.dataHoraPrazoFinal : dataHoraPrazoFinal // ignore: cast_nullable_to_non_nullable
as String?,tentativas: null == tentativas ? _self.tentativas : tentativas // ignore: cast_nullable_to_non_nullable
as int,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as String?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as String?,informacoesAdicionais: freezed == informacoesAdicionais ? _self.informacoesAdicionais : informacoesAdicionais // ignore: cast_nullable_to_non_nullable
as String?,idOrdemCancelamento: freezed == idOrdemCancelamento ? _self.idOrdemCancelamento : idOrdemCancelamento // ignore: cast_nullable_to_non_nullable
as String?,motivoCancelamento: freezed == motivoCancelamento ? _self.motivoCancelamento : motivoCancelamento // ignore: cast_nullable_to_non_nullable
as String?,comentario: freezed == comentario ? _self.comentario : comentario // ignore: cast_nullable_to_non_nullable
as String?,urlAssinaturaDigital: freezed == urlAssinaturaDigital ? _self.urlAssinaturaDigital : urlAssinaturaDigital // ignore: cast_nullable_to_non_nullable
as String?,dataHora: freezed == dataHora ? _self.dataHora : dataHora // ignore: cast_nullable_to_non_nullable
as String?,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id, @JsonKey(name: 'companyId')  int? idEmpresa, @JsonKey(name: 'companyName')  String? nomeEmpresa, @JsonKey(name: 'recipientCompanyId')  int? idEmpresaDestinataria, @JsonKey(name: 'recipientCompanyName')  String? nomeEmpresaDestinaria, @JsonKey(name: 'recipientCompanyLegalName')  String? nomeLegalEmpresaDestinaria, @JsonKey(name: 'orderNumber')  String? numeroPedido, @JsonKey(name: 'workflowId')  int? tipo, @JsonKey(name: 'workflowName')  String? nomeFluxoTrabalho, @JsonKey(name: 'workflowDescription')  String? descricaoFluxoTrabalho, @JsonKey(name: 'serviceOrderStatusId')  int? status, @JsonKey(name: 'serviceOrderStatusDescription')  String? descricaoStatusOrdem, @JsonKey(name: 'startTimestamp')  String? dataHoraInicio, @JsonKey(name: 'endTimestamp')  String? dataHoraFim, @JsonKey(name: 'vehicleId')  int? idVeiculo, @JsonKey(name: 'vehicleExternalId')  String? veiculoIdExterno, @JsonKey(name: 'vehicleLicensePlate')  String? placaVeiculo, @JsonKey(name: 'employeeId')  int? idFuncionario, @JsonKey(name: 'employeeFullName')  String? nomeCompletoResposavel, @JsonKey(name: 'deadline')  int? prazoFinal, @JsonKey(name: 'deadlineTimestamp')  String? dataHoraPrazoFinal, @JsonKey(name: 'attempt')  int tentativas, @JsonKey(name: 'latitude')  String? latitude, @JsonKey(name: 'longitude')  String? longitude, @JsonKey(name: 'additionalInformation')  String? informacoesAdicionais, @JsonKey(name: 'serviceOrderCancellationId')  String? idOrdemCancelamento, @JsonKey(name: 'serviceOrderCancellationDescription')  String? motivoCancelamento, @JsonKey(name: 'comment')  String? comentario, @JsonKey(name: 'digitalSignatureURL')  String? urlAssinaturaDigital, @JsonKey(name: 'timestamp')  String? dataHora)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrdemServico() when $default != null:
return $default(_that.id,_that.idEmpresa,_that.nomeEmpresa,_that.idEmpresaDestinataria,_that.nomeEmpresaDestinaria,_that.nomeLegalEmpresaDestinaria,_that.numeroPedido,_that.tipo,_that.nomeFluxoTrabalho,_that.descricaoFluxoTrabalho,_that.status,_that.descricaoStatusOrdem,_that.dataHoraInicio,_that.dataHoraFim,_that.idVeiculo,_that.veiculoIdExterno,_that.placaVeiculo,_that.idFuncionario,_that.nomeCompletoResposavel,_that.prazoFinal,_that.dataHoraPrazoFinal,_that.tentativas,_that.latitude,_that.longitude,_that.informacoesAdicionais,_that.idOrdemCancelamento,_that.motivoCancelamento,_that.comentario,_that.urlAssinaturaDigital,_that.dataHora);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id, @JsonKey(name: 'companyId')  int? idEmpresa, @JsonKey(name: 'companyName')  String? nomeEmpresa, @JsonKey(name: 'recipientCompanyId')  int? idEmpresaDestinataria, @JsonKey(name: 'recipientCompanyName')  String? nomeEmpresaDestinaria, @JsonKey(name: 'recipientCompanyLegalName')  String? nomeLegalEmpresaDestinaria, @JsonKey(name: 'orderNumber')  String? numeroPedido, @JsonKey(name: 'workflowId')  int? tipo, @JsonKey(name: 'workflowName')  String? nomeFluxoTrabalho, @JsonKey(name: 'workflowDescription')  String? descricaoFluxoTrabalho, @JsonKey(name: 'serviceOrderStatusId')  int? status, @JsonKey(name: 'serviceOrderStatusDescription')  String? descricaoStatusOrdem, @JsonKey(name: 'startTimestamp')  String? dataHoraInicio, @JsonKey(name: 'endTimestamp')  String? dataHoraFim, @JsonKey(name: 'vehicleId')  int? idVeiculo, @JsonKey(name: 'vehicleExternalId')  String? veiculoIdExterno, @JsonKey(name: 'vehicleLicensePlate')  String? placaVeiculo, @JsonKey(name: 'employeeId')  int? idFuncionario, @JsonKey(name: 'employeeFullName')  String? nomeCompletoResposavel, @JsonKey(name: 'deadline')  int? prazoFinal, @JsonKey(name: 'deadlineTimestamp')  String? dataHoraPrazoFinal, @JsonKey(name: 'attempt')  int tentativas, @JsonKey(name: 'latitude')  String? latitude, @JsonKey(name: 'longitude')  String? longitude, @JsonKey(name: 'additionalInformation')  String? informacoesAdicionais, @JsonKey(name: 'serviceOrderCancellationId')  String? idOrdemCancelamento, @JsonKey(name: 'serviceOrderCancellationDescription')  String? motivoCancelamento, @JsonKey(name: 'comment')  String? comentario, @JsonKey(name: 'digitalSignatureURL')  String? urlAssinaturaDigital, @JsonKey(name: 'timestamp')  String? dataHora)  $default,) {final _that = this;
switch (_that) {
case _OrdemServico():
return $default(_that.id,_that.idEmpresa,_that.nomeEmpresa,_that.idEmpresaDestinataria,_that.nomeEmpresaDestinaria,_that.nomeLegalEmpresaDestinaria,_that.numeroPedido,_that.tipo,_that.nomeFluxoTrabalho,_that.descricaoFluxoTrabalho,_that.status,_that.descricaoStatusOrdem,_that.dataHoraInicio,_that.dataHoraFim,_that.idVeiculo,_that.veiculoIdExterno,_that.placaVeiculo,_that.idFuncionario,_that.nomeCompletoResposavel,_that.prazoFinal,_that.dataHoraPrazoFinal,_that.tentativas,_that.latitude,_that.longitude,_that.informacoesAdicionais,_that.idOrdemCancelamento,_that.motivoCancelamento,_that.comentario,_that.urlAssinaturaDigital,_that.dataHora);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id, @JsonKey(name: 'companyId')  int? idEmpresa, @JsonKey(name: 'companyName')  String? nomeEmpresa, @JsonKey(name: 'recipientCompanyId')  int? idEmpresaDestinataria, @JsonKey(name: 'recipientCompanyName')  String? nomeEmpresaDestinaria, @JsonKey(name: 'recipientCompanyLegalName')  String? nomeLegalEmpresaDestinaria, @JsonKey(name: 'orderNumber')  String? numeroPedido, @JsonKey(name: 'workflowId')  int? tipo, @JsonKey(name: 'workflowName')  String? nomeFluxoTrabalho, @JsonKey(name: 'workflowDescription')  String? descricaoFluxoTrabalho, @JsonKey(name: 'serviceOrderStatusId')  int? status, @JsonKey(name: 'serviceOrderStatusDescription')  String? descricaoStatusOrdem, @JsonKey(name: 'startTimestamp')  String? dataHoraInicio, @JsonKey(name: 'endTimestamp')  String? dataHoraFim, @JsonKey(name: 'vehicleId')  int? idVeiculo, @JsonKey(name: 'vehicleExternalId')  String? veiculoIdExterno, @JsonKey(name: 'vehicleLicensePlate')  String? placaVeiculo, @JsonKey(name: 'employeeId')  int? idFuncionario, @JsonKey(name: 'employeeFullName')  String? nomeCompletoResposavel, @JsonKey(name: 'deadline')  int? prazoFinal, @JsonKey(name: 'deadlineTimestamp')  String? dataHoraPrazoFinal, @JsonKey(name: 'attempt')  int tentativas, @JsonKey(name: 'latitude')  String? latitude, @JsonKey(name: 'longitude')  String? longitude, @JsonKey(name: 'additionalInformation')  String? informacoesAdicionais, @JsonKey(name: 'serviceOrderCancellationId')  String? idOrdemCancelamento, @JsonKey(name: 'serviceOrderCancellationDescription')  String? motivoCancelamento, @JsonKey(name: 'comment')  String? comentario, @JsonKey(name: 'digitalSignatureURL')  String? urlAssinaturaDigital, @JsonKey(name: 'timestamp')  String? dataHora)?  $default,) {final _that = this;
switch (_that) {
case _OrdemServico() when $default != null:
return $default(_that.id,_that.idEmpresa,_that.nomeEmpresa,_that.idEmpresaDestinataria,_that.nomeEmpresaDestinaria,_that.nomeLegalEmpresaDestinaria,_that.numeroPedido,_that.tipo,_that.nomeFluxoTrabalho,_that.descricaoFluxoTrabalho,_that.status,_that.descricaoStatusOrdem,_that.dataHoraInicio,_that.dataHoraFim,_that.idVeiculo,_that.veiculoIdExterno,_that.placaVeiculo,_that.idFuncionario,_that.nomeCompletoResposavel,_that.prazoFinal,_that.dataHoraPrazoFinal,_that.tentativas,_that.latitude,_that.longitude,_that.informacoesAdicionais,_that.idOrdemCancelamento,_that.motivoCancelamento,_that.comentario,_that.urlAssinaturaDigital,_that.dataHora);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrdemServico implements OrdemServico {
   _OrdemServico({required this.id, @JsonKey(name: 'companyId') required this.idEmpresa, @JsonKey(name: 'companyName') required this.nomeEmpresa, @JsonKey(name: 'recipientCompanyId') required this.idEmpresaDestinataria, @JsonKey(name: 'recipientCompanyName') required this.nomeEmpresaDestinaria, @JsonKey(name: 'recipientCompanyLegalName') required this.nomeLegalEmpresaDestinaria, @JsonKey(name: 'orderNumber') required this.numeroPedido, @JsonKey(name: 'workflowId') required this.tipo, @JsonKey(name: 'workflowName') required this.nomeFluxoTrabalho, @JsonKey(name: 'workflowDescription') required this.descricaoFluxoTrabalho, @JsonKey(name: 'serviceOrderStatusId') required this.status, @JsonKey(name: 'serviceOrderStatusDescription') required this.descricaoStatusOrdem, @JsonKey(name: 'startTimestamp') this.dataHoraInicio, @JsonKey(name: 'endTimestamp') this.dataHoraFim, @JsonKey(name: 'vehicleId') required this.idVeiculo, @JsonKey(name: 'vehicleExternalId') required this.veiculoIdExterno, @JsonKey(name: 'vehicleLicensePlate') required this.placaVeiculo, @JsonKey(name: 'employeeId') required this.idFuncionario, @JsonKey(name: 'employeeFullName') required this.nomeCompletoResposavel, @JsonKey(name: 'deadline') required this.prazoFinal, @JsonKey(name: 'deadlineTimestamp') required this.dataHoraPrazoFinal, @JsonKey(name: 'attempt') required this.tentativas, @JsonKey(name: 'latitude') required this.latitude, @JsonKey(name: 'longitude') required this.longitude, @JsonKey(name: 'additionalInformation') required this.informacoesAdicionais, @JsonKey(name: 'serviceOrderCancellationId') this.idOrdemCancelamento, @JsonKey(name: 'serviceOrderCancellationDescription') this.motivoCancelamento, @JsonKey(name: 'comment') this.comentario, @JsonKey(name: 'digitalSignatureURL') this.urlAssinaturaDigital, @JsonKey(name: 'timestamp') required this.dataHora});
  factory _OrdemServico.fromJson(Map<String, dynamic> json) => _$OrdemServicoFromJson(json);

@override final  int? id;
@override@JsonKey(name: 'companyId') final  int? idEmpresa;
@override@JsonKey(name: 'companyName') final  String? nomeEmpresa;
@override@JsonKey(name: 'recipientCompanyId') final  int? idEmpresaDestinataria;
@override@JsonKey(name: 'recipientCompanyName') final  String? nomeEmpresaDestinaria;
@override@JsonKey(name: 'recipientCompanyLegalName') final  String? nomeLegalEmpresaDestinaria;
@override@JsonKey(name: 'orderNumber') final  String? numeroPedido;
@override@JsonKey(name: 'workflowId') final  int? tipo;
@override@JsonKey(name: 'workflowName') final  String? nomeFluxoTrabalho;
@override@JsonKey(name: 'workflowDescription') final  String? descricaoFluxoTrabalho;
@override@JsonKey(name: 'serviceOrderStatusId') final  int? status;
@override@JsonKey(name: 'serviceOrderStatusDescription') final  String? descricaoStatusOrdem;
@override@JsonKey(name: 'startTimestamp') final  String? dataHoraInicio;
@override@JsonKey(name: 'endTimestamp') final  String? dataHoraFim;
@override@JsonKey(name: 'vehicleId') final  int? idVeiculo;
@override@JsonKey(name: 'vehicleExternalId') final  String? veiculoIdExterno;
@override@JsonKey(name: 'vehicleLicensePlate') final  String? placaVeiculo;
@override@JsonKey(name: 'employeeId') final  int? idFuncionario;
@override@JsonKey(name: 'employeeFullName') final  String? nomeCompletoResposavel;
@override@JsonKey(name: 'deadline') final  int? prazoFinal;
@override@JsonKey(name: 'deadlineTimestamp') final  String? dataHoraPrazoFinal;
@override@JsonKey(name: 'attempt') final  int tentativas;
@override@JsonKey(name: 'latitude') final  String? latitude;
@override@JsonKey(name: 'longitude') final  String? longitude;
@override@JsonKey(name: 'additionalInformation') final  String? informacoesAdicionais;
@override@JsonKey(name: 'serviceOrderCancellationId') final  String? idOrdemCancelamento;
@override@JsonKey(name: 'serviceOrderCancellationDescription') final  String? motivoCancelamento;
@override@JsonKey(name: 'comment') final  String? comentario;
@override@JsonKey(name: 'digitalSignatureURL') final  String? urlAssinaturaDigital;
@override@JsonKey(name: 'timestamp') final  String? dataHora;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrdemServico&&(identical(other.id, id) || other.id == id)&&(identical(other.idEmpresa, idEmpresa) || other.idEmpresa == idEmpresa)&&(identical(other.nomeEmpresa, nomeEmpresa) || other.nomeEmpresa == nomeEmpresa)&&(identical(other.idEmpresaDestinataria, idEmpresaDestinataria) || other.idEmpresaDestinataria == idEmpresaDestinataria)&&(identical(other.nomeEmpresaDestinaria, nomeEmpresaDestinaria) || other.nomeEmpresaDestinaria == nomeEmpresaDestinaria)&&(identical(other.nomeLegalEmpresaDestinaria, nomeLegalEmpresaDestinaria) || other.nomeLegalEmpresaDestinaria == nomeLegalEmpresaDestinaria)&&(identical(other.numeroPedido, numeroPedido) || other.numeroPedido == numeroPedido)&&(identical(other.tipo, tipo) || other.tipo == tipo)&&(identical(other.nomeFluxoTrabalho, nomeFluxoTrabalho) || other.nomeFluxoTrabalho == nomeFluxoTrabalho)&&(identical(other.descricaoFluxoTrabalho, descricaoFluxoTrabalho) || other.descricaoFluxoTrabalho == descricaoFluxoTrabalho)&&(identical(other.status, status) || other.status == status)&&(identical(other.descricaoStatusOrdem, descricaoStatusOrdem) || other.descricaoStatusOrdem == descricaoStatusOrdem)&&(identical(other.dataHoraInicio, dataHoraInicio) || other.dataHoraInicio == dataHoraInicio)&&(identical(other.dataHoraFim, dataHoraFim) || other.dataHoraFim == dataHoraFim)&&(identical(other.idVeiculo, idVeiculo) || other.idVeiculo == idVeiculo)&&(identical(other.veiculoIdExterno, veiculoIdExterno) || other.veiculoIdExterno == veiculoIdExterno)&&(identical(other.placaVeiculo, placaVeiculo) || other.placaVeiculo == placaVeiculo)&&(identical(other.idFuncionario, idFuncionario) || other.idFuncionario == idFuncionario)&&(identical(other.nomeCompletoResposavel, nomeCompletoResposavel) || other.nomeCompletoResposavel == nomeCompletoResposavel)&&(identical(other.prazoFinal, prazoFinal) || other.prazoFinal == prazoFinal)&&(identical(other.dataHoraPrazoFinal, dataHoraPrazoFinal) || other.dataHoraPrazoFinal == dataHoraPrazoFinal)&&(identical(other.tentativas, tentativas) || other.tentativas == tentativas)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.informacoesAdicionais, informacoesAdicionais) || other.informacoesAdicionais == informacoesAdicionais)&&(identical(other.idOrdemCancelamento, idOrdemCancelamento) || other.idOrdemCancelamento == idOrdemCancelamento)&&(identical(other.motivoCancelamento, motivoCancelamento) || other.motivoCancelamento == motivoCancelamento)&&(identical(other.comentario, comentario) || other.comentario == comentario)&&(identical(other.urlAssinaturaDigital, urlAssinaturaDigital) || other.urlAssinaturaDigital == urlAssinaturaDigital)&&(identical(other.dataHora, dataHora) || other.dataHora == dataHora));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,idEmpresa,nomeEmpresa,idEmpresaDestinataria,nomeEmpresaDestinaria,nomeLegalEmpresaDestinaria,numeroPedido,tipo,nomeFluxoTrabalho,descricaoFluxoTrabalho,status,descricaoStatusOrdem,dataHoraInicio,dataHoraFim,idVeiculo,veiculoIdExterno,placaVeiculo,idFuncionario,nomeCompletoResposavel,prazoFinal,dataHoraPrazoFinal,tentativas,latitude,longitude,informacoesAdicionais,idOrdemCancelamento,motivoCancelamento,comentario,urlAssinaturaDigital,dataHora]);

@override
String toString() {
  return 'OrdemServico(id: $id, idEmpresa: $idEmpresa, nomeEmpresa: $nomeEmpresa, idEmpresaDestinataria: $idEmpresaDestinataria, nomeEmpresaDestinaria: $nomeEmpresaDestinaria, nomeLegalEmpresaDestinaria: $nomeLegalEmpresaDestinaria, numeroPedido: $numeroPedido, tipo: $tipo, nomeFluxoTrabalho: $nomeFluxoTrabalho, descricaoFluxoTrabalho: $descricaoFluxoTrabalho, status: $status, descricaoStatusOrdem: $descricaoStatusOrdem, dataHoraInicio: $dataHoraInicio, dataHoraFim: $dataHoraFim, idVeiculo: $idVeiculo, veiculoIdExterno: $veiculoIdExterno, placaVeiculo: $placaVeiculo, idFuncionario: $idFuncionario, nomeCompletoResposavel: $nomeCompletoResposavel, prazoFinal: $prazoFinal, dataHoraPrazoFinal: $dataHoraPrazoFinal, tentativas: $tentativas, latitude: $latitude, longitude: $longitude, informacoesAdicionais: $informacoesAdicionais, idOrdemCancelamento: $idOrdemCancelamento, motivoCancelamento: $motivoCancelamento, comentario: $comentario, urlAssinaturaDigital: $urlAssinaturaDigital, dataHora: $dataHora)';
}


}

/// @nodoc
abstract mixin class _$OrdemServicoCopyWith<$Res> implements $OrdemServicoCopyWith<$Res> {
  factory _$OrdemServicoCopyWith(_OrdemServico value, $Res Function(_OrdemServico) _then) = __$OrdemServicoCopyWithImpl;
@override @useResult
$Res call({
 int? id,@JsonKey(name: 'companyId') int? idEmpresa,@JsonKey(name: 'companyName') String? nomeEmpresa,@JsonKey(name: 'recipientCompanyId') int? idEmpresaDestinataria,@JsonKey(name: 'recipientCompanyName') String? nomeEmpresaDestinaria,@JsonKey(name: 'recipientCompanyLegalName') String? nomeLegalEmpresaDestinaria,@JsonKey(name: 'orderNumber') String? numeroPedido,@JsonKey(name: 'workflowId') int? tipo,@JsonKey(name: 'workflowName') String? nomeFluxoTrabalho,@JsonKey(name: 'workflowDescription') String? descricaoFluxoTrabalho,@JsonKey(name: 'serviceOrderStatusId') int? status,@JsonKey(name: 'serviceOrderStatusDescription') String? descricaoStatusOrdem,@JsonKey(name: 'startTimestamp') String? dataHoraInicio,@JsonKey(name: 'endTimestamp') String? dataHoraFim,@JsonKey(name: 'vehicleId') int? idVeiculo,@JsonKey(name: 'vehicleExternalId') String? veiculoIdExterno,@JsonKey(name: 'vehicleLicensePlate') String? placaVeiculo,@JsonKey(name: 'employeeId') int? idFuncionario,@JsonKey(name: 'employeeFullName') String? nomeCompletoResposavel,@JsonKey(name: 'deadline') int? prazoFinal,@JsonKey(name: 'deadlineTimestamp') String? dataHoraPrazoFinal,@JsonKey(name: 'attempt') int tentativas,@JsonKey(name: 'latitude') String? latitude,@JsonKey(name: 'longitude') String? longitude,@JsonKey(name: 'additionalInformation') String? informacoesAdicionais,@JsonKey(name: 'serviceOrderCancellationId') String? idOrdemCancelamento,@JsonKey(name: 'serviceOrderCancellationDescription') String? motivoCancelamento,@JsonKey(name: 'comment') String? comentario,@JsonKey(name: 'digitalSignatureURL') String? urlAssinaturaDigital,@JsonKey(name: 'timestamp') String? dataHora
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? idEmpresa = freezed,Object? nomeEmpresa = freezed,Object? idEmpresaDestinataria = freezed,Object? nomeEmpresaDestinaria = freezed,Object? nomeLegalEmpresaDestinaria = freezed,Object? numeroPedido = freezed,Object? tipo = freezed,Object? nomeFluxoTrabalho = freezed,Object? descricaoFluxoTrabalho = freezed,Object? status = freezed,Object? descricaoStatusOrdem = freezed,Object? dataHoraInicio = freezed,Object? dataHoraFim = freezed,Object? idVeiculo = freezed,Object? veiculoIdExterno = freezed,Object? placaVeiculo = freezed,Object? idFuncionario = freezed,Object? nomeCompletoResposavel = freezed,Object? prazoFinal = freezed,Object? dataHoraPrazoFinal = freezed,Object? tentativas = null,Object? latitude = freezed,Object? longitude = freezed,Object? informacoesAdicionais = freezed,Object? idOrdemCancelamento = freezed,Object? motivoCancelamento = freezed,Object? comentario = freezed,Object? urlAssinaturaDigital = freezed,Object? dataHora = freezed,}) {
  return _then(_OrdemServico(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,idEmpresa: freezed == idEmpresa ? _self.idEmpresa : idEmpresa // ignore: cast_nullable_to_non_nullable
as int?,nomeEmpresa: freezed == nomeEmpresa ? _self.nomeEmpresa : nomeEmpresa // ignore: cast_nullable_to_non_nullable
as String?,idEmpresaDestinataria: freezed == idEmpresaDestinataria ? _self.idEmpresaDestinataria : idEmpresaDestinataria // ignore: cast_nullable_to_non_nullable
as int?,nomeEmpresaDestinaria: freezed == nomeEmpresaDestinaria ? _self.nomeEmpresaDestinaria : nomeEmpresaDestinaria // ignore: cast_nullable_to_non_nullable
as String?,nomeLegalEmpresaDestinaria: freezed == nomeLegalEmpresaDestinaria ? _self.nomeLegalEmpresaDestinaria : nomeLegalEmpresaDestinaria // ignore: cast_nullable_to_non_nullable
as String?,numeroPedido: freezed == numeroPedido ? _self.numeroPedido : numeroPedido // ignore: cast_nullable_to_non_nullable
as String?,tipo: freezed == tipo ? _self.tipo : tipo // ignore: cast_nullable_to_non_nullable
as int?,nomeFluxoTrabalho: freezed == nomeFluxoTrabalho ? _self.nomeFluxoTrabalho : nomeFluxoTrabalho // ignore: cast_nullable_to_non_nullable
as String?,descricaoFluxoTrabalho: freezed == descricaoFluxoTrabalho ? _self.descricaoFluxoTrabalho : descricaoFluxoTrabalho // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int?,descricaoStatusOrdem: freezed == descricaoStatusOrdem ? _self.descricaoStatusOrdem : descricaoStatusOrdem // ignore: cast_nullable_to_non_nullable
as String?,dataHoraInicio: freezed == dataHoraInicio ? _self.dataHoraInicio : dataHoraInicio // ignore: cast_nullable_to_non_nullable
as String?,dataHoraFim: freezed == dataHoraFim ? _self.dataHoraFim : dataHoraFim // ignore: cast_nullable_to_non_nullable
as String?,idVeiculo: freezed == idVeiculo ? _self.idVeiculo : idVeiculo // ignore: cast_nullable_to_non_nullable
as int?,veiculoIdExterno: freezed == veiculoIdExterno ? _self.veiculoIdExterno : veiculoIdExterno // ignore: cast_nullable_to_non_nullable
as String?,placaVeiculo: freezed == placaVeiculo ? _self.placaVeiculo : placaVeiculo // ignore: cast_nullable_to_non_nullable
as String?,idFuncionario: freezed == idFuncionario ? _self.idFuncionario : idFuncionario // ignore: cast_nullable_to_non_nullable
as int?,nomeCompletoResposavel: freezed == nomeCompletoResposavel ? _self.nomeCompletoResposavel : nomeCompletoResposavel // ignore: cast_nullable_to_non_nullable
as String?,prazoFinal: freezed == prazoFinal ? _self.prazoFinal : prazoFinal // ignore: cast_nullable_to_non_nullable
as int?,dataHoraPrazoFinal: freezed == dataHoraPrazoFinal ? _self.dataHoraPrazoFinal : dataHoraPrazoFinal // ignore: cast_nullable_to_non_nullable
as String?,tentativas: null == tentativas ? _self.tentativas : tentativas // ignore: cast_nullable_to_non_nullable
as int,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as String?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as String?,informacoesAdicionais: freezed == informacoesAdicionais ? _self.informacoesAdicionais : informacoesAdicionais // ignore: cast_nullable_to_non_nullable
as String?,idOrdemCancelamento: freezed == idOrdemCancelamento ? _self.idOrdemCancelamento : idOrdemCancelamento // ignore: cast_nullable_to_non_nullable
as String?,motivoCancelamento: freezed == motivoCancelamento ? _self.motivoCancelamento : motivoCancelamento // ignore: cast_nullable_to_non_nullable
as String?,comentario: freezed == comentario ? _self.comentario : comentario // ignore: cast_nullable_to_non_nullable
as String?,urlAssinaturaDigital: freezed == urlAssinaturaDigital ? _self.urlAssinaturaDigital : urlAssinaturaDigital // ignore: cast_nullable_to_non_nullable
as String?,dataHora: freezed == dataHora ? _self.dataHora : dataHora // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
