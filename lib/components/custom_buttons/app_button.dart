import 'package:flutter/material.dart';
import 'package:solidsolutionweb/constants/colors.dart';
import 'package:solidsolutionweb/constants/constants.dart';
import 'package:solidsolutionweb/constants/styles.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    required this.onTap,
    this.backgroundColor = AppColors.primaryColor,
    this.buttonText = "button text",
    this.showIconLeft = false,
    this.showIconRight = false,
    this.buttonHeight,
    this.elevation,
    this.leftPadding = 0,
    this.rightPadding = 0,
    this.buttonWidth = 450,
    this.isOutline = false,
    this.showLoader = false,
    this.textColor,
    super.key,
  });
  final Function() onTap;
  final bool isOutline;
  final Color? backgroundColor, textColor;
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
        backgroundColor: isOutline ? Colors.white : backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(color: AppColors.primaryColor),
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
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (showIconLeft) ...[
            const Icon(
              Icons.chevron_left,
              color: Colors.white,
              size: 30,
            ),
            const Spacer(),
          ],
          Visibility(
            visible: showLoader,
            replacement: Text(
              buttonText,
              style: AppTextStyles.labelRegular.copyWith(
                color: textColor ??
                    (isOutline ? AppColors.primaryColor : Colors.white),
                fontSize: 16,
              ),
            ),
            child: const SizedBox(
              width: 30,
              height: 30,
              child: CircularProgressIndicator(
                color: AppColors.violet,
              ),
            ),
          ),
          if (showIconRight) ...[
            const Spacer(),
            const Icon(
              Icons.chevron_right,
              color: Colors.white,
              size: 30,
            ),
          ]
        ],
      ),
    );
  }
}
