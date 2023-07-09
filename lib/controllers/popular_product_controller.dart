import 'package:flutter/material.dart';
import 'package:food_delivery/data/repo/popular_product_repo.dart';
import 'package:food_delivery/models/cart_model.dart';
import 'package:food_delivery/models/products_model.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:get/get.dart';

import 'cart_controller.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;

  PopularProductController({required this.popularProductRepo});
  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;
  late CartController _cart;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  int _quantity = 0;
  int get quantity => _quantity;
  int _inCartItems = 0;
  int get inCartItems => _inCartItems + _quantity;

  Future<void> getPopularProductList() async {
    Response response =
        await popularProductRepo.getPopularProductList(); //it returns json data
    if (response.statusCode == 200) {
      // print('got products');
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);

      // print(_popularProductList.toString());
      _isLoaded = true;
      update();
    } else {
      // print('failed');
    }
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity = checkQuantity(_quantity + 1);
    } else {
      _quantity = checkQuantity(_quantity - 1);
    }
    update(); //update the Ui,
  }

  int checkQuantity(int quantity) {
    if ((_inCartItems + quantity) < 0) {
      Get.snackbar(
        'Item count',
        "sorry, you didn't buy yet!",
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
      if (_inCartItems>0) {
        _quantity = -_inCartItems;
        return _quantity;
      }
      return 0;
    } else if ((_inCartItems + quantity) > 20) {
      Get.snackbar(
        'Item count',
        "Sorry, you can't buy more!",
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
      return 20;
    } else {
      return quantity;
    }
  }

  //when we open a new page
  void initProduct(ProductModel product, CartController cart) {
    _quantity = 0;
    _inCartItems = 0;
    _cart = cart;
    var exist = false;
    exist = _cart.existInCart(product);
    // print(exist.toString());
    if (exist) {
      _inCartItems = _cart.getQuantity(product);
    }
    print('thte quantity in the cart is ' + _inCartItems.toString());

    //get from storage and set it in cartItems
  }

  void addItem(ProductModel product) {
    _cart.addItem(product, _quantity);

    _quantity = 0;
    _inCartItems = _cart.getQuantity(product);

    _cart.items.forEach((key, value) {
      print("the id is: " +
          value.id.toString() +
          " and the quantity is: " +
          value.quantity.toString());
    });
    update(); //update the Ui,
  }

  int get totalItems{
    return _cart.totalItems;
  }

  List<CartModel> get getCartItems{
    return _cart.getCartItems;
  }
}
