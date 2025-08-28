// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'acao.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Acoes {

 int? get id; int? get tipo; String get descricaoTipo; Veiculo get veiculo; List<OpcaoChecklist> get checlist; int get typeTextField; String get descricao; int get capturaFotoHabilitado; String get descricaoEnvioFoto; int get qtdMaximaFoto; int get qtdMinimaFoto;
/// Create a copy of Acoes
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AcoesCopyWith<Acoes> get copyWith => _$AcoesCopyWithImpl<Acoes>(this as Acoes, _$identity);

  /// Serializes this Acoes to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Acoes&&(identical(other.id, id) || other.id == id)&&(identical(other.tipo, tipo) || other.tipo == tipo)&&(identical(other.descricaoTipo, descricaoTipo) || other.descricaoTipo == descricaoTipo)&&(identical(other.veiculo, veiculo) || other.veiculo == veiculo)&&const DeepCollectionEquality().equals(other.checlist, checlist)&&(identical(other.typeTextField, typeTextField) || other.typeTextField == typeTextField)&&(identical(other.descricao, descricao) || other.descricao == descricao)&&(identical(other.capturaFotoHabilitado, capturaFotoHabilitado) || other.capturaFotoHabilitado == capturaFotoHabilitado)&&(identical(other.descricaoEnvioFoto, descricaoEnvioFoto) || other.descricaoEnvioFoto == descricaoEnvioFoto)&&(identical(other.qtdMaximaFoto, qtdMaximaFoto) || other.qtdMaximaFoto == qtdMaximaFoto)&&(identical(other.qtdMinimaFoto, qtdMinimaFoto) || other.qtdMinimaFoto == qtdMinimaFoto));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,tipo,descricaoTipo,veiculo,const DeepCollectionEquality().hash(checlist),typeTextField,descricao,capturaFotoHabilitado,descricaoEnvioFoto,qtdMaximaFoto,qtdMinimaFoto);

@override
String toString() {
  return 'Acoes(id: $id, tipo: $tipo, descricaoTipo: $descricaoTipo, veiculo: $veiculo, checlist: $checlist, typeTextField: $typeTextField, descricao: $descricao, capturaFotoHabilitado: $capturaFotoHabilitado, descricaoEnvioFoto: $descricaoEnvioFoto, qtdMaximaFoto: $qtdMaximaFoto, qtdMinimaFoto: $qtdMinimaFoto)';
}


}

/// @nodoc
abstract mixin class $AcoesCopyWith<$Res>  {
  factory $AcoesCopyWith(Acoes value, $Res Function(Acoes) _then) = _$AcoesCopyWithImpl;
@useResult
$Res call({
 int? id, int? tipo, String descricaoTipo, Veiculo veiculo, List<OpcaoChecklist> checlist, int typeTextField, String descricao, int capturaFotoHabilitado, String descricaoEnvioFoto, int qtdMaximaFoto, int qtdMinimaFoto
});


$VeiculoCopyWith<$Res> get veiculo;

}
/// @nodoc
class _$AcoesCopyWithImpl<$Res>
    implements $AcoesCopyWith<$Res> {
  _$AcoesCopyWithImpl(this._self, this._then);

  final Acoes _self;
  final $Res Function(Acoes) _then;

/// Create a copy of Acoes
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? tipo = freezed,Object? descricaoTipo = null,Object? veiculo = null,Object? checlist = null,Object? typeTextField = null,Object? descricao = null,Object? capturaFotoHabilitado = null,Object? descricaoEnvioFoto = null,Object? qtdMaximaFoto = null,Object? qtdMinimaFoto = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,tipo: freezed == tipo ? _self.tipo : tipo // ignore: cast_nullable_to_non_nullable
as int?,descricaoTipo: null == descricaoTipo ? _self.descricaoTipo : descricaoTipo // ignore: cast_nullable_to_non_nullable
as String,veiculo: null == veiculo ? _self.veiculo : veiculo // ignore: cast_nullable_to_non_nullable
as Veiculo,checlist: null == checlist ? _self.checlist : checlist // ignore: cast_nullable_to_non_nullable
as List<OpcaoChecklist>,typeTextField: null == typeTextField ? _self.typeTextField : typeTextField // ignore: cast_nullable_to_non_nullable
as int,descricao: null == descricao ? _self.descricao : descricao // ignore: cast_nullable_to_non_nullable
as String,capturaFotoHabilitado: null == capturaFotoHabilitado ? _self.capturaFotoHabilitado : capturaFotoHabilitado // ignore: cast_nullable_to_non_nullable
as int,descricaoEnvioFoto: null == descricaoEnvioFoto ? _self.descricaoEnvioFoto : descricaoEnvioFoto // ignore: cast_nullable_to_non_nullable
as String,qtdMaximaFoto: null == qtdMaximaFoto ? _self.qtdMaximaFoto : qtdMaximaFoto // ignore: cast_nullable_to_non_nullable
as int,qtdMinimaFoto: null == qtdMinimaFoto ? _self.qtdMinimaFoto : qtdMinimaFoto // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of Acoes
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VeiculoCopyWith<$Res> get veiculo {
  
  return $VeiculoCopyWith<$Res>(_self.veiculo, (value) {
    return _then(_self.copyWith(veiculo: value));
  });
}
}


/// Adds pattern-matching-related methods to [Acoes].
extension AcoesPatterns on Acoes {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Acoes value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Acoes() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Acoes value)  $default,){
final _that = this;
switch (_that) {
case _Acoes():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Acoes value)?  $default,){
final _that = this;
switch (_that) {
case _Acoes() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  int? tipo,  String descricaoTipo,  Veiculo veiculo,  List<OpcaoChecklist> checlist,  int typeTextField,  String descricao,  int capturaFotoHabilitado,  String descricaoEnvioFoto,  int qtdMaximaFoto,  int qtdMinimaFoto)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Acoes() when $default != null:
return $default(_that.id,_that.tipo,_that.descricaoTipo,_that.veiculo,_that.checlist,_that.typeTextField,_that.descricao,_that.capturaFotoHabilitado,_that.descricaoEnvioFoto,_that.qtdMaximaFoto,_that.qtdMinimaFoto);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  int? tipo,  String descricaoTipo,  Veiculo veiculo,  List<OpcaoChecklist> checlist,  int typeTextField,  String descricao,  int capturaFotoHabilitado,  String descricaoEnvioFoto,  int qtdMaximaFoto,  int qtdMinimaFoto)  $default,) {final _that = this;
switch (_that) {
case _Acoes():
return $default(_that.id,_that.tipo,_that.descricaoTipo,_that.veiculo,_that.checlist,_that.typeTextField,_that.descricao,_that.capturaFotoHabilitado,_that.descricaoEnvioFoto,_that.qtdMaximaFoto,_that.qtdMinimaFoto);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  int? tipo,  String descricaoTipo,  Veiculo veiculo,  List<OpcaoChecklist> checlist,  int typeTextField,  String descricao,  int capturaFotoHabilitado,  String descricaoEnvioFoto,  int qtdMaximaFoto,  int qtdMinimaFoto)?  $default,) {final _that = this;
switch (_that) {
case _Acoes() when $default != null:
return $default(_that.id,_that.tipo,_that.descricaoTipo,_that.veiculo,_that.checlist,_that.typeTextField,_that.descricao,_that.capturaFotoHabilitado,_that.descricaoEnvioFoto,_that.qtdMaximaFoto,_that.qtdMinimaFoto);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Acoes implements Acoes {
  const _Acoes({required this.id, required this.tipo, required this.descricaoTipo, required this.veiculo, required final  List<OpcaoChecklist> checlist, required this.typeTextField, required this.descricao, required this.capturaFotoHabilitado, required this.descricaoEnvioFoto, required this.qtdMaximaFoto, required this.qtdMinimaFoto}): _checlist = checlist;
  factory _Acoes.fromJson(Map<String, dynamic> json) => _$AcoesFromJson(json);

@override final  int? id;
@override final  int? tipo;
@override final  String descricaoTipo;
@override final  Veiculo veiculo;
 final  List<OpcaoChecklist> _checlist;
@override List<OpcaoChecklist> get checlist {
  if (_checlist is EqualUnmodifiableListView) return _checlist;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_checlist);
}

@override final  int typeTextField;
@override final  String descricao;
@override final  int capturaFotoHabilitado;
@override final  String descricaoEnvioFoto;
@override final  int qtdMaximaFoto;
@override final  int qtdMinimaFoto;

/// Create a copy of Acoes
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AcoesCopyWith<_Acoes> get copyWith => __$AcoesCopyWithImpl<_Acoes>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AcoesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Acoes&&(identical(other.id, id) || other.id == id)&&(identical(other.tipo, tipo) || other.tipo == tipo)&&(identical(other.descricaoTipo, descricaoTipo) || other.descricaoTipo == descricaoTipo)&&(identical(other.veiculo, veiculo) || other.veiculo == veiculo)&&const DeepCollectionEquality().equals(other._checlist, _checlist)&&(identical(other.typeTextField, typeTextField) || other.typeTextField == typeTextField)&&(identical(other.descricao, descricao) || other.descricao == descricao)&&(identical(other.capturaFotoHabilitado, capturaFotoHabilitado) || other.capturaFotoHabilitado == capturaFotoHabilitado)&&(identical(other.descricaoEnvioFoto, descricaoEnvioFoto) || other.descricaoEnvioFoto == descricaoEnvioFoto)&&(identical(other.qtdMaximaFoto, qtdMaximaFoto) || other.qtdMaximaFoto == qtdMaximaFoto)&&(identical(other.qtdMinimaFoto, qtdMinimaFoto) || other.qtdMinimaFoto == qtdMinimaFoto));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,tipo,descricaoTipo,veiculo,const DeepCollectionEquality().hash(_checlist),typeTextField,descricao,capturaFotoHabilitado,descricaoEnvioFoto,qtdMaximaFoto,qtdMinimaFoto);

@override
String toString() {
  return 'Acoes(id: $id, tipo: $tipo, descricaoTipo: $descricaoTipo, veiculo: $veiculo, checlist: $checlist, typeTextField: $typeTextField, descricao: $descricao, capturaFotoHabilitado: $capturaFotoHabilitado, descricaoEnvioFoto: $descricaoEnvioFoto, qtdMaximaFoto: $qtdMaximaFoto, qtdMinimaFoto: $qtdMinimaFoto)';
}


}

/// @nodoc
abstract mixin class _$AcoesCopyWith<$Res> implements $AcoesCopyWith<$Res> {
  factory _$AcoesCopyWith(_Acoes value, $Res Function(_Acoes) _then) = __$AcoesCopyWithImpl;
@override @useResult
$Res call({
 int? id, int? tipo, String descricaoTipo, Veiculo veiculo, List<OpcaoChecklist> checlist, int typeTextField, String descricao, int capturaFotoHabilitado, String descricaoEnvioFoto, int qtdMaximaFoto, int qtdMinimaFoto
});


@override $VeiculoCopyWith<$Res> get veiculo;

}
/// @nodoc
class __$AcoesCopyWithImpl<$Res>
    implements _$AcoesCopyWith<$Res> {
  __$AcoesCopyWithImpl(this._self, this._then);

  final _Acoes _self;
  final $Res Function(_Acoes) _then;

/// Create a copy of Acoes
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? tipo = freezed,Object? descricaoTipo = null,Object? veiculo = null,Object? checlist = null,Object? typeTextField = null,Object? descricao = null,Object? capturaFotoHabilitado = null,Object? descricaoEnvioFoto = null,Object? qtdMaximaFoto = null,Object? qtdMinimaFoto = null,}) {
  return _then(_Acoes(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,tipo: freezed == tipo ? _self.tipo : tipo // ignore: cast_nullable_to_non_nullable
as int?,descricaoTipo: null == descricaoTipo ? _self.descricaoTipo : descricaoTipo // ignore: cast_nullable_to_non_nullable
as String,veiculo: null == veiculo ? _self.veiculo : veiculo // ignore: cast_nullable_to_non_nullable
as Veiculo,checlist: null == checlist ? _self._checlist : checlist // ignore: cast_nullable_to_non_nullable
as List<OpcaoChecklist>,typeTextField: null == typeTextField ? _self.typeTextField : typeTextField // ignore: cast_nullable_to_non_nullable
as int,descricao: null == descricao ? _self.descricao : descricao // ignore: cast_nullable_to_non_nullable
as String,capturaFotoHabilitado: null == capturaFotoHabilitado ? _self.capturaFotoHabilitado : capturaFotoHabilitado // ignore: cast_nullable_to_non_nullable
as int,descricaoEnvioFoto: null == descricaoEnvioFoto ? _self.descricaoEnvioFoto : descricaoEnvioFoto // ignore: cast_nullable_to_non_nullable
as String,qtdMaximaFoto: null == qtdMaximaFoto ? _self.qtdMaximaFoto : qtdMaximaFoto // ignore: cast_nullable_to_non_nullable
as int,qtdMinimaFoto: null == qtdMinimaFoto ? _self.qtdMinimaFoto : qtdMinimaFoto // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of Acoes
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VeiculoCopyWith<$Res> get veiculo {
  
  return $VeiculoCopyWith<$Res>(_self.veiculo, (value) {
    return _then(_self.copyWith(veiculo: value));
  });
}
}

// dart format on
