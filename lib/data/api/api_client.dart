import 'package:food_delivery/utils/app_constants.dart';
import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token;
  final String appBaseUrl;
  late Map<String, String> _mainHeaders;

  
  ApiClient({required this.appBaseUrl}) {
    baseUrl = appBaseUrl;
    timeout = Duration(seconds: 30);
    token = AppConstants.TOKEN;
    _mainHeaders = {
      'Content-Type': 'application/json; charset=UTF-8', //charset: for encode and decode
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
  }


  Future<Response> getData(String uri) async {
    try {
      //get data from internet
      //this get method donesn't want the complete uri, it just wants the endpoint
      Response response = await get(uri);
      return response;
    } catch (error) {
      return Response(statusCode: 1, statusText: error.toString());
    }
  }
}
