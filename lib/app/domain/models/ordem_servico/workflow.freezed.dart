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
mixin _$Workflow {

@JsonKey(name: 'workflowStepActionId') int? get id;@JsonKey(name: 'workflowStepActionName') String get nome;@JsonKey(name: 'workflowStepActionOrdination') int get ordem;@JsonKey(name: 'workflowStepStartTimeStamp') String get dataInicio;@JsonKey(name: 'workflowStepEndTimeStamp') String get dataFim;
/// Create a copy of Workflow
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkflowCopyWith<Workflow> get copyWith => _$WorkflowCopyWithImpl<Workflow>(this as Workflow, _$identity);

  /// Serializes this Workflow to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Workflow&&(identical(other.id, id) || other.id == id)&&(identical(other.nome, nome) || other.nome == nome)&&(identical(other.ordem, ordem) || other.ordem == ordem)&&(identical(other.dataInicio, dataInicio) || other.dataInicio == dataInicio)&&(identical(other.dataFim, dataFim) || other.dataFim == dataFim));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nome,ordem,dataInicio,dataFim);

@override
String toString() {
  return 'Workflow(id: $id, nome: $nome, ordem: $ordem, dataInicio: $dataInicio, dataFim: $dataFim)';
}


}

/// @nodoc
abstract mixin class $WorkflowCopyWith<$Res>  {
  factory $WorkflowCopyWith(Workflow value, $Res Function(Workflow) _then) = _$WorkflowCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'workflowStepActionId') int? id,@JsonKey(name: 'workflowStepActionName') String nome,@JsonKey(name: 'workflowStepActionOrdination') int ordem,@JsonKey(name: 'workflowStepStartTimeStamp') String dataInicio,@JsonKey(name: 'workflowStepEndTimeStamp') String dataFim
});




}
/// @nodoc
class _$WorkflowCopyWithImpl<$Res>
    implements $WorkflowCopyWith<$Res> {
  _$WorkflowCopyWithImpl(this._self, this._then);

  final Workflow _self;
  final $Res Function(Workflow) _then;

/// Create a copy of Workflow
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? nome = null,Object? ordem = null,Object? dataInicio = null,Object? dataFim = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,nome: null == nome ? _self.nome : nome // ignore: cast_nullable_to_non_nullable
as String,ordem: null == ordem ? _self.ordem : ordem // ignore: cast_nullable_to_non_nullable
as int,dataInicio: null == dataInicio ? _self.dataInicio : dataInicio // ignore: cast_nullable_to_non_nullable
as String,dataFim: null == dataFim ? _self.dataFim : dataFim // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Workflow].
extension WorkflowPatterns on Workflow {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Workflow value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Workflow() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Workflow value)  $default,){
final _that = this;
switch (_that) {
case _Workflow():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Workflow value)?  $default,){
final _that = this;
switch (_that) {
case _Workflow() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'workflowStepActionId')  int? id, @JsonKey(name: 'workflowStepActionName')  String nome, @JsonKey(name: 'workflowStepActionOrdination')  int ordem, @JsonKey(name: 'workflowStepStartTimeStamp')  String dataInicio, @JsonKey(name: 'workflowStepEndTimeStamp')  String dataFim)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Workflow() when $default != null:
return $default(_that.id,_that.nome,_that.ordem,_that.dataInicio,_that.dataFim);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'workflowStepActionId')  int? id, @JsonKey(name: 'workflowStepActionName')  String nome, @JsonKey(name: 'workflowStepActionOrdination')  int ordem, @JsonKey(name: 'workflowStepStartTimeStamp')  String dataInicio, @JsonKey(name: 'workflowStepEndTimeStamp')  String dataFim)  $default,) {final _that = this;
switch (_that) {
case _Workflow():
return $default(_that.id,_that.nome,_that.ordem,_that.dataInicio,_that.dataFim);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'workflowStepActionId')  int? id, @JsonKey(name: 'workflowStepActionName')  String nome, @JsonKey(name: 'workflowStepActionOrdination')  int ordem, @JsonKey(name: 'workflowStepStartTimeStamp')  String dataInicio, @JsonKey(name: 'workflowStepEndTimeStamp')  String dataFim)?  $default,) {final _that = this;
switch (_that) {
case _Workflow() when $default != null:
return $default(_that.id,_that.nome,_that.ordem,_that.dataInicio,_that.dataFim);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Workflow implements Workflow {
  const _Workflow({@JsonKey(name: 'workflowStepActionId') required this.id, @JsonKey(name: 'workflowStepActionName') required this.nome, @JsonKey(name: 'workflowStepActionOrdination') required this.ordem, @JsonKey(name: 'workflowStepStartTimeStamp') required this.dataInicio, @JsonKey(name: 'workflowStepEndTimeStamp') required this.dataFim});
  factory _Workflow.fromJson(Map<String, dynamic> json) => _$WorkflowFromJson(json);

@override@JsonKey(name: 'workflowStepActionId') final  int? id;
@override@JsonKey(name: 'workflowStepActionName') final  String nome;
@override@JsonKey(name: 'workflowStepActionOrdination') final  int ordem;
@override@JsonKey(name: 'workflowStepStartTimeStamp') final  String dataInicio;
@override@JsonKey(name: 'workflowStepEndTimeStamp') final  String dataFim;

/// Create a copy of Workflow
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WorkflowCopyWith<_Workflow> get copyWith => __$WorkflowCopyWithImpl<_Workflow>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WorkflowToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Workflow&&(identical(other.id, id) || other.id == id)&&(identical(other.nome, nome) || other.nome == nome)&&(identical(other.ordem, ordem) || other.ordem == ordem)&&(identical(other.dataInicio, dataInicio) || other.dataInicio == dataInicio)&&(identical(other.dataFim, dataFim) || other.dataFim == dataFim));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nome,ordem,dataInicio,dataFim);

@override
String toString() {
  return 'Workflow(id: $id, nome: $nome, ordem: $ordem, dataInicio: $dataInicio, dataFim: $dataFim)';
}


}

/// @nodoc
abstract mixin class _$WorkflowCopyWith<$Res> implements $WorkflowCopyWith<$Res> {
  factory _$WorkflowCopyWith(_Workflow value, $Res Function(_Workflow) _then) = __$WorkflowCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'workflowStepActionId') int? id,@JsonKey(name: 'workflowStepActionName') String nome,@JsonKey(name: 'workflowStepActionOrdination') int ordem,@JsonKey(name: 'workflowStepStartTimeStamp') String dataInicio,@JsonKey(name: 'workflowStepEndTimeStamp') String dataFim
});




}
/// @nodoc
class __$WorkflowCopyWithImpl<$Res>
    implements _$WorkflowCopyWith<$Res> {
  __$WorkflowCopyWithImpl(this._self, this._then);

  final _Workflow _self;
  final $Res Function(_Workflow) _then;

/// Create a copy of Workflow
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? nome = null,Object? ordem = null,Object? dataInicio = null,Object? dataFim = null,}) {
  return _then(_Workflow(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,nome: null == nome ? _self.nome : nome // ignore: cast_nullable_to_non_nullable
as String,ordem: null == ordem ? _self.ordem : ordem // ignore: cast_nullable_to_non_nullable
as int,dataInicio: null == dataInicio ? _self.dataInicio : dataInicio // ignore: cast_nullable_to_non_nullable
as String,dataFim: null == dataFim ? _self.dataFim : dataFim // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
