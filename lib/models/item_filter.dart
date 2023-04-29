import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_bloem/models/pagination.dart';

part 'item_filter.freezed.dart';

@freezed
abstract class ItemFilterModel with _$ItemFilterModel{
  factory ItemFilterModel({
    required PaginationModel paginationModel,
    String? category,
    String? commonname,
    String? sortBy,
    String? username,
    String? activestatus,

  }) = _ItemFilterModel;
}