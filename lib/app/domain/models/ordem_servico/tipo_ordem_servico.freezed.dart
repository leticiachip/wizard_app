// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tipo_ordem_servico.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TipoOrdemServico {

 int? get id; String? get idOrdem; int get tipo; int get descricaoTipo; Veiculo get veiculo; WorkFlow get workflow;
/// Create a copy of TipoOrdemServico
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TipoOrdemServicoCopyWith<TipoOrdemServico> get copyWith => _$TipoOrdemServicoCopyWithImpl<TipoOrdemServico>(this as TipoOrdemServico, _$identity);

  /// Serializes this TipoOrdemServico to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TipoOrdemServico&&(identical(other.id, id) || other.id == id)&&(identical(other.idOrdem, idOrdem) || other.idOrdem == idOrdem)&&(identical(other.tipo, tipo) || other.tipo == tipo)&&(identical(other.descricaoTipo, descricaoTipo) || other.descricaoTipo == descricaoTipo)&&(identical(other.veiculo, veiculo) || other.veiculo == veiculo)&&(identical(other.workflow, workflow) || other.workflow == workflow));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,idOrdem,tipo,descricaoTipo,veiculo,workflow);

@override
String toString() {
  return 'TipoOrdemServico(id: $id, idOrdem: $idOrdem, tipo: $tipo, descricaoTipo: $descricaoTipo, veiculo: $veiculo, workflow: $workflow)';
}


}

/// @nodoc
abstract mixin class $TipoOrdemServicoCopyWith<$Res>  {
  factory $TipoOrdemServicoCopyWith(TipoOrdemServico value, $Res Function(TipoOrdemServico) _then) = _$TipoOrdemServicoCopyWithImpl;
@useResult
$Res call({
 int? id, String? idOrdem, int tipo, int descricaoTipo, Veiculo veiculo, WorkFlow workflow
});


$VeiculoCopyWith<$Res> get veiculo;$WorkFlowCopyWith<$Res> get workflow;

}
/// @nodoc
class _$TipoOrdemServicoCopyWithImpl<$Res>
    implements $TipoOrdemServicoCopyWith<$Res> {
  _$TipoOrdemServicoCopyWithImpl(this._self, this._then);

  final TipoOrdemServico _self;
  final $Res Function(TipoOrdemServico) _then;

/// Create a copy of TipoOrdemServico
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? idOrdem = freezed,Object? tipo = null,Object? descricaoTipo = null,Object? veiculo = null,Object? workflow = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,idOrdem: freezed == idOrdem ? _self.idOrdem : idOrdem // ignore: cast_nullable_to_non_nullable
as String?,tipo: null == tipo ? _self.tipo : tipo // ignore: cast_nullable_to_non_nullable
as int,descricaoTipo: null == descricaoTipo ? _self.descricaoTipo : descricaoTipo // ignore: cast_nullable_to_non_nullable
as int,veiculo: null == veiculo ? _self.veiculo : veiculo // ignore: cast_nullable_to_non_nullable
as Veiculo,workflow: null == workflow ? _self.workflow : workflow // ignore: cast_nullable_to_non_nullable
as WorkFlow,
  ));
}
/// Create a copy of TipoOrdemServico
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VeiculoCopyWith<$Res> get veiculo {
  
  return $VeiculoCopyWith<$Res>(_self.veiculo, (value) {
    return _then(_self.copyWith(veiculo: value));
  });
}/// Create a copy of TipoOrdemServico
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WorkFlowCopyWith<$Res> get workflow {
  
  return $WorkFlowCopyWith<$Res>(_self.workflow, (value) {
    return _then(_self.copyWith(workflow: value));
  });
}
}


/// Adds pattern-matching-related methods to [TipoOrdemServico].
extension TipoOrdemServicoPatterns on TipoOrdemServico {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TipoOrdemServico value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TipoOrdemServico() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TipoOrdemServico value)  $default,){
final _that = this;
switch (_that) {
case _TipoOrdemServico():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TipoOrdemServico value)?  $default,){
final _that = this;
switch (_that) {
case _TipoOrdemServico() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? idOrdem,  int tipo,  int descricaoTipo,  Veiculo veiculo,  WorkFlow workflow)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TipoOrdemServico() when $default != null:
return $default(_that.id,_that.idOrdem,_that.tipo,_that.descricaoTipo,_that.veiculo,_that.workflow);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? idOrdem,  int tipo,  int descricaoTipo,  Veiculo veiculo,  WorkFlow workflow)  $default,) {final _that = this;
switch (_that) {
case _TipoOrdemServico():
return $default(_that.id,_that.idOrdem,_that.tipo,_that.descricaoTipo,_that.veiculo,_that.workflow);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? idOrdem,  int tipo,  int descricaoTipo,  Veiculo veiculo,  WorkFlow workflow)?  $default,) {final _that = this;
switch (_that) {
case _TipoOrdemServico() when $default != null:
return $default(_that.id,_that.idOrdem,_that.tipo,_that.descricaoTipo,_that.veiculo,_that.workflow);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TipoOrdemServico implements TipoOrdemServico {
  const _TipoOrdemServico({required this.id, required this.idOrdem, required this.tipo, required this.descricaoTipo, required this.veiculo, required this.workflow});
  factory _TipoOrdemServico.fromJson(Map<String, dynamic> json) => _$TipoOrdemServicoFromJson(json);

@override final  int? id;
@override final  String? idOrdem;
@override final  int tipo;
@override final  int descricaoTipo;
@override final  Veiculo veiculo;
@override final  WorkFlow workflow;

/// Create a copy of TipoOrdemServico
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TipoOrdemServicoCopyWith<_TipoOrdemServico> get copyWith => __$TipoOrdemServicoCopyWithImpl<_TipoOrdemServico>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TipoOrdemServicoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TipoOrdemServico&&(identical(other.id, id) || other.id == id)&&(identical(other.idOrdem, idOrdem) || other.idOrdem == idOrdem)&&(identical(other.tipo, tipo) || other.tipo == tipo)&&(identical(other.descricaoTipo, descricaoTipo) || other.descricaoTipo == descricaoTipo)&&(identical(other.veiculo, veiculo) || other.veiculo == veiculo)&&(identical(other.workflow, workflow) || other.workflow == workflow));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,idOrdem,tipo,descricaoTipo,veiculo,workflow);

@override
String toString() {
  return 'TipoOrdemServico(id: $id, idOrdem: $idOrdem, tipo: $tipo, descricaoTipo: $descricaoTipo, veiculo: $veiculo, workflow: $workflow)';
}


}

/// @nodoc
abstract mixin class _$TipoOrdemServicoCopyWith<$Res> implements $TipoOrdemServicoCopyWith<$Res> {
  factory _$TipoOrdemServicoCopyWith(_TipoOrdemServico value, $Res Function(_TipoOrdemServico) _then) = __$TipoOrdemServicoCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? idOrdem, int tipo, int descricaoTipo, Veiculo veiculo, WorkFlow workflow
});


@override $VeiculoCopyWith<$Res> get veiculo;@override $WorkFlowCopyWith<$Res> get workflow;

}
/// @nodoc
class __$TipoOrdemServicoCopyWithImpl<$Res>
    implements _$TipoOrdemServicoCopyWith<$Res> {
  __$TipoOrdemServicoCopyWithImpl(this._self, this._then);

  final _TipoOrdemServico _self;
  final $Res Function(_TipoOrdemServico) _then;

/// Create a copy of TipoOrdemServico
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? idOrdem = freezed,Object? tipo = null,Object? descricaoTipo = null,Object? veiculo = null,Object? workflow = null,}) {
  return _then(_TipoOrdemServico(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,idOrdem: freezed == idOrdem ? _self.idOrdem : idOrdem // ignore: cast_nullable_to_non_nullable
as String?,tipo: null == tipo ? _self.tipo : tipo // ignore: cast_nullable_to_non_nullable
as int,descricaoTipo: null == descricaoTipo ? _self.descricaoTipo : descricaoTipo // ignore: cast_nullable_to_non_nullable
as int,veiculo: null == veiculo ? _self.veiculo : veiculo // ignore: cast_nullable_to_non_nullable
as Veiculo,workflow: null == workflow ? _self.workflow : workflow // ignore: cast_nullable_to_non_nullable
as WorkFlow,
  ));
}

/// Create a copy of TipoOrdemServico
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VeiculoCopyWith<$Res> get veiculo {
  
  return $VeiculoCopyWith<$Res>(_self.veiculo, (value) {
    return _then(_self.copyWith(veiculo: value));
  });
}/// Create a copy of TipoOrdemServico
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WorkFlowCopyWith<$Res> get workflow {
  
  return $WorkFlowCopyWith<$Res>(_self.workflow, (value) {
    return _then(_self.copyWith(workflow: value));
  });
}
}

// dart format on
