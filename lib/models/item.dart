import 'package:freezed_annotation/freezed_annotation.dart';

part 'item.freezed.dart';
part 'item.g.dart';

List<Item> itemsFromJson(dynamic str)=>
    List<Item>.from((str).map((x)=>Item.fromJson(x)));

@freezed
abstract class Item with _$Item {
  factory Item({
    required String id,
    required String username,
    required String category,
    required String commonname,
    String? sciname,
    required double price,
    required String description,
    required bool cashondelivery,
    required bool chatactivate,
    required String district,
    required String imgone,
    required String imgtwo,
    required String imgthree,
  }) = _Item;

  factory Item.fromJson(Map<String, dynamic> json) =>
      _$ItemFromJson(json);
}