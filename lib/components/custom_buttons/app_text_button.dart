import 'package:flutter/material.dart';
import 'package:solidsolutionweb/constants/colors.dart';
import 'package:solidsolutionweb/constants/styles.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({
    required this.onTap,
    this.buttontext = 'button text',
    this.buttonWidget,
    this.sizedimensionwidth,
    this.sizedimensionheight,
    this.alignGeometry,
    this.textcolor,
    this.padding,
    // this.textstyle,
    this.textWeight,
    Key? key,
    this.textsize,
  }) : super(key: key);
  final String buttontext;
  final Function() onTap;
  final Color? textcolor;
  // final TextStyle? textstyle;
  final double? textsize;
  final Widget? buttonWidget;
  final double? sizedimensionheight;
  final double? sizedimensionwidth;
  final EdgeInsets? padding;
  final AlignmentGeometry? alignGeometry;
  final FontWeight? textWeight;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        padding: padding ?? EdgeInsets.zero,
        minimumSize: Size(sizedimensionwidth ?? 30, sizedimensionheight ?? 30),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        alignment: alignGeometry ?? Alignment.centerLeft,
      ),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: buttonWidget ??
            Text(
              buttontext,
              style: AppTextStyles.labelSemiBold.copyWith(
                color: textcolor ?? AppColors.primaryColor,
                fontSize: textsize,
                fontWeight: textWeight,
              ),
            ),
      ),
    );
  }
}
