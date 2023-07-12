import 'package:food_delivery/models/response_model.dart';
import 'package:food_delivery/models/signup_body_model.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import '../data/repo/auth_repo.dart';
import '../utils/app_constants.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepo authRepo;

  AuthController({
    required this.authRepo,
  });

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<ResponseModel> registration(SignUpModel signUpModel) async {
    _isLoading = true;
    update();
    Response response = await authRepo.registratioin(signUpModel);
    late ResponseModel responseModel;
    if (response.statusCode == 200) {
      authRepo.saveUserToken(response.body["token"]);
      responseModel = ResponseModel(true, response.body["token"]);
    } else {
      responseModel = ResponseModel(false, response.statusText!);
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  Future<ResponseModel> login(String email, String password) async {
    //debugging purpose
     print('Getting token');
     print(authRepo.getUserToken().toString());
    //to here

    _isLoading = true;
    update();
    Response response = await authRepo.login(email, password);
    late ResponseModel responseModel;
    if (response.statusCode == 200) {
      authRepo.saveUserToken(response.body["token"]);
      responseModel = ResponseModel(true, response.body["token"]);
    } else {
      responseModel = ResponseModel(false, response.statusText!);
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  void saveUserNumberAndPassword(String number, String password) {
    authRepo.saveUserNumberAndPassword(number, password);
  }

  bool userLoggedIn() {
    return authRepo.userLoggedIn();
  }

  bool clearSharedData(){
    return authRepo.clearSharedData();
  }
}
