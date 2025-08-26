// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checklist.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CheckList {

 int get id; int get tipo; String get descricao; int get idFuncionario; List<ChecklistItem> get checkListItem;
/// Create a copy of CheckList
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckListCopyWith<CheckList> get copyWith => _$CheckListCopyWithImpl<CheckList>(this as CheckList, _$identity);

  /// Serializes this CheckList to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckList&&(identical(other.id, id) || other.id == id)&&(identical(other.tipo, tipo) || other.tipo == tipo)&&(identical(other.descricao, descricao) || other.descricao == descricao)&&(identical(other.idFuncionario, idFuncionario) || other.idFuncionario == idFuncionario)&&const DeepCollectionEquality().equals(other.checkListItem, checkListItem));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,tipo,descricao,idFuncionario,const DeepCollectionEquality().hash(checkListItem));

@override
String toString() {
  return 'CheckList(id: $id, tipo: $tipo, descricao: $descricao, idFuncionario: $idFuncionario, checkListItem: $checkListItem)';
}


}

/// @nodoc
abstract mixin class $CheckListCopyWith<$Res>  {
  factory $CheckListCopyWith(CheckList value, $Res Function(CheckList) _then) = _$CheckListCopyWithImpl;
@useResult
$Res call({
 int id, int tipo, String descricao, int idFuncionario, List<ChecklistItem> checkListItem
});




}
/// @nodoc
class _$CheckListCopyWithImpl<$Res>
    implements $CheckListCopyWith<$Res> {
  _$CheckListCopyWithImpl(this._self, this._then);

  final CheckList _self;
  final $Res Function(CheckList) _then;

/// Create a copy of CheckList
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? tipo = null,Object? descricao = null,Object? idFuncionario = null,Object? checkListItem = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,tipo: null == tipo ? _self.tipo : tipo // ignore: cast_nullable_to_non_nullable
as int,descricao: null == descricao ? _self.descricao : descricao // ignore: cast_nullable_to_non_nullable
as String,idFuncionario: null == idFuncionario ? _self.idFuncionario : idFuncionario // ignore: cast_nullable_to_non_nullable
as int,checkListItem: null == checkListItem ? _self.checkListItem : checkListItem // ignore: cast_nullable_to_non_nullable
as List<ChecklistItem>,
  ));
}

}


/// Adds pattern-matching-related methods to [CheckList].
extension CheckListPatterns on CheckList {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CheckList value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CheckList() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CheckList value)  $default,){
final _that = this;
switch (_that) {
case _CheckList():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CheckList value)?  $default,){
final _that = this;
switch (_that) {
case _CheckList() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int tipo,  String descricao,  int idFuncionario,  List<ChecklistItem> checkListItem)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CheckList() when $default != null:
return $default(_that.id,_that.tipo,_that.descricao,_that.idFuncionario,_that.checkListItem);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int tipo,  String descricao,  int idFuncionario,  List<ChecklistItem> checkListItem)  $default,) {final _that = this;
switch (_that) {
case _CheckList():
return $default(_that.id,_that.tipo,_that.descricao,_that.idFuncionario,_that.checkListItem);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int tipo,  String descricao,  int idFuncionario,  List<ChecklistItem> checkListItem)?  $default,) {final _that = this;
switch (_that) {
case _CheckList() when $default != null:
return $default(_that.id,_that.tipo,_that.descricao,_that.idFuncionario,_that.checkListItem);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CheckList implements CheckList {
  const _CheckList({required this.id, required this.tipo, required this.descricao, required this.idFuncionario, required final  List<ChecklistItem> checkListItem}): _checkListItem = checkListItem;
  factory _CheckList.fromJson(Map<String, dynamic> json) => _$CheckListFromJson(json);

@override final  int id;
@override final  int tipo;
@override final  String descricao;
@override final  int idFuncionario;
 final  List<ChecklistItem> _checkListItem;
@override List<ChecklistItem> get checkListItem {
  if (_checkListItem is EqualUnmodifiableListView) return _checkListItem;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_checkListItem);
}


/// Create a copy of CheckList
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheckListCopyWith<_CheckList> get copyWith => __$CheckListCopyWithImpl<_CheckList>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CheckListToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckList&&(identical(other.id, id) || other.id == id)&&(identical(other.tipo, tipo) || other.tipo == tipo)&&(identical(other.descricao, descricao) || other.descricao == descricao)&&(identical(other.idFuncionario, idFuncionario) || other.idFuncionario == idFuncionario)&&const DeepCollectionEquality().equals(other._checkListItem, _checkListItem));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,tipo,descricao,idFuncionario,const DeepCollectionEquality().hash(_checkListItem));

@override
String toString() {
  return 'CheckList(id: $id, tipo: $tipo, descricao: $descricao, idFuncionario: $idFuncionario, checkListItem: $checkListItem)';
}


}

/// @nodoc
abstract mixin class _$CheckListCopyWith<$Res> implements $CheckListCopyWith<$Res> {
  factory _$CheckListCopyWith(_CheckList value, $Res Function(_CheckList) _then) = __$CheckListCopyWithImpl;
@override @useResult
$Res call({
 int id, int tipo, String descricao, int idFuncionario, List<ChecklistItem> checkListItem
});




}
/// @nodoc
class __$CheckListCopyWithImpl<$Res>
    implements _$CheckListCopyWith<$Res> {
  __$CheckListCopyWithImpl(this._self, this._then);

  final _CheckList _self;
  final $Res Function(_CheckList) _then;

/// Create a copy of CheckList
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? tipo = null,Object? descricao = null,Object? idFuncionario = null,Object? checkListItem = null,}) {
  return _then(_CheckList(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,tipo: null == tipo ? _self.tipo : tipo // ignore: cast_nullable_to_non_nullable
as int,descricao: null == descricao ? _self.descricao : descricao // ignore: cast_nullable_to_non_nullable
as String,idFuncionario: null == idFuncionario ? _self.idFuncionario : idFuncionario // ignore: cast_nullable_to_non_nullable
as int,checkListItem: null == checkListItem ? _self._checkListItem : checkListItem // ignore: cast_nullable_to_non_nullable
as List<ChecklistItem>,
  ));
}


}

// dart format on
