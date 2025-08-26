// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'etapas_ordem_servico.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
EtapasOrdemServico _$EtapasOrdemServicoFromJson(
  Map<String, dynamic> json
) {
    return _Devices.fromJson(
      json
    );
}

/// @nodoc
mixin _$EtapasOrdemServico {

 int? get id; int get tipo; String get descricao;
/// Create a copy of EtapasOrdemServico
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EtapasOrdemServicoCopyWith<EtapasOrdemServico> get copyWith => _$EtapasOrdemServicoCopyWithImpl<EtapasOrdemServico>(this as EtapasOrdemServico, _$identity);

  /// Serializes this EtapasOrdemServico to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EtapasOrdemServico&&(identical(other.id, id) || other.id == id)&&(identical(other.tipo, tipo) || other.tipo == tipo)&&(identical(other.descricao, descricao) || other.descricao == descricao));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,tipo,descricao);

@override
String toString() {
  return 'EtapasOrdemServico(id: $id, tipo: $tipo, descricao: $descricao)';
}


}

/// @nodoc
abstract mixin class $EtapasOrdemServicoCopyWith<$Res>  {
  factory $EtapasOrdemServicoCopyWith(EtapasOrdemServico value, $Res Function(EtapasOrdemServico) _then) = _$EtapasOrdemServicoCopyWithImpl;
@useResult
$Res call({
 int? id, int tipo, String descricao
});




}
/// @nodoc
class _$EtapasOrdemServicoCopyWithImpl<$Res>
    implements $EtapasOrdemServicoCopyWith<$Res> {
  _$EtapasOrdemServicoCopyWithImpl(this._self, this._then);

  final EtapasOrdemServico _self;
  final $Res Function(EtapasOrdemServico) _then;

/// Create a copy of EtapasOrdemServico
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? tipo = null,Object? descricao = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,tipo: null == tipo ? _self.tipo : tipo // ignore: cast_nullable_to_non_nullable
as int,descricao: null == descricao ? _self.descricao : descricao // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [EtapasOrdemServico].
extension EtapasOrdemServicoPatterns on EtapasOrdemServico {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Devices value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Devices() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Devices value)  $default,){
final _that = this;
switch (_that) {
case _Devices():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Devices value)?  $default,){
final _that = this;
switch (_that) {
case _Devices() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  int tipo,  String descricao)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Devices() when $default != null:
return $default(_that.id,_that.tipo,_that.descricao);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  int tipo,  String descricao)  $default,) {final _that = this;
switch (_that) {
case _Devices():
return $default(_that.id,_that.tipo,_that.descricao);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  int tipo,  String descricao)?  $default,) {final _that = this;
switch (_that) {
case _Devices() when $default != null:
return $default(_that.id,_that.tipo,_that.descricao);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Devices implements EtapasOrdemServico {
  const _Devices({required this.id, required this.tipo, required this.descricao});
  factory _Devices.fromJson(Map<String, dynamic> json) => _$DevicesFromJson(json);

@override final  int? id;
@override final  int tipo;
@override final  String descricao;

/// Create a copy of EtapasOrdemServico
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DevicesCopyWith<_Devices> get copyWith => __$DevicesCopyWithImpl<_Devices>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DevicesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Devices&&(identical(other.id, id) || other.id == id)&&(identical(other.tipo, tipo) || other.tipo == tipo)&&(identical(other.descricao, descricao) || other.descricao == descricao));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,tipo,descricao);

@override
String toString() {
  return 'EtapasOrdemServico(id: $id, tipo: $tipo, descricao: $descricao)';
}


}

/// @nodoc
abstract mixin class _$DevicesCopyWith<$Res> implements $EtapasOrdemServicoCopyWith<$Res> {
  factory _$DevicesCopyWith(_Devices value, $Res Function(_Devices) _then) = __$DevicesCopyWithImpl;
@override @useResult
$Res call({
 int? id, int tipo, String descricao
});




}
/// @nodoc
class __$DevicesCopyWithImpl<$Res>
    implements _$DevicesCopyWith<$Res> {
  __$DevicesCopyWithImpl(this._self, this._then);

  final _Devices _self;
  final $Res Function(_Devices) _then;

/// Create a copy of EtapasOrdemServico
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? tipo = null,Object? descricao = null,}) {
  return _then(_Devices(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,tipo: null == tipo ? _self.tipo : tipo // ignore: cast_nullable_to_non_nullable
as int,descricao: null == descricao ? _self.descricao : descricao // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
