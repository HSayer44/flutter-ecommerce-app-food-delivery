//Repo are just responsible of getting data

import 'dart:convert';

import 'package:food_delivery/models/cart_model.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartRepo {
  final SharedPreferences sharedPreferences;
  CartRepo({required this.sharedPreferences});

  List<String> cartHistory = [];
  void addToCartList(List<CartModel> cartList) {
    cartHistory = [];
    //convert object to string cause shared preferences only accepts String
    cartList.forEach((element) => cartHistory.add(jsonEncode(element)));
    sharedPreferences.setStringList(AppConstants.CART_LIST, cartHistory);
    //print(sharedPreferences.getStringList(AppConstants.CART_LIST));
    getCartList();
  }

  List<CartModel> getCartList() {
    List<String> cartHistory = [];
    if (sharedPreferences.containsKey(AppConstants.CART_LIST)) {
      cartHistory = sharedPreferences.getStringList(AppConstants.CART_LIST)!;
      //print(cartHistory.toString());
    }
        //convert string to object cause shared preferences only accepts String

    List<CartModel> cartList = [];
    cartHistory.forEach((element) => cartList.add(CartModel.fromJson(jsonDecode(element))));
    return cartList;
  }
}
