import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:solidsolutionweb/components/custom_texts/custom_texts.dart';
import 'package:solidsolutionweb/constants/colors.dart';
import 'package:solidsolutionweb/constants/constants.dart';

class ScreenLoader extends StatelessWidget {
  const ScreenLoader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppConstants.screenWidth() * 0.25,
      ),
      child: Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: FittedBox(
          fit: BoxFit.contain,
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LottieBuilder.asset(
                  "asset/lottie_animation/animation_loader.json",
                ),
                const CustomTextBody1(
                  text: "Loading ...",
                  fontSize: 6,
                  textColor: AppColors.primaryColor,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/*

 */
