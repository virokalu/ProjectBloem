// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

// ignore: non_constant_identifier_names
_$_Item _$$_ItemFromJson(Map<String, dynamic> json) => _$_Item(
      id: json['id'] as String,
      username: json['username'] as String,
      category: json['category'] as String,
      commonname: json['commonname'] as String,
      sciname: json['sciname'] as String?,
      price: (json['price'] as num).toDouble(),
      description: json['description'] as String,
      cashondelivery: json['cashondelivery'] as bool,
      chatactivate: json['chatactivate'] as bool,
      district: json['district'] as String,
      imgone: json['imgone'] as String,
      imgtwo: json['imgtwo'] as String,
      imgthree: json['imgthree'] as String,
    );

// ignore: non_constant_identifier_names
Map<String, dynamic> _$$_ItemToJson(_$_Item instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'category': instance.category,
      'commonname': instance.commonname,
      'sciname': instance.sciname,
      'price': instance.price,
      'description': instance.description,
      'cashondelivery': instance.cashondelivery,
      'chatactivate': instance.chatactivate,
      'district': instance.district,
      'imgone': instance.imgone,
      'imgtwo': instance.imgtwo,
      'imgthree': instance.imgthree,
    };
