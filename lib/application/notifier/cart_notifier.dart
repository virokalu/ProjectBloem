import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_bloem/api/api_service.dart';
import 'package:project_bloem/application/state/cart_state.dart';
import 'package:project_bloem/models/cart.dart';
import 'package:project_bloem/models/cart_item.dart';

class CartNotifier extends StateNotifier<CartState>{
  final APIService _apiService;

  CartNotifier(this._apiService) : super(const CartState()){

    getCartItems();
  }
  Future<void> getCartItems() async{
    state=state.copyWith(isLoading: true);

    final cartData = await _apiService.getCart();
    state=state.copyWith(cartModel: cartData);
    state=state.copyWith(isLoading: false);
  }

  Future<void>addCartItem(id,qty,username)async{
    await _apiService.addCartItem(id, qty,username);
    await getCartItems();
  }

  Future<void>removeCartItem(id,qty,username)async{
    await _apiService.removeCartItem(id, qty,username);
    var isCartItemExist = state.cartModel!.items
        .firstWhere((element) => element.item.id == id);

    var updatedItems = state.cartModel!;

    updatedItems.items.remove(isCartItemExist);
    state=state.copyWith(cartModel: updatedItems);
  }
  
  Future<void>updateQty(id,qty,type,username)async{
    var cItem =  state.cartModel!.items
        .firstWhere((element) => element.item.id==id);
    var updatedItems = state.cartModel!;
    if(type=="-"){
      await _apiService.removeCartItem(id, 1,username);
      if(cItem.qty>1){
        CartItem cartItem = CartItem(
          qty: cItem.qty-1,
          item: cItem.item,
        );
        updatedItems.items.remove(cItem);
        updatedItems.items.add(cartItem);
      }else{
        updatedItems.items.remove(cItem);
      }
    }
    else{
      await _apiService.addCartItem(id, 1,username);

      CartItem cartItem = CartItem(
          qty: cItem.qty+1,
          item: cItem.item,
      );
      updatedItems.items.remove(cItem);
      updatedItems.items.add(cartItem);
    }
    state = state.copyWith(cartModel: updatedItems);
  }
}