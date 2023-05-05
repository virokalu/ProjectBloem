import 'package:freezed_annotation/freezed_annotation.dart';
import 'item.dart';

part 'cart_item.freezed.dart';
part 'cart_item.g.dart';

@freezed
abstract class CartItem with _$CartItem {
  factory CartItem({
    required double qty,
    required Item item,
  })= _CartItem;

  factory CartItem.fromJson(Map<String,dynamic>json)=>
      _$CartItemFromJson(json);
}