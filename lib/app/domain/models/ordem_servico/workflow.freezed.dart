// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workflow.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WorkFlow {

 int? get id; String? get descricao; List<Etapa> get etapas;
/// Create a copy of WorkFlow
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkFlowCopyWith<WorkFlow> get copyWith => _$WorkFlowCopyWithImpl<WorkFlow>(this as WorkFlow, _$identity);

  /// Serializes this WorkFlow to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkFlow&&(identical(other.id, id) || other.id == id)&&(identical(other.descricao, descricao) || other.descricao == descricao)&&const DeepCollectionEquality().equals(other.etapas, etapas));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,descricao,const DeepCollectionEquality().hash(etapas));

@override
String toString() {
  return 'WorkFlow(id: $id, descricao: $descricao, etapas: $etapas)';
}


}

/// @nodoc
abstract mixin class $WorkFlowCopyWith<$Res>  {
  factory $WorkFlowCopyWith(WorkFlow value, $Res Function(WorkFlow) _then) = _$WorkFlowCopyWithImpl;
@useResult
$Res call({
 int? id, String? descricao, List<Etapa> etapas
});




}
/// @nodoc
class _$WorkFlowCopyWithImpl<$Res>
    implements $WorkFlowCopyWith<$Res> {
  _$WorkFlowCopyWithImpl(this._self, this._then);

  final WorkFlow _self;
  final $Res Function(WorkFlow) _then;

/// Create a copy of WorkFlow
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? descricao = freezed,Object? etapas = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,descricao: freezed == descricao ? _self.descricao : descricao // ignore: cast_nullable_to_non_nullable
as String?,etapas: null == etapas ? _self.etapas : etapas // ignore: cast_nullable_to_non_nullable
as List<Etapa>,
  ));
}

}


/// Adds pattern-matching-related methods to [WorkFlow].
extension WorkFlowPatterns on WorkFlow {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WorkFlow value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WorkFlow() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WorkFlow value)  $default,){
final _that = this;
switch (_that) {
case _WorkFlow():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WorkFlow value)?  $default,){
final _that = this;
switch (_that) {
case _WorkFlow() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? descricao,  List<Etapa> etapas)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WorkFlow() when $default != null:
return $default(_that.id,_that.descricao,_that.etapas);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? descricao,  List<Etapa> etapas)  $default,) {final _that = this;
switch (_that) {
case _WorkFlow():
return $default(_that.id,_that.descricao,_that.etapas);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? descricao,  List<Etapa> etapas)?  $default,) {final _that = this;
switch (_that) {
case _WorkFlow() when $default != null:
return $default(_that.id,_that.descricao,_that.etapas);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WorkFlow implements WorkFlow {
  const _WorkFlow({required this.id, required this.descricao, required final  List<Etapa> etapas}): _etapas = etapas;
  factory _WorkFlow.fromJson(Map<String, dynamic> json) => _$WorkFlowFromJson(json);

@override final  int? id;
@override final  String? descricao;
 final  List<Etapa> _etapas;
@override List<Etapa> get etapas {
  if (_etapas is EqualUnmodifiableListView) return _etapas;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_etapas);
}


/// Create a copy of WorkFlow
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WorkFlowCopyWith<_WorkFlow> get copyWith => __$WorkFlowCopyWithImpl<_WorkFlow>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WorkFlowToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WorkFlow&&(identical(other.id, id) || other.id == id)&&(identical(other.descricao, descricao) || other.descricao == descricao)&&const DeepCollectionEquality().equals(other._etapas, _etapas));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,descricao,const DeepCollectionEquality().hash(_etapas));

@override
String toString() {
  return 'WorkFlow(id: $id, descricao: $descricao, etapas: $etapas)';
}


}

/// @nodoc
abstract mixin class _$WorkFlowCopyWith<$Res> implements $WorkFlowCopyWith<$Res> {
  factory _$WorkFlowCopyWith(_WorkFlow value, $Res Function(_WorkFlow) _then) = __$WorkFlowCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? descricao, List<Etapa> etapas
});




}
/// @nodoc
class __$WorkFlowCopyWithImpl<$Res>
    implements _$WorkFlowCopyWith<$Res> {
  __$WorkFlowCopyWithImpl(this._self, this._then);

  final _WorkFlow _self;
  final $Res Function(_WorkFlow) _then;

/// Create a copy of WorkFlow
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? descricao = freezed,Object? etapas = null,}) {
  return _then(_WorkFlow(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,descricao: freezed == descricao ? _self.descricao : descricao // ignore: cast_nullable_to_non_nullable
as String?,etapas: null == etapas ? _self._etapas : etapas // ignore: cast_nullable_to_non_nullable
as List<Etapa>,
  ));
}


}

// dart format on
