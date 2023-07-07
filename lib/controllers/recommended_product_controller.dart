import 'package:food_delivery/models/products_model.dart';
import 'package:get/get.dart';

import '../data/repo/recommended_product_repo.dart';

class RecommendedProductController extends GetxController {
  final RecommendedProductRepo recommendedProductRepo;

  RecommendedProductController({required this.recommendedProductRepo});
  List<dynamic> _recommendedProductList = [];
  List<dynamic> get recommendedProductList => _recommendedProductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getRecommendedProductList() async {
    Response response = await recommendedProductRepo.getRecommendedProductList();  //it returns json data
    if (response.statusCode == 200) {

      print('got products recommended');
      _recommendedProductList = [];
      _recommendedProductList.addAll(Product.fromJson(response.body).products);
      // print(_recommendedProductList.toString());
      _isLoaded = true;
      update();
    }else {
      // print('failed recommended');
    }
  }
}