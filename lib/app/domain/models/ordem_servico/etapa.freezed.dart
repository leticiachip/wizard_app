// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'etapa.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Etapa {

 int? get id; String? get titulo; int get ordem; List<Acoes> get acoes;
/// Create a copy of Etapa
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EtapaCopyWith<Etapa> get copyWith => _$EtapaCopyWithImpl<Etapa>(this as Etapa, _$identity);

  /// Serializes this Etapa to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Etapa&&(identical(other.id, id) || other.id == id)&&(identical(other.titulo, titulo) || other.titulo == titulo)&&(identical(other.ordem, ordem) || other.ordem == ordem)&&const DeepCollectionEquality().equals(other.acoes, acoes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,titulo,ordem,const DeepCollectionEquality().hash(acoes));

@override
String toString() {
  return 'Etapa(id: $id, titulo: $titulo, ordem: $ordem, acoes: $acoes)';
}


}

/// @nodoc
abstract mixin class $EtapaCopyWith<$Res>  {
  factory $EtapaCopyWith(Etapa value, $Res Function(Etapa) _then) = _$EtapaCopyWithImpl;
@useResult
$Res call({
 int? id, String? titulo, int ordem, List<Acoes> acoes
});




}
/// @nodoc
class _$EtapaCopyWithImpl<$Res>
    implements $EtapaCopyWith<$Res> {
  _$EtapaCopyWithImpl(this._self, this._then);

  final Etapa _self;
  final $Res Function(Etapa) _then;

/// Create a copy of Etapa
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? titulo = freezed,Object? ordem = null,Object? acoes = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,titulo: freezed == titulo ? _self.titulo : titulo // ignore: cast_nullable_to_non_nullable
as String?,ordem: null == ordem ? _self.ordem : ordem // ignore: cast_nullable_to_non_nullable
as int,acoes: null == acoes ? _self.acoes : acoes // ignore: cast_nullable_to_non_nullable
as List<Acoes>,
  ));
}

}


/// Adds pattern-matching-related methods to [Etapa].
extension EtapaPatterns on Etapa {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Etapa value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Etapa() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Etapa value)  $default,){
final _that = this;
switch (_that) {
case _Etapa():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Etapa value)?  $default,){
final _that = this;
switch (_that) {
case _Etapa() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? titulo,  int ordem,  List<Acoes> acoes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Etapa() when $default != null:
return $default(_that.id,_that.titulo,_that.ordem,_that.acoes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? titulo,  int ordem,  List<Acoes> acoes)  $default,) {final _that = this;
switch (_that) {
case _Etapa():
return $default(_that.id,_that.titulo,_that.ordem,_that.acoes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? titulo,  int ordem,  List<Acoes> acoes)?  $default,) {final _that = this;
switch (_that) {
case _Etapa() when $default != null:
return $default(_that.id,_that.titulo,_that.ordem,_that.acoes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Etapa implements Etapa {
  const _Etapa({required this.id, required this.titulo, required this.ordem, required final  List<Acoes> acoes}): _acoes = acoes;
  factory _Etapa.fromJson(Map<String, dynamic> json) => _$EtapaFromJson(json);

@override final  int? id;
@override final  String? titulo;
@override final  int ordem;
 final  List<Acoes> _acoes;
@override List<Acoes> get acoes {
  if (_acoes is EqualUnmodifiableListView) return _acoes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_acoes);
}


/// Create a copy of Etapa
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EtapaCopyWith<_Etapa> get copyWith => __$EtapaCopyWithImpl<_Etapa>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EtapaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Etapa&&(identical(other.id, id) || other.id == id)&&(identical(other.titulo, titulo) || other.titulo == titulo)&&(identical(other.ordem, ordem) || other.ordem == ordem)&&const DeepCollectionEquality().equals(other._acoes, _acoes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,titulo,ordem,const DeepCollectionEquality().hash(_acoes));

@override
String toString() {
  return 'Etapa(id: $id, titulo: $titulo, ordem: $ordem, acoes: $acoes)';
}


}

/// @nodoc
abstract mixin class _$EtapaCopyWith<$Res> implements $EtapaCopyWith<$Res> {
  factory _$EtapaCopyWith(_Etapa value, $Res Function(_Etapa) _then) = __$EtapaCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? titulo, int ordem, List<Acoes> acoes
});




}
/// @nodoc
class __$EtapaCopyWithImpl<$Res>
    implements _$EtapaCopyWith<$Res> {
  __$EtapaCopyWithImpl(this._self, this._then);

  final _Etapa _self;
  final $Res Function(_Etapa) _then;

/// Create a copy of Etapa
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? titulo = freezed,Object? ordem = null,Object? acoes = null,}) {
  return _then(_Etapa(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,titulo: freezed == titulo ? _self.titulo : titulo // ignore: cast_nullable_to_non_nullable
as String?,ordem: null == ordem ? _self.ordem : ordem // ignore: cast_nullable_to_non_nullable
as int,acoes: null == acoes ? _self._acoes : acoes // ignore: cast_nullable_to_non_nullable
as List<Acoes>,
  ));
}


}

// dart format on
