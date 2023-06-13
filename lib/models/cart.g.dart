// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

// ignore: non_constant_identifier_names
_$_Cart _$$_CartFromJson(Map<String, dynamic> json) => _$_Cart(
      username: json['username'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => CartItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      cartId: json['cartId'] as String,
    );

// ignore: non_constant_identifier_names
Map<String, dynamic> _$$_CartToJson(_$_Cart instance) => <String, dynamic>{
      'username': instance.username,
      'items': instance.items,
      'cartId': instance.cartId,
    };
