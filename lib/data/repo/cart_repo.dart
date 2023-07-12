//Repo are just responsible of getting data

import 'dart:convert';

import 'package:food_delivery/models/cart_model.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartRepo {
  final SharedPreferences sharedPreferences;
  CartRepo({required this.sharedPreferences});

  //information for shoppingcart page
  List<String> cart = [];

  //information for History page
  List<String> cartHistory = [];
  void addToCartList(List<CartModel> cartList) {
    //if u want to remove history un comment the two lines below
    //sharedPreferences.remove(AppConstants.CART_LIST);
    //sharedPreferences.remove(AppConstants.CART_HISTORY_LIST);
    cart = [];
    var time = DateTime.now().toString();
    //convert object to string cause shared preferences only accepts String
    cartList.forEach((element) {
      element.time = time;

     return cart.add(jsonEncode(element));
    });
    sharedPreferences.setStringList(AppConstants.CART_LIST, cart);
    //print(sharedPreferences.getStringList(AppConstants.CART_LIST));
    getCartList();
  }

  List<CartModel> getCartList() {
    List<String> carts = [];
    if (sharedPreferences.containsKey(AppConstants.CART_LIST)) {
      carts = sharedPreferences.getStringList(AppConstants.CART_LIST)!;
      //print(cartHistory.toString());
    }
    //convert string to object cause shared preferences only accepts String

    List<CartModel> cartList = [];
    carts.forEach(
        (element) => cartList.add(CartModel.fromJson(jsonDecode(element))));
    return cartList;
  }

  List<CartModel> getCartHistoryList(){
    if (sharedPreferences.containsKey(AppConstants.CART_HISTORY_LIST)) {
      cartHistory = [];
      cartHistory = sharedPreferences.getStringList(AppConstants.CART_HISTORY_LIST)!;
    }
    List<CartModel> cartListHistory = [];
    cartHistory.forEach((element) => cartListHistory.add(CartModel.fromJson(jsonDecode(element))));
    return cartListHistory;
  }

  void addToCartHistoryList() {
    if (sharedPreferences.containsKey(AppConstants.CART_HISTORY_LIST)) {
      cartHistory = sharedPreferences.getStringList(AppConstants.CART_HISTORY_LIST)!;
    }
    for (int i = 0; i < cart.length; i++) {
      print('History list : ' + cart[i]);
      cartHistory.add(cart[i]);
    }
    removeCard();
    sharedPreferences.setStringList(
        AppConstants.CART_HISTORY_LIST, cartHistory);
    print('the length of history is '+getCartHistoryList().length.toString());
    print('the time of the order is: ' +getCartHistoryList()[0].time.toString());
  }

  void removeCard() {
    //to remove shared preferences
    cart = [];
    sharedPreferences.remove(AppConstants.CART_LIST);
    
  }

  void clearCardHistory() {
    removeCard();
    cartHistory=[];
    sharedPreferences.remove(AppConstants.CART_HISTORY_LIST);
  }
}
