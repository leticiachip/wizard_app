// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'veiculo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Veiculo {

 int? get id; String? get montadora; String get modelo; int get ano; String get placa;
/// Create a copy of Veiculo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VeiculoCopyWith<Veiculo> get copyWith => _$VeiculoCopyWithImpl<Veiculo>(this as Veiculo, _$identity);

  /// Serializes this Veiculo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Veiculo&&(identical(other.id, id) || other.id == id)&&(identical(other.montadora, montadora) || other.montadora == montadora)&&(identical(other.modelo, modelo) || other.modelo == modelo)&&(identical(other.ano, ano) || other.ano == ano)&&(identical(other.placa, placa) || other.placa == placa));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,montadora,modelo,ano,placa);

@override
String toString() {
  return 'Veiculo(id: $id, montadora: $montadora, modelo: $modelo, ano: $ano, placa: $placa)';
}


}

/// @nodoc
abstract mixin class $VeiculoCopyWith<$Res>  {
  factory $VeiculoCopyWith(Veiculo value, $Res Function(Veiculo) _then) = _$VeiculoCopyWithImpl;
@useResult
$Res call({
 int? id, String? montadora, String modelo, int ano, String placa
});




}
/// @nodoc
class _$VeiculoCopyWithImpl<$Res>
    implements $VeiculoCopyWith<$Res> {
  _$VeiculoCopyWithImpl(this._self, this._then);

  final Veiculo _self;
  final $Res Function(Veiculo) _then;

/// Create a copy of Veiculo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? montadora = freezed,Object? modelo = null,Object? ano = null,Object? placa = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,montadora: freezed == montadora ? _self.montadora : montadora // ignore: cast_nullable_to_non_nullable
as String?,modelo: null == modelo ? _self.modelo : modelo // ignore: cast_nullable_to_non_nullable
as String,ano: null == ano ? _self.ano : ano // ignore: cast_nullable_to_non_nullable
as int,placa: null == placa ? _self.placa : placa // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Veiculo].
extension VeiculoPatterns on Veiculo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Veiculo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Veiculo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Veiculo value)  $default,){
final _that = this;
switch (_that) {
case _Veiculo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Veiculo value)?  $default,){
final _that = this;
switch (_that) {
case _Veiculo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? montadora,  String modelo,  int ano,  String placa)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Veiculo() when $default != null:
return $default(_that.id,_that.montadora,_that.modelo,_that.ano,_that.placa);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? montadora,  String modelo,  int ano,  String placa)  $default,) {final _that = this;
switch (_that) {
case _Veiculo():
return $default(_that.id,_that.montadora,_that.modelo,_that.ano,_that.placa);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? montadora,  String modelo,  int ano,  String placa)?  $default,) {final _that = this;
switch (_that) {
case _Veiculo() when $default != null:
return $default(_that.id,_that.montadora,_that.modelo,_that.ano,_that.placa);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Veiculo implements Veiculo {
  const _Veiculo({required this.id, required this.montadora, required this.modelo, required this.ano, required this.placa});
  factory _Veiculo.fromJson(Map<String, dynamic> json) => _$VeiculoFromJson(json);

@override final  int? id;
@override final  String? montadora;
@override final  String modelo;
@override final  int ano;
@override final  String placa;

/// Create a copy of Veiculo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VeiculoCopyWith<_Veiculo> get copyWith => __$VeiculoCopyWithImpl<_Veiculo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VeiculoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Veiculo&&(identical(other.id, id) || other.id == id)&&(identical(other.montadora, montadora) || other.montadora == montadora)&&(identical(other.modelo, modelo) || other.modelo == modelo)&&(identical(other.ano, ano) || other.ano == ano)&&(identical(other.placa, placa) || other.placa == placa));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,montadora,modelo,ano,placa);

@override
String toString() {
  return 'Veiculo(id: $id, montadora: $montadora, modelo: $modelo, ano: $ano, placa: $placa)';
}


}

/// @nodoc
abstract mixin class _$VeiculoCopyWith<$Res> implements $VeiculoCopyWith<$Res> {
  factory _$VeiculoCopyWith(_Veiculo value, $Res Function(_Veiculo) _then) = __$VeiculoCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? montadora, String modelo, int ano, String placa
});




}
/// @nodoc
class __$VeiculoCopyWithImpl<$Res>
    implements _$VeiculoCopyWith<$Res> {
  __$VeiculoCopyWithImpl(this._self, this._then);

  final _Veiculo _self;
  final $Res Function(_Veiculo) _then;

/// Create a copy of Veiculo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? montadora = freezed,Object? modelo = null,Object? ano = null,Object? placa = null,}) {
  return _then(_Veiculo(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,montadora: freezed == montadora ? _self.montadora : montadora // ignore: cast_nullable_to_non_nullable
as String?,modelo: null == modelo ? _self.modelo : modelo // ignore: cast_nullable_to_non_nullable
as String,ano: null == ano ? _self.ano : ano // ignore: cast_nullable_to_non_nullable
as int,placa: null == placa ? _self.placa : placa // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
