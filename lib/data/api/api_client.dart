import 'package:food_delivery/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token;
  final String appBaseUrl;
  late SharedPreferences sharedPreferences;
  late Map<String, String> _mainHeaders;

  ApiClient({required this.appBaseUrl, required this.sharedPreferences}) {
    baseUrl = appBaseUrl;
    timeout = const Duration(seconds: 30);
    token = sharedPreferences.getString(AppConstants.TOKEN)??"";
    _mainHeaders = {
      'Content-Type':
          'application/json; charset=UTF-8', //charset: for encode and decode
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
  }

  void updateHeader(String token) {
    _mainHeaders = {
      'Content-Type':
          'application/json; charset=UTF-8', //charset: for encode and decode
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
  }

  Future<Response> getData(String uri, {Map<String, String>? headers}) async {
    try {
      //get data from internet
      //this get method donesn't want the complete uri, it just wants the endpoint
      Response response = await get(uri, headers: headers??_mainHeaders);
      return response;
    } catch (error) {
      return Response(statusCode: 1, statusText: error.toString());
    }
  }

  //authorization
  Future<Response> postData(String uri, dynamic body) async {
    print(body.toString());
    try {
      //this post method coming from Getx
      Response response = await post(uri, body, headers: _mainHeaders);
      print(response.toString());
      return response;
    } catch (e) {
      print(e);
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}