
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_bloem/models/item_filter.dart';
import 'package:http/http.dart' as http;


import '../config.dart';
import '../models/item.dart';

final apiService = Provider((ref) => APIService());

class APIService {

  Future<List<Item>?> getItems(ItemFilterModel itemFilterModel) async{
    // List<Item> list = List<Item>.empty(growable: true);
    // list.add(Item(
    //   username: "virokalu",
    //   category: "Cut Flowers",
    //   commonname: "Rose",
    //   sciname: "Rose",
    //   price: 1000,
    //   description: "check the add Lisiting in system",
    //   cashondelivery: true,
    //   chatactivate: true,
    //   imgone: "https://firebasestorage.googleapis.com/v0/b/projectbloem-1e1c5.appspot.com/o/itemImg%2Fvirokalu%2Fvirokalu2023-04-12%2019%3A01%3A24.060280scaled_Screenshot_20230407-213102.png?alt=media&token=0d70b4f1-7ace-4365-a0ef-2b8e485ecf69",
    //   imgtwo: "https://firebasestorage.googleapis.com/v0/b/projectbloem-1e1c5.appspot.com/o/itemImg%2Fvirokalu%2Fvirokalu2023-04-10%2021%3A09%3A25.579419scaled_IMG_20230327_125549.jpg?alt=media&token=e5325b68-1d2c-4055-ab0f-4e3d9979146e",
    //   imgthree: "https://firebasestorage.googleapis.com/v0/b/projectbloem-1e1c5.appspot.com/o/itemImg%2Fvirokalu%2Fvirokalu2023-04-10%2021%3A09%3A32.358213scaled_Screenshot_20230407-213102.png?alt=media&token=45e03852-b2b4-417b-b048-3907395ff699",
    //
    // ));
    Map<String,String> requestHeader = {'Content-Type':'application/json'};

    Map<String,String> queryString = {
      'page': itemFilterModel.paginationModel.page.toString(),
      'pageSize': itemFilterModel.paginationModel.pageSize.toString()
    };
    if(itemFilterModel.category != null){
      queryString["category"] = itemFilterModel.category!;
    }
    if(itemFilterModel.sortBy != null){
      queryString['sort'] = itemFilterModel.sortBy!;
    }
    var url = Uri.http(apiURL,itemGet,queryString);
    var response = await http.get(url,headers: requestHeader);
    //print(url.toString());
    //print(response.body.toString());
    var data = jsonDecode(response.body);
    //print(data);
    if(data["status"]){
      //print(data["data"]);
      return itemsFromJson(data["data"]);
    }else{
      return null;
    }
  }
}