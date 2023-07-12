import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/base/custom_loader.dart';
import 'package:food_delivery/controllers/auth_controller.dart';
import 'package:food_delivery/pages/auth/sign_up_page.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/add_text_field.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/small_text.dart';
import 'package:get/get.dart';

import '../../base/show_custtom_snackbar.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    void _login(AuthController authController) {
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      if (email.isEmpty) {
        showCustommSnackbar('Type in your email address', title: 'Name');
      } else if (!GetUtils.isEmail(email)) {
        showCustommSnackbar('Email address in not valid',
            title: 'Invalid email address');
      } else if (password.isEmpty) {
        showCustommSnackbar('Type in your password', title: 'Password');
      } else if (password.length < 6) {
        showCustommSnackbar('Password must be more than six characters',
            title: 'Password');
      } else {
        authController.login(email, password).then((status) {
          if (status.isSuccess) {
            Get.toNamed(RouteHelper.getInitial());
          } else {
            showCustommSnackbar(status.message);
          }
        });
      }
    }

    return Scaffold(
        backgroundColor: Colors.white,
        body: GetBuilder<AuthController>(builder: (authController) {
          return !authController.isLoading
              ? SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(height: Dimensions.screenHeight * 0.05),
                      //app logo
                      Container(
                        height: Dimensions.screenHeight * 0.25,
                        child: Center(
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: Dimensions.radius20 * 4,
                            backgroundImage:
                                AssetImage("assets/image/logo part 1.png"),
                          ),
                        ),
                      ),
                      //welcom section
                      Container(
                        margin: EdgeInsets.only(left: Dimensions.width20),
                        width: double.maxFinite,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BigText(
                              text: "Hello",
                              size: Dimensions.font26 * 2,
                            ),
                            SmallText(
                              text: 'Log into your account',
                              size: Dimensions.font20,
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: Dimensions.height20),
                      //email
                      AddTextField(
                        textController: emailController,
                        hintText: 'E-Mail',
                        icon: Icons.email,
                      ),
                      SizedBox(height: Dimensions.height20),
                      //password
                      AddTextField(
                        isObscure: true,
                        textController: passwordController,
                        hintText: 'Password',
                        icon: Icons.password_sharp,
                      ),
                      SizedBox(height: Dimensions.height45),
                      //sign up
                      GestureDetector(
                        onTap: () {
                          _login(authController);
                          Get.toNamed(RouteHelper.getCartPage());
                        },
                        child: Container(
                          width: Dimensions.screenWidth / 2,
                          height: Dimensions.screenHeight / 13,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius30),
                              color: AppColors.mainColor),
                          child: Center(
                            child: BigText(
                              text: 'Log in',
                              size: Dimensions.font26,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: Dimensions.height45),
                      //tag line
                      RichText(
                        text: TextSpan(
                            text: "Don't have an account? ",
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: Dimensions.font20,
                            ),
                            children: [
                              TextSpan(
                                  text: "Create",
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () => Get.to(() => SignUpPage(),
                                        transition: Transition.fade),
                                  style: TextStyle(
                                      color: Colors.blue[300],
                                      decoration: TextDecoration.underline,
                                      fontSize: Dimensions.font20,
                                      fontWeight: FontWeight.bold)),
                            ]),
                      ),
                      SizedBox(height: Dimensions.screenHeight * 0.05),
                      //signup options
                    ],
                  ),
                )
              : CustomLoader();
        }));
  }
}
