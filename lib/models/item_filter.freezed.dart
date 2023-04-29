// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ItemFilterModel {
  PaginationModel get paginationModel => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;
  String? get commonname => throw _privateConstructorUsedError;
  String? get sortBy => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  String? get activestatus => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ItemFilterModelCopyWith<ItemFilterModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemFilterModelCopyWith<$Res> {
  factory $ItemFilterModelCopyWith(
          ItemFilterModel value, $Res Function(ItemFilterModel) then) =
      _$ItemFilterModelCopyWithImpl<$Res, ItemFilterModel>;
  @useResult
  $Res call(
      {PaginationModel paginationModel,
      String? category,
      String? commonname,
      String? sortBy,
      String? username,
      String? activestatus});

  $PaginationModelCopyWith<$Res> get paginationModel;
}

/// @nodoc
class _$ItemFilterModelCopyWithImpl<$Res, $Val extends ItemFilterModel>
    implements $ItemFilterModelCopyWith<$Res> {
  _$ItemFilterModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paginationModel = null,
    Object? category = freezed,
    Object? commonname = freezed,
    Object? sortBy = freezed,
    Object? username = freezed,
    Object? activestatus = freezed,
  }) {
    return _then(_value.copyWith(
      paginationModel: null == paginationModel
          ? _value.paginationModel
          : paginationModel // ignore: cast_nullable_to_non_nullable
              as PaginationModel,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      commonname: freezed == commonname
          ? _value.commonname
          : commonname // ignore: cast_nullable_to_non_nullable
              as String?,
      sortBy: freezed == sortBy
          ? _value.sortBy
          : sortBy // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      activestatus: freezed == activestatus
          ? _value.activestatus
          : activestatus // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PaginationModelCopyWith<$Res> get paginationModel {
    return $PaginationModelCopyWith<$Res>(_value.paginationModel, (value) {
      return _then(_value.copyWith(paginationModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ItemFilterModelCopyWith<$Res>
    implements $ItemFilterModelCopyWith<$Res> {
  factory _$$_ItemFilterModelCopyWith(
          _$_ItemFilterModel value, $Res Function(_$_ItemFilterModel) then) =
      __$$_ItemFilterModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PaginationModel paginationModel,
      String? category,
      String? commonname,
      String? sortBy,
      String? username,
      String? activestatus});

  @override
  $PaginationModelCopyWith<$Res> get paginationModel;
}

/// @nodoc
class __$$_ItemFilterModelCopyWithImpl<$Res>
    extends _$ItemFilterModelCopyWithImpl<$Res, _$_ItemFilterModel>
    implements _$$_ItemFilterModelCopyWith<$Res> {
  __$$_ItemFilterModelCopyWithImpl(
      _$_ItemFilterModel _value, $Res Function(_$_ItemFilterModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paginationModel = null,
    Object? category = freezed,
    Object? commonname = freezed,
    Object? sortBy = freezed,
    Object? username = freezed,
    Object? activestatus = freezed,
  }) {
    return _then(_$_ItemFilterModel(
      paginationModel: null == paginationModel
          ? _value.paginationModel
          : paginationModel // ignore: cast_nullable_to_non_nullable
              as PaginationModel,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      commonname: freezed == commonname
          ? _value.commonname
          : commonname // ignore: cast_nullable_to_non_nullable
              as String?,
      sortBy: freezed == sortBy
          ? _value.sortBy
          : sortBy // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      activestatus: freezed == activestatus
          ? _value.activestatus
          : activestatus // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_ItemFilterModel implements _ItemFilterModel {
  _$_ItemFilterModel(
      {required this.paginationModel,
      this.category,
      this.commonname,
      this.sortBy,
      this.username,
      this.activestatus});

  @override
  final PaginationModel paginationModel;
  @override
  final String? category;
  @override
  final String? commonname;
  @override
  final String? sortBy;
  @override
  final String? username;
  @override
  final String? activestatus;

  @override
  String toString() {
    return 'ItemFilterModel(paginationModel: $paginationModel, category: $category, commonname: $commonname, sortBy: $sortBy, username: $username, activestatus: $activestatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ItemFilterModel &&
            (identical(other.paginationModel, paginationModel) ||
                other.paginationModel == paginationModel) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.commonname, commonname) ||
                other.commonname == commonname) &&
            (identical(other.sortBy, sortBy) || other.sortBy == sortBy) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.activestatus, activestatus) ||
                other.activestatus == activestatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType, paginationModel, category,
      commonname, sortBy, username, activestatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ItemFilterModelCopyWith<_$_ItemFilterModel> get copyWith =>
      __$$_ItemFilterModelCopyWithImpl<_$_ItemFilterModel>(this, _$identity);
}

abstract class _ItemFilterModel implements ItemFilterModel {
  factory _ItemFilterModel(
      {required final PaginationModel paginationModel,
      final String? category,
      final String? commonname,
      final String? sortBy,
      final String? username,
      final String? activestatus}) = _$_ItemFilterModel;

  @override
  PaginationModel get paginationModel;
  @override
  String? get category;
  @override
  String? get commonname;
  @override
  String? get sortBy;
  @override
  String? get username;
  @override
  String? get activestatus;
  @override
  @JsonKey(ignore: true)
  _$$_ItemFilterModelCopyWith<_$_ItemFilterModel> get copyWith =>
      throw _privateConstructorUsedError;
}
