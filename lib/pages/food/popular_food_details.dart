import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_column.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/expandable_text_widget.dart';
import 'package:food_delivery/widgets/icon_and_text_widget.dart';
import 'package:food_delivery/widgets/small_text.dart';

import '../../widgets/big_text.dart';

class PopularFoodDetails extends StatelessWidget {
  const PopularFoodDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.popularFoodImgSize,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/image/food0.png'),
                ),
              ),
            ),
          ),
          Positioned(
            top: Dimensions.height45,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.arrow_back_ios,
                  backgroundColor: Colors.white.withOpacity(0.4),
                ),
                AppIcon(
                  icon: Icons.shopping_cart_outlined,
                  backgroundColor: Colors.white.withOpacity(0.4),
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Dimensions.popularFoodImgSize - 20,
            child: Container(
              padding: EdgeInsets.only(
                  left: Dimensions.width20,
                  right: Dimensions.width20,
                  top: Dimensions.height20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(Dimensions.radius20),
                      topLeft: Radius.circular(Dimensions.radius20))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppColumn(text: 'Chinese Side'),
                  SizedBox(height: Dimensions.height20),
                  BigText(text: 'Introduce'),
                  SizedBox(height: Dimensions.height20),
                  Expanded(child: SingleChildScrollView(child: ExpandableTextWidget(text: "Biryani is a timeless culinary masterpiece that has captured the hearts and palates of food enthusiasts worldwide. With its origins deeply rooted in the rich Mughlai cuisine of the Indian subcontinent, Biryani has evolved into a beloved dish that combines fragrant rice, tender meat or vegetables, and a symphony of aromatic spices. At our online app, we bring you an authentic Biryani experience like no other. Each grain of rice is infused with the flavors of exotic spices such as cardamom, cloves, cinnamon, and saffron, creating a tantalizing aroma that whets the appetite. The meat, whether it's succulent chicken, tender lamb, or juicy shrimp, is marinated and slow-cooked to perfection, resulting in melt-in-your-mouth goodness. Our Biryani is a harmonious blend of textures and flavors. The long-grain basmati rice, cooked to fluffy perfection, is layered with the meat or vegetables, creating a symphony of taste with every spoonful. The delicate balance of spices, meticulously measured and combined, adds depth and complexity to every bite. But Biryani is more than just a dish; it's an experience that brings people together. Whether you're enjoying it at a family gathering, a festive celebration, or simply treating yourself to a flavorful meal, Biryani is a feast for all senses. The vibrant colors, the tantalizing aromas, and the explosion of flavors will transport you to a culinary paradise. With our online app, you can savor the authentic taste of Biryani from the comfort of your own home. We offer a variety of options to cater to different preferences, including vegetarian, chicken, lamb, and seafood Biryani. Each dish is carefully crafted by our skilled chefs, using only the finest ingredients and traditional cooking techniques. Treat yourself to the indulgent flavors of Biryani today. Order from our online app and experience the magic of this legendary dish delivered right to your doorstep. Get ready to embark on a culinary journey that will leave you craving for more. Bon appétit!")))
                ],
              ),
            ),
          ),
        ],
      ),
      //part of scaffold
      bottomNavigationBar: Container(
        height: Dimensions.bottomBarHeight,
        padding: EdgeInsets.only(
            top: Dimensions.height30,
            bottom: Dimensions.height30,
            right: Dimensions.width20,
            left: Dimensions.width20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.radius20 * 2),
            topRight: Radius.circular(Dimensions.radius20 * 2),
          ),
          color: AppColors.buttonBackgroundColor,
          
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.height20, left: Dimensions.width20, right: Dimensions.width20),

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white
              ),
              child: Row(
                children: [
                  Icon(Icons.remove, color: AppColors.signColor,),
                  SizedBox(width: Dimensions.width10/2),
                  BigText(text: '0'),
                  SizedBox(width: Dimensions.width10/2),
                  Icon(Icons.add, color: AppColors.signColor,)
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(Dimensions.height20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: AppColors.mainColor,
              ),
              child: BigText(text: '\$10 | Add to cart', color: Colors.white,),
            ),
          ],
        ),
      ),
    );
  }
}
