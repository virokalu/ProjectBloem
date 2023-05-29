import 'package:freezed_annotation/freezed_annotation.dart';
import 'cart_item.dart';

part 'cart.freezed.dart';
part 'cart.g.dart';

@freezed
abstract class Cart with _$Cart{
  factory Cart({
    required String username,
    required List<CartItem> items,
    required String cartId,
  }) = _Cart;
  factory Cart.fromJson(Map<String,dynamic>json)=>_$CartFromJson(json);
}

extension CartExt on Cart {
  double? get grandTotal {
    return items.map((e)=>e.item.price * e.qty)
        .fold(0,(p,c)=>p!+c);
  }
}
// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'cart_item.dart';
//
// part 'cart.freezed.dart';
// part 'cart.g.dart';
//
// @freezed
// abstract class Cart with _$Cart {
//   factory Cart({
//     required String username,
//     List<CartItem>? items, // Change the type to List<CartItem>?
//     required String cartId,
//   }) = _Cart;
//
//   factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);
// }
