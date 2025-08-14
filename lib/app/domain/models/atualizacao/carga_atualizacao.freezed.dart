// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'carga_atualizacao.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CargaAtualizacao {

 int? get id; double get versao; List<String> get carga;
/// Create a copy of CargaAtualizacao
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CargaAtualizacaoCopyWith<CargaAtualizacao> get copyWith => _$CargaAtualizacaoCopyWithImpl<CargaAtualizacao>(this as CargaAtualizacao, _$identity);

  /// Serializes this CargaAtualizacao to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CargaAtualizacao&&(identical(other.id, id) || other.id == id)&&(identical(other.versao, versao) || other.versao == versao)&&const DeepCollectionEquality().equals(other.carga, carga));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,versao,const DeepCollectionEquality().hash(carga));

@override
String toString() {
  return 'CargaAtualizacao(id: $id, versao: $versao, carga: $carga)';
}


}

/// @nodoc
abstract mixin class $CargaAtualizacaoCopyWith<$Res>  {
  factory $CargaAtualizacaoCopyWith(CargaAtualizacao value, $Res Function(CargaAtualizacao) _then) = _$CargaAtualizacaoCopyWithImpl;
@useResult
$Res call({
 int? id, double versao, List<String> carga
});




}
/// @nodoc
class _$CargaAtualizacaoCopyWithImpl<$Res>
    implements $CargaAtualizacaoCopyWith<$Res> {
  _$CargaAtualizacaoCopyWithImpl(this._self, this._then);

  final CargaAtualizacao _self;
  final $Res Function(CargaAtualizacao) _then;

/// Create a copy of CargaAtualizacao
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? versao = null,Object? carga = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,versao: null == versao ? _self.versao : versao // ignore: cast_nullable_to_non_nullable
as double,carga: null == carga ? _self.carga : carga // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [CargaAtualizacao].
extension CargaAtualizacaoPatterns on CargaAtualizacao {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CargaAtualizacao value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CargaAtualizacao() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CargaAtualizacao value)  $default,){
final _that = this;
switch (_that) {
case _CargaAtualizacao():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CargaAtualizacao value)?  $default,){
final _that = this;
switch (_that) {
case _CargaAtualizacao() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  double versao,  List<String> carga)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CargaAtualizacao() when $default != null:
return $default(_that.id,_that.versao,_that.carga);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  double versao,  List<String> carga)  $default,) {final _that = this;
switch (_that) {
case _CargaAtualizacao():
return $default(_that.id,_that.versao,_that.carga);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  double versao,  List<String> carga)?  $default,) {final _that = this;
switch (_that) {
case _CargaAtualizacao() when $default != null:
return $default(_that.id,_that.versao,_that.carga);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CargaAtualizacao implements CargaAtualizacao {
  const _CargaAtualizacao({required this.id, required this.versao, required final  List<String> carga}): _carga = carga;
  factory _CargaAtualizacao.fromJson(Map<String, dynamic> json) => _$CargaAtualizacaoFromJson(json);

@override final  int? id;
@override final  double versao;
 final  List<String> _carga;
@override List<String> get carga {
  if (_carga is EqualUnmodifiableListView) return _carga;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_carga);
}


/// Create a copy of CargaAtualizacao
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CargaAtualizacaoCopyWith<_CargaAtualizacao> get copyWith => __$CargaAtualizacaoCopyWithImpl<_CargaAtualizacao>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CargaAtualizacaoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CargaAtualizacao&&(identical(other.id, id) || other.id == id)&&(identical(other.versao, versao) || other.versao == versao)&&const DeepCollectionEquality().equals(other._carga, _carga));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,versao,const DeepCollectionEquality().hash(_carga));

@override
String toString() {
  return 'CargaAtualizacao(id: $id, versao: $versao, carga: $carga)';
}


}

/// @nodoc
abstract mixin class _$CargaAtualizacaoCopyWith<$Res> implements $CargaAtualizacaoCopyWith<$Res> {
  factory _$CargaAtualizacaoCopyWith(_CargaAtualizacao value, $Res Function(_CargaAtualizacao) _then) = __$CargaAtualizacaoCopyWithImpl;
@override @useResult
$Res call({
 int? id, double versao, List<String> carga
});




}
/// @nodoc
class __$CargaAtualizacaoCopyWithImpl<$Res>
    implements _$CargaAtualizacaoCopyWith<$Res> {
  __$CargaAtualizacaoCopyWithImpl(this._self, this._then);

  final _CargaAtualizacao _self;
  final $Res Function(_CargaAtualizacao) _then;

/// Create a copy of CargaAtualizacao
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? versao = null,Object? carga = null,}) {
  return _then(_CargaAtualizacao(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,versao: null == versao ? _self.versao : versao // ignore: cast_nullable_to_non_nullable
as double,carga: null == carga ? _self._carga : carga // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
