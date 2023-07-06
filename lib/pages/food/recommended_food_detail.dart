import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/expandable_text_widget.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.clear),
                AppIcon(
                  icon: Icons.shopping_cart_outlined,
                )
              ],
            ),
            bottom: PreferredSize(
              child: Container(
                padding: EdgeInsets.only(top: 5, bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20),
                    topRight: Radius.circular(Dimensions.radius20),
                  ),
                ),
                child: Center(
                    child: BigText(
                  text: "Chinese Side",
                  size: Dimensions.font26,
                )),
                width: double.maxFinite,
              ),
              preferredSize: Size.fromHeight(20),
            ),
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/image/food0.png',
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      left: Dimensions.width20,
                      right: Dimensions.width20,
                    ),
                    child: ExpandableTextWidget(
                        text:
                            "Biryani is a timeless culinary masterpiece that has captured the hearts and palates of food enthusiasts worldwide. With its origins deeply rooted in the rich Mughlai cuisine of the Indian subcontinent, Biryani has evolved into a beloved dish that combines fragrant rice, tender meat or vegetables, and a symphony of aromatic spices. At our online app, we bring you an authentic Biryani experience like no other. Each grain of rice is infused with the flavors of exotic spices such as cardamom, cloves, cinnamon, and saffron, creating a tantalizing aroma that whets the appetite. The meat, whether it's succulent chicken, tender lamb, or juicy shrimp, is marinated and slow-cooked to perfection, resulting in melt-in-your-mouth goodness. Our Biryani is a harmonious blend of textures and flavors. The long-grain basmati rice, cooked to fluffy perfection, is layered with the meat or vegetables, creating a symphony of taste with every spoonful. The delicate balance of spices, meticulously measured and combined, adds depth and complexity to every bite. But Biryani is more than just a dish; it's an experience that brings people together. Whether you're enjoying it at a family gathering, a festive celebration, or simply treating yourself to a flavorful meal, Biryani is a feast for all senses. The vibrant colors, the tantalizing aromas, and the explosion of flavors will transport you to a culinary paradise. With our online app, you can savor the authentic taste of Biryani from the comfort of your own home. We offer a variety of options to cater to different preferences, including vegetarian, chicken, lamb, and seafood Biryani. Each dish is carefully crafted by our skilled chefs, using only the finest ingredients and traditional cooking techniques. Treat yourself to the indulgent flavors of Biryani today. Order from our online app and experience the magic of this legendary dish delivered right to your doorstep. Get ready to embark on a culinary journey that will leave you craving for more. Bon appétit!"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
              left: Dimensions.width20 * 2.5,
              right: Dimensions.width20 * 2.5,
              top: Dimensions.height10,
              bottom: Dimensions.height10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.remove,
                  iconSize: Dimensions.iconSize24,
                  backgroundColor: AppColors.mainColor,
                  iconColor: Colors.white,
                ),
                BigText(
                  text: "\$ 12.88 " + " X " + " 0 ",
                  color: AppColors.mainBlackColor,
                  size: Dimensions.font26,
                ),
                AppIcon(
                  icon: Icons.add,
                  iconSize: Dimensions.iconSize24,
                  backgroundColor: AppColors.mainColor,
                  iconColor: Colors.white,
                ),
              ],
            ),
          ),
          Container(
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
                  padding: EdgeInsets.only(
                      top: Dimensions.height20,
                      bottom: Dimensions.height20,
                      left: Dimensions.width20,
                      right: Dimensions.width20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: Colors.white),
                  child: Icon(Icons.favorite, color: AppColors.mainColor,)
                ),
                Container(
                  padding: EdgeInsets.all(Dimensions.height20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: AppColors.mainColor,
                  ),
                  child: BigText(
                    text: '\$10 | Add to cart',
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
