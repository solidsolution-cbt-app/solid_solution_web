import 'package:flutter/material.dart';
import 'package:solidsolutionweb/constants/colors.dart';
import 'package:solidsolutionweb/constants/constants.dart';
import 'package:solidsolutionweb/constants/styles.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    required this.onTap,
    this.backgroundColor,
    this.buttonText = "button text",
    this.showIconLeft = false,
    this.showIconRight = false,
    this.buttonHeight,
    this.elevation,
    this.leftPadding = 0,
    this.rightPadding = 0,
    this.buttonWidth = 450,
    this.showLoader = false,
    super.key,
  });
  final Function() onTap;
  final Color? backgroundColor;
  final double? buttonWidth;
  final double? buttonHeight;
  final String buttonText;
  final bool showIconLeft;
  final bool showIconRight;
  final double? elevation;
  final double leftPadding;
  final double rightPadding;
  final bool showLoader;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: elevation,
        padding: EdgeInsets.only(
          top: 5,
          bottom: 5,
          left: leftPadding,
          right: rightPadding,
        ),
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        fixedSize:
            Size(buttonWidth ?? AppConstants.screenWidth(), buttonHeight ?? 50),
      ),
      onPressed: () {
        if (showLoader) {
        } else {
          onTap();
        }
      },
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Visibility(
            visible: showIconLeft,
            child: const Icon(
              Icons.chevron_left,
              color: Colors.white,
              size: 30,
            ),
          ),
          const Spacer(),
          Row(
            children: [
              Text(
                buttonText,
                style: AppTextStyles.labelRegular.copyWith(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              Visibility(
                visible: showLoader,
                child: const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: SizedBox(
                    width: 30,
                    height: 30,
                    child: CircularProgressIndicator(
                      color: AppColors.violet,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
          Visibility(
            visible: showIconRight,
            child: const Icon(
              Icons.chevron_right,
              color: Colors.white,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
