
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_bloem/models/item_filter.dart';
import 'package:http/http.dart' as http;


import '../config.dart';
import '../models/cart.dart';
import '../models/item.dart';
import '../screens/share.dart';

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
    String? username = await SharedPreferencesHelper.getUsername();
    if (username == null) {
      print("username not available");
      // Use the retrieved username
    }
    //print("here");


    Map<String,String> requestHeader={
      'Content-Type':'application/json',
    };
    //final url = Uri.parse(itemAdd + "/" );
    var url = Uri.http(apiURL,"$cartAPI/${username!}");
    var response =  await http.get(url,headers: requestHeader);

    //print(response.statusCode);
    if(response.statusCode==200){
      var data=jsonDecode(response.body);
      print(jsonDecode(response.body));
      if(data["data"] != null){
        print(data["data"].runtimeType);
        return Cart.fromJson(data["data"]);
      }else{
        return null;
      }
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
    var JsonModel=jsonEncode({
      "username":username,
      "item":id,
      "qty":qty,
    });
    //print(JsonModel);
    var url = Uri.http(apiURL,cartAPI);
    var response =  await http.delete(
        url,
        headers: requestHeader,
        body: JsonModel,
    );
    if(response.statusCode==200){
      return true;
    }else{
      return null;
    }
  }
}

