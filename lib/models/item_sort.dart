
import 'package:freezed_annotation/freezed_annotation.dart';
part 'item_sort.freezed.dart';

@freezed
class ItemSortModel with _$ItemSortModel{
  factory ItemSortModel({
    String? label,
    String? value,
}) = _ItemSortModel;
}