// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_sort.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ItemSortModel {
  String? get label => throw _privateConstructorUsedError;
  String? get value => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ItemSortModelCopyWith<ItemSortModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemSortModelCopyWith<$Res> {
  factory $ItemSortModelCopyWith(
          ItemSortModel value, $Res Function(ItemSortModel) then) =
      _$ItemSortModelCopyWithImpl<$Res, ItemSortModel>;
  @useResult
  $Res call({String? label, String? value});
}

/// @nodoc
class _$ItemSortModelCopyWithImpl<$Res, $Val extends ItemSortModel>
    implements $ItemSortModelCopyWith<$Res> {
  _$ItemSortModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = freezed,
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ItemSortModelCopyWith<$Res>
    implements $ItemSortModelCopyWith<$Res> {
  factory _$$_ItemSortModelCopyWith(
          _$_ItemSortModel value, $Res Function(_$_ItemSortModel) then) =
      __$$_ItemSortModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? label, String? value});
}

/// @nodoc
class __$$_ItemSortModelCopyWithImpl<$Res>
    extends _$ItemSortModelCopyWithImpl<$Res, _$_ItemSortModel>
    implements _$$_ItemSortModelCopyWith<$Res> {
  __$$_ItemSortModelCopyWithImpl(
      _$_ItemSortModel _value, $Res Function(_$_ItemSortModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = freezed,
    Object? value = freezed,
  }) {
    return _then(_$_ItemSortModel(
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_ItemSortModel implements _ItemSortModel {
  _$_ItemSortModel({this.label, this.value});

  @override
  final String? label;
  @override
  final String? value;

  @override
  String toString() {
    return 'ItemSortModel(label: $label, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ItemSortModel &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, label, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ItemSortModelCopyWith<_$_ItemSortModel> get copyWith =>
      __$$_ItemSortModelCopyWithImpl<_$_ItemSortModel>(this, _$identity);
}

abstract class _ItemSortModel implements ItemSortModel {
  factory _ItemSortModel({final String? label, final String? value}) =
      _$_ItemSortModel;

  @override
  String? get label;
  @override
  String? get value;
  @override
  @JsonKey(ignore: true)
  _$$_ItemSortModelCopyWith<_$_ItemSortModel> get copyWith =>
      throw _privateConstructorUsedError;
}
