import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/base/custom_loader.dart';
import 'package:food_delivery/base/show_custtom_snackbar.dart';
import 'package:food_delivery/controllers/auth_controller.dart';
import 'package:food_delivery/models/signup_body_model.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/add_text_field.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:get/get.dart';

import '../../routes/route_helper.dart';
import 'sign_in_page.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    var signupImages = [
      "t.png",
      "g.png",
      "f.png",
    ];

    void _regeistration(AuthController authController) {
      String name = nameController.text.trim();
      String phone = phoneController.text.trim();
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      if (name.isEmpty) {
      } else if (phone.isEmpty) {
        showCustommSnackbar('Type in your phone number', title: 'Phone number');
      } else if (email.isEmpty) {
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
        SignUpModel signUpModel = SignUpModel(
          name: name,
          phone: phone,
          email: email,
          password: password,
        );
        authController.registration(signUpModel).then((status) {
          if (status.isSuccess) {
            print('success registration');
            Get.offNamed(RouteHelper.getInitial());
          } else {
            showCustommSnackbar(status.message);
          }
        });
      }
    }

    return Scaffold(
        backgroundColor: Colors.white,
        body: GetBuilder<AuthController>(builder: (_authController) {
          return !_authController.isLoading
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
                      SizedBox(height: Dimensions.height20),
                      //name
                      AddTextField(
                        textController: nameController,
                        hintText: 'Name',
                        icon: Icons.person,
                      ),
                      SizedBox(height: Dimensions.height20),

                      //phone
                      AddTextField(
                        textController: phoneController,
                        hintText: 'phone',
                        icon: Icons.phone,
                      ),
                      SizedBox(height: Dimensions.height20),

                      //sign up
                      GestureDetector(
                        onTap: () {
                          _regeistration(_authController);
                          Get.toNamed(RouteHelper.getInitial());
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
                              text: 'Sign up',
                              size: Dimensions.font26,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: Dimensions.height10),
                      //tag line
                      RichText(
                        text: TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Get.to(() => SignInPage(),
                                transition: Transition.fade),
                          text: "Already have an account?",
                          style: TextStyle(
                            color: Colors.blue[300],
                            decoration: TextDecoration.underline,
                            fontSize: Dimensions.font20,
                          ),
                        ),
                      ),
                      SizedBox(height: Dimensions.screenHeight * 0.05),
                      //signup options
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: "Or you can use one of the following methods:",
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: Dimensions.font16,
                          ),
                        ),
                      ),
                      Wrap(
                        children: List.generate(
                            3,
                            (index) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CircleAvatar(
                                    radius: Dimensions.radius30,
                                    backgroundImage: AssetImage(
                                      "assets/image/" + signupImages[index],
                                    ),
                                  ),
                                )),
                      )
                    ],
                  ),
                )
              : CustomLoader();
        }));
  }
}
