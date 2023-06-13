// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

// ignore: non_constant_identifier_names
_$_CartItem _$$_CartItemFromJson(Map<String, dynamic> json) => _$_CartItem(
      qty: (json['qty'] as num).toDouble(),
      item: Item.fromJson(json['item'] as Map<String, dynamic>),
    );

// ignore: non_constant_identifier_names
Map<String, dynamic> _$$_CartItemToJson(_$_CartItem instance) =>
    <String, dynamic>{
      'qty': instance.qty,
      'item': instance.item,
    };
