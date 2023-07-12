import 'package:food_delivery/pages/auth/sign_in_page.dart';
import 'package:food_delivery/pages/cart/cart_page.dart';
import 'package:food_delivery/pages/food/popular_food_details.dart';
import 'package:food_delivery/pages/food/recommended_food_detail.dart';
import 'package:food_delivery/pages/home/home_page.dart';
import 'package:food_delivery/pages/home/main_food_page.dart';
import 'package:food_delivery/pages/splash/splash_page.dart';
import 'package:get/get.dart';

class RouteHelper {
  //don't use _ underscore in the rote names, can cause a problem
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";
  static const String cartPage = "/cart-page";
  static const String splashPage = "/splash-page";
  static const String signIn = "/sign-in";

  //just to pass parameters inside them
  static String getInitial() => '$initial';
  //this is how we pass a parameter in ' ':
  static String getPopularFood(int pageId, String fromPage) =>
      '$popularFood?pageId=$pageId&fromPage=$fromPage';
  static String getRecommendedFood(int pageId, String fromPage) =>
      '$recommendedFood?pageId=$pageId&fromPage=$fromPage';
  static String getCartPage() => '$cartPage';
  static String getSplashPage() => '$splashPage';
  static String getSignInPage() => '$signIn';

  static List<GetPage> routes = [
    GetPage(
        name: initial, page: () => HomePage(), transition: Transition.fadeIn),
    GetPage(
        name: popularFood,
        page: () {
          //here we get the parameter above
          var pageId = Get.parameters['pageId'];
          var fromPage = Get.parameters['fromPage'];
          return PopularFoodDetails(
              pageId: int.parse(pageId!), fromPage: fromPage!);
        },
        transition: Transition.fadeIn),
    GetPage(
        name: recommendedFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          var fromPage = Get.parameters['fromPage'];
          return RecommendedFoodDetail(
              pageId: int.parse(pageId!), fromPage: fromPage!);
        },
        transition: Transition.fadeIn),
    GetPage(
      name: cartPage,
      page: () {
        return CartPage();
      },
      transition: Transition.fadeIn,
    ),
    GetPage(name: splashPage, page: () => SplashScreen()),
    GetPage(name: signIn, page: () {
      return SignInPage();

      }, transition: Transition.fade),
  ];
}
