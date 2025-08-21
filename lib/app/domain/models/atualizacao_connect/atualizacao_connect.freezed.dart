// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'atualizacao_connect.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
CargaConnect _$CargaConnectFromJson(
  Map<String, dynamic> json
) {
    return _CargaAtualizacao.fromJson(
      json
    );
}

/// @nodoc
mixin _$CargaConnect {

 String? get id; String get arquivo;
/// Create a copy of CargaConnect
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CargaConnectCopyWith<CargaConnect> get copyWith => _$CargaConnectCopyWithImpl<CargaConnect>(this as CargaConnect, _$identity);

  /// Serializes this CargaConnect to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CargaConnect&&(identical(other.id, id) || other.id == id)&&(identical(other.arquivo, arquivo) || other.arquivo == arquivo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,arquivo);

@override
String toString() {
  return 'CargaConnect(id: $id, arquivo: $arquivo)';
}


}

/// @nodoc
abstract mixin class $CargaConnectCopyWith<$Res>  {
  factory $CargaConnectCopyWith(CargaConnect value, $Res Function(CargaConnect) _then) = _$CargaConnectCopyWithImpl;
@useResult
$Res call({
 String? id, String arquivo
});




}
/// @nodoc
class _$CargaConnectCopyWithImpl<$Res>
    implements $CargaConnectCopyWith<$Res> {
  _$CargaConnectCopyWithImpl(this._self, this._then);

  final CargaConnect _self;
  final $Res Function(CargaConnect) _then;

/// Create a copy of CargaConnect
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? arquivo = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,arquivo: null == arquivo ? _self.arquivo : arquivo // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CargaConnect].
extension CargaConnectPatterns on CargaConnect {
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String arquivo)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CargaAtualizacao() when $default != null:
return $default(_that.id,_that.arquivo);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String arquivo)  $default,) {final _that = this;
switch (_that) {
case _CargaAtualizacao():
return $default(_that.id,_that.arquivo);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String arquivo)?  $default,) {final _that = this;
switch (_that) {
case _CargaAtualizacao() when $default != null:
return $default(_that.id,_that.arquivo);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CargaAtualizacao implements CargaConnect {
  const _CargaAtualizacao({required this.id, required this.arquivo});
  factory _CargaAtualizacao.fromJson(Map<String, dynamic> json) => _$CargaAtualizacaoFromJson(json);

@override final  String? id;
@override final  String arquivo;

/// Create a copy of CargaConnect
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CargaAtualizacao&&(identical(other.id, id) || other.id == id)&&(identical(other.arquivo, arquivo) || other.arquivo == arquivo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,arquivo);

@override
String toString() {
  return 'CargaConnect(id: $id, arquivo: $arquivo)';
}


}

/// @nodoc
abstract mixin class _$CargaAtualizacaoCopyWith<$Res> implements $CargaConnectCopyWith<$Res> {
  factory _$CargaAtualizacaoCopyWith(_CargaAtualizacao value, $Res Function(_CargaAtualizacao) _then) = __$CargaAtualizacaoCopyWithImpl;
@override @useResult
$Res call({
 String? id, String arquivo
});




}
/// @nodoc
class __$CargaAtualizacaoCopyWithImpl<$Res>
    implements _$CargaAtualizacaoCopyWith<$Res> {
  __$CargaAtualizacaoCopyWithImpl(this._self, this._then);

  final _CargaAtualizacao _self;
  final $Res Function(_CargaAtualizacao) _then;

/// Create a copy of CargaConnect
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? arquivo = null,}) {
  return _then(_CargaAtualizacao(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,arquivo: null == arquivo ? _self.arquivo : arquivo // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
