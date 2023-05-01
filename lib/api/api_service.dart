
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_bloem/models/item_filter.dart';
import 'package:http/http.dart' as http;


import '../config.dart';
import '../models/cart.dart';
import '../models/item.dart';

final apiService = Provider((ref) => APIService());

class APIService {

  Future<List<Item>?> getItems(ItemFilterModel itemFilterModel) async{

    Map<String,String> requestHeader = {'Content-Type':'application/json'};

    Map<String,String> queryString = {
      'page': itemFilterModel.paginationModel.page.toString(),
      'pageSize': itemFilterModel.paginationModel.pageSize.toString()
    };
    if(itemFilterModel.category != null){
      queryString["category"] = itemFilterModel.category!;
    }
    if(itemFilterModel.commonname != null){
      queryString["commonname"] = itemFilterModel.commonname!;
    }
    if(itemFilterModel.username != null){
      queryString["username"] = itemFilterModel.username!;
    }
    if(itemFilterModel.activestatus != null){
      queryString["activestatus"] = itemFilterModel.activestatus!;
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

  Future<Cart?> getCart() async{

    Map<String,String> requestHeader={
      'Content-Type':'application/json',
    };
    var url = Uri.http(apiURL,cartAPI);
    var response =  await http.get(url,headers: requestHeader);

    if(response.statusCode==200){
      var data=jsonDecode(response.body);
      return Cart.fromJson(data["data"]);
    }else{
      return null;
    }
  }
  Future<bool?> addCartItem(id,qty,username) async{

    Map<String,String> requestHeader={
      'Content-Type':'application/json',
    };
    var url = Uri.http(apiURL,cartAPI);
    var response =  await http.post(
        url,
        headers: requestHeader,
        body: jsonEncode({
          "username":username,
          "items":[
            {"item":id,"qty":qty}
          ]
        })
    );

    if(response.statusCode==200){
      return true;
    }else{
      return null;
    }
  }

  Future<bool?> removeCartItem(id,qty,username) async{

    Map<String,String> requestHeader={
      'Content-Type':'application/json',
    };
    var url = Uri.http(apiURL,cartAPI);
    var response =  await http.delete(
        url,
        headers: requestHeader,
        body: jsonEncode({
          "username":username,
          "items":[
            {"item":id,"qty":qty}
          ]
        })
    );

    if(response.statusCode==200){
      return true;
    }else{
      return null;
    }
  }
}

