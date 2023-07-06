import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/small_text.dart';

//we are using stf widget cause we have bottun and we will redraw the screen and gonna need setstate

class ExpandableTextWidget extends StatefulWidget {
  final String text;
  const ExpandableTextWidget({Key? key, required this.text}) : super(key: key);

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  //late so we initialize them later
  late String firstHalf;
  late String secondHalf;

  bool hiddenText = true;
  double textHeight = Dimensions.screenHeight / 2.81; //little more than 100

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.text.length > textHeight) {
      //subString: (start, end)
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? SmallText(text: firstHalf,size: Dimensions.font16, color: AppColors.paraColor, height: 1.8,)
          : Column(
              children: [
                SmallText(
                  height: 1.8,
                  size: Dimensions.font16,
                  color: AppColors.paraColor,
                    text: hiddenText
                        ? (firstHalf + '...')
                        : (firstHalf + secondHalf)),
                InkWell(
                  onTap: () {
                    setState(() {
                      hiddenText =!hiddenText;
                    });
                  },
                  child: Row(
                    children: [
                      SmallText(text: hiddenText ? 'show more' : 'show less', color: AppColors.mainColor),
                      Icon(hiddenText ? Icons.arrow_drop_down:Icons.arrow_drop_up, color: AppColors.mainColor),
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
