import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_bloem/models/item.dart';

part 'item_state.freezed.dart';

@freezed
class ItemsState with _$ItemsState{
  const factory ItemsState({
    @Default(<Item>[]) List<Item> items,
    @Default(true) bool hasNext,
    @Default(false) bool isLoading
  }) = _ItemsState;
}