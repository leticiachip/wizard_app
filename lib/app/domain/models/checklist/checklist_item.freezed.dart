// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checklist_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChecklistItem {

 int get id; int get checklistId; String get resumo; int get campoObrigatorio; String get titulo; String get descricao; int get checkBoxHabilitado; String get descricaoCheckBox; int get textFieldHabilitado; String get dicaTextField; int get qtdMininaFotoObr; int get qtdMaximaFoto; int get delete;
/// Create a copy of ChecklistItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChecklistItemCopyWith<ChecklistItem> get copyWith => _$ChecklistItemCopyWithImpl<ChecklistItem>(this as ChecklistItem, _$identity);

  /// Serializes this ChecklistItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChecklistItem&&(identical(other.id, id) || other.id == id)&&(identical(other.checklistId, checklistId) || other.checklistId == checklistId)&&(identical(other.resumo, resumo) || other.resumo == resumo)&&(identical(other.campoObrigatorio, campoObrigatorio) || other.campoObrigatorio == campoObrigatorio)&&(identical(other.titulo, titulo) || other.titulo == titulo)&&(identical(other.descricao, descricao) || other.descricao == descricao)&&(identical(other.checkBoxHabilitado, checkBoxHabilitado) || other.checkBoxHabilitado == checkBoxHabilitado)&&(identical(other.descricaoCheckBox, descricaoCheckBox) || other.descricaoCheckBox == descricaoCheckBox)&&(identical(other.textFieldHabilitado, textFieldHabilitado) || other.textFieldHabilitado == textFieldHabilitado)&&(identical(other.dicaTextField, dicaTextField) || other.dicaTextField == dicaTextField)&&(identical(other.qtdMininaFotoObr, qtdMininaFotoObr) || other.qtdMininaFotoObr == qtdMininaFotoObr)&&(identical(other.qtdMaximaFoto, qtdMaximaFoto) || other.qtdMaximaFoto == qtdMaximaFoto)&&(identical(other.delete, delete) || other.delete == delete));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,checklistId,resumo,campoObrigatorio,titulo,descricao,checkBoxHabilitado,descricaoCheckBox,textFieldHabilitado,dicaTextField,qtdMininaFotoObr,qtdMaximaFoto,delete);

@override
String toString() {
  return 'ChecklistItem(id: $id, checklistId: $checklistId, resumo: $resumo, campoObrigatorio: $campoObrigatorio, titulo: $titulo, descricao: $descricao, checkBoxHabilitado: $checkBoxHabilitado, descricaoCheckBox: $descricaoCheckBox, textFieldHabilitado: $textFieldHabilitado, dicaTextField: $dicaTextField, qtdMininaFotoObr: $qtdMininaFotoObr, qtdMaximaFoto: $qtdMaximaFoto, delete: $delete)';
}


}

/// @nodoc
abstract mixin class $ChecklistItemCopyWith<$Res>  {
  factory $ChecklistItemCopyWith(ChecklistItem value, $Res Function(ChecklistItem) _then) = _$ChecklistItemCopyWithImpl;
@useResult
$Res call({
 int id, int checklistId, String resumo, int campoObrigatorio, String titulo, String descricao, int checkBoxHabilitado, String descricaoCheckBox, int textFieldHabilitado, String dicaTextField, int qtdMininaFotoObr, int qtdMaximaFoto, int delete
});




}
/// @nodoc
class _$ChecklistItemCopyWithImpl<$Res>
    implements $ChecklistItemCopyWith<$Res> {
  _$ChecklistItemCopyWithImpl(this._self, this._then);

  final ChecklistItem _self;
  final $Res Function(ChecklistItem) _then;

/// Create a copy of ChecklistItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? checklistId = null,Object? resumo = null,Object? campoObrigatorio = null,Object? titulo = null,Object? descricao = null,Object? checkBoxHabilitado = null,Object? descricaoCheckBox = null,Object? textFieldHabilitado = null,Object? dicaTextField = null,Object? qtdMininaFotoObr = null,Object? qtdMaximaFoto = null,Object? delete = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,checklistId: null == checklistId ? _self.checklistId : checklistId // ignore: cast_nullable_to_non_nullable
as int,resumo: null == resumo ? _self.resumo : resumo // ignore: cast_nullable_to_non_nullable
as String,campoObrigatorio: null == campoObrigatorio ? _self.campoObrigatorio : campoObrigatorio // ignore: cast_nullable_to_non_nullable
as int,titulo: null == titulo ? _self.titulo : titulo // ignore: cast_nullable_to_non_nullable
as String,descricao: null == descricao ? _self.descricao : descricao // ignore: cast_nullable_to_non_nullable
as String,checkBoxHabilitado: null == checkBoxHabilitado ? _self.checkBoxHabilitado : checkBoxHabilitado // ignore: cast_nullable_to_non_nullable
as int,descricaoCheckBox: null == descricaoCheckBox ? _self.descricaoCheckBox : descricaoCheckBox // ignore: cast_nullable_to_non_nullable
as String,textFieldHabilitado: null == textFieldHabilitado ? _self.textFieldHabilitado : textFieldHabilitado // ignore: cast_nullable_to_non_nullable
as int,dicaTextField: null == dicaTextField ? _self.dicaTextField : dicaTextField // ignore: cast_nullable_to_non_nullable
as String,qtdMininaFotoObr: null == qtdMininaFotoObr ? _self.qtdMininaFotoObr : qtdMininaFotoObr // ignore: cast_nullable_to_non_nullable
as int,qtdMaximaFoto: null == qtdMaximaFoto ? _self.qtdMaximaFoto : qtdMaximaFoto // ignore: cast_nullable_to_non_nullable
as int,delete: null == delete ? _self.delete : delete // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ChecklistItem].
extension ChecklistItemPatterns on ChecklistItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChecklistItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChecklistItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChecklistItem value)  $default,){
final _that = this;
switch (_that) {
case _ChecklistItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChecklistItem value)?  $default,){
final _that = this;
switch (_that) {
case _ChecklistItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int checklistId,  String resumo,  int campoObrigatorio,  String titulo,  String descricao,  int checkBoxHabilitado,  String descricaoCheckBox,  int textFieldHabilitado,  String dicaTextField,  int qtdMininaFotoObr,  int qtdMaximaFoto,  int delete)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChecklistItem() when $default != null:
return $default(_that.id,_that.checklistId,_that.resumo,_that.campoObrigatorio,_that.titulo,_that.descricao,_that.checkBoxHabilitado,_that.descricaoCheckBox,_that.textFieldHabilitado,_that.dicaTextField,_that.qtdMininaFotoObr,_that.qtdMaximaFoto,_that.delete);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int checklistId,  String resumo,  int campoObrigatorio,  String titulo,  String descricao,  int checkBoxHabilitado,  String descricaoCheckBox,  int textFieldHabilitado,  String dicaTextField,  int qtdMininaFotoObr,  int qtdMaximaFoto,  int delete)  $default,) {final _that = this;
switch (_that) {
case _ChecklistItem():
return $default(_that.id,_that.checklistId,_that.resumo,_that.campoObrigatorio,_that.titulo,_that.descricao,_that.checkBoxHabilitado,_that.descricaoCheckBox,_that.textFieldHabilitado,_that.dicaTextField,_that.qtdMininaFotoObr,_that.qtdMaximaFoto,_that.delete);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int checklistId,  String resumo,  int campoObrigatorio,  String titulo,  String descricao,  int checkBoxHabilitado,  String descricaoCheckBox,  int textFieldHabilitado,  String dicaTextField,  int qtdMininaFotoObr,  int qtdMaximaFoto,  int delete)?  $default,) {final _that = this;
switch (_that) {
case _ChecklistItem() when $default != null:
return $default(_that.id,_that.checklistId,_that.resumo,_that.campoObrigatorio,_that.titulo,_that.descricao,_that.checkBoxHabilitado,_that.descricaoCheckBox,_that.textFieldHabilitado,_that.dicaTextField,_that.qtdMininaFotoObr,_that.qtdMaximaFoto,_that.delete);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChecklistItem implements ChecklistItem {
  const _ChecklistItem({required this.id, required this.checklistId, required this.resumo, required this.campoObrigatorio, required this.titulo, required this.descricao, required this.checkBoxHabilitado, required this.descricaoCheckBox, required this.textFieldHabilitado, required this.dicaTextField, required this.qtdMininaFotoObr, required this.qtdMaximaFoto, required this.delete});
  factory _ChecklistItem.fromJson(Map<String, dynamic> json) => _$ChecklistItemFromJson(json);

@override final  int id;
@override final  int checklistId;
@override final  String resumo;
@override final  int campoObrigatorio;
@override final  String titulo;
@override final  String descricao;
@override final  int checkBoxHabilitado;
@override final  String descricaoCheckBox;
@override final  int textFieldHabilitado;
@override final  String dicaTextField;
@override final  int qtdMininaFotoObr;
@override final  int qtdMaximaFoto;
@override final  int delete;

/// Create a copy of ChecklistItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChecklistItemCopyWith<_ChecklistItem> get copyWith => __$ChecklistItemCopyWithImpl<_ChecklistItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChecklistItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChecklistItem&&(identical(other.id, id) || other.id == id)&&(identical(other.checklistId, checklistId) || other.checklistId == checklistId)&&(identical(other.resumo, resumo) || other.resumo == resumo)&&(identical(other.campoObrigatorio, campoObrigatorio) || other.campoObrigatorio == campoObrigatorio)&&(identical(other.titulo, titulo) || other.titulo == titulo)&&(identical(other.descricao, descricao) || other.descricao == descricao)&&(identical(other.checkBoxHabilitado, checkBoxHabilitado) || other.checkBoxHabilitado == checkBoxHabilitado)&&(identical(other.descricaoCheckBox, descricaoCheckBox) || other.descricaoCheckBox == descricaoCheckBox)&&(identical(other.textFieldHabilitado, textFieldHabilitado) || other.textFieldHabilitado == textFieldHabilitado)&&(identical(other.dicaTextField, dicaTextField) || other.dicaTextField == dicaTextField)&&(identical(other.qtdMininaFotoObr, qtdMininaFotoObr) || other.qtdMininaFotoObr == qtdMininaFotoObr)&&(identical(other.qtdMaximaFoto, qtdMaximaFoto) || other.qtdMaximaFoto == qtdMaximaFoto)&&(identical(other.delete, delete) || other.delete == delete));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,checklistId,resumo,campoObrigatorio,titulo,descricao,checkBoxHabilitado,descricaoCheckBox,textFieldHabilitado,dicaTextField,qtdMininaFotoObr,qtdMaximaFoto,delete);

@override
String toString() {
  return 'ChecklistItem(id: $id, checklistId: $checklistId, resumo: $resumo, campoObrigatorio: $campoObrigatorio, titulo: $titulo, descricao: $descricao, checkBoxHabilitado: $checkBoxHabilitado, descricaoCheckBox: $descricaoCheckBox, textFieldHabilitado: $textFieldHabilitado, dicaTextField: $dicaTextField, qtdMininaFotoObr: $qtdMininaFotoObr, qtdMaximaFoto: $qtdMaximaFoto, delete: $delete)';
}


}

/// @nodoc
abstract mixin class _$ChecklistItemCopyWith<$Res> implements $ChecklistItemCopyWith<$Res> {
  factory _$ChecklistItemCopyWith(_ChecklistItem value, $Res Function(_ChecklistItem) _then) = __$ChecklistItemCopyWithImpl;
@override @useResult
$Res call({
 int id, int checklistId, String resumo, int campoObrigatorio, String titulo, String descricao, int checkBoxHabilitado, String descricaoCheckBox, int textFieldHabilitado, String dicaTextField, int qtdMininaFotoObr, int qtdMaximaFoto, int delete
});




}
/// @nodoc
class __$ChecklistItemCopyWithImpl<$Res>
    implements _$ChecklistItemCopyWith<$Res> {
  __$ChecklistItemCopyWithImpl(this._self, this._then);

  final _ChecklistItem _self;
  final $Res Function(_ChecklistItem) _then;

/// Create a copy of ChecklistItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? checklistId = null,Object? resumo = null,Object? campoObrigatorio = null,Object? titulo = null,Object? descricao = null,Object? checkBoxHabilitado = null,Object? descricaoCheckBox = null,Object? textFieldHabilitado = null,Object? dicaTextField = null,Object? qtdMininaFotoObr = null,Object? qtdMaximaFoto = null,Object? delete = null,}) {
  return _then(_ChecklistItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,checklistId: null == checklistId ? _self.checklistId : checklistId // ignore: cast_nullable_to_non_nullable
as int,resumo: null == resumo ? _self.resumo : resumo // ignore: cast_nullable_to_non_nullable
as String,campoObrigatorio: null == campoObrigatorio ? _self.campoObrigatorio : campoObrigatorio // ignore: cast_nullable_to_non_nullable
as int,titulo: null == titulo ? _self.titulo : titulo // ignore: cast_nullable_to_non_nullable
as String,descricao: null == descricao ? _self.descricao : descricao // ignore: cast_nullable_to_non_nullable
as String,checkBoxHabilitado: null == checkBoxHabilitado ? _self.checkBoxHabilitado : checkBoxHabilitado // ignore: cast_nullable_to_non_nullable
as int,descricaoCheckBox: null == descricaoCheckBox ? _self.descricaoCheckBox : descricaoCheckBox // ignore: cast_nullable_to_non_nullable
as String,textFieldHabilitado: null == textFieldHabilitado ? _self.textFieldHabilitado : textFieldHabilitado // ignore: cast_nullable_to_non_nullable
as int,dicaTextField: null == dicaTextField ? _self.dicaTextField : dicaTextField // ignore: cast_nullable_to_non_nullable
as String,qtdMininaFotoObr: null == qtdMininaFotoObr ? _self.qtdMininaFotoObr : qtdMininaFotoObr // ignore: cast_nullable_to_non_nullable
as int,qtdMaximaFoto: null == qtdMaximaFoto ? _self.qtdMaximaFoto : qtdMaximaFoto // ignore: cast_nullable_to_non_nullable
as int,delete: null == delete ? _self.delete : delete // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
