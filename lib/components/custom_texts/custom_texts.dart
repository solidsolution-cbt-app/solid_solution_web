import 'package:flutter/material.dart';
import 'package:solidsolutionweb/constants/colors.dart';

class CustomTextBody1 extends StatelessWidget {
  const CustomTextBody1({
    this.fontSize,
    this.text,
    this.textColor,
    this.textAlign,
    this.textStyle,
    this.overflow,
    this.fontWeight,
    this.textDecoration,
    Key? key,
  }) : super(key: key);
  final String? text;
  final Color? textColor;
  final double? fontSize;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final TextDecoration? textDecoration;
  final FontWeight? fontWeight;
  final TextStyle? textStyle;
  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? "",
      style: textStyle ??
          TextStyle(
            fontSize: fontSize ?? 20,
            fontWeight: fontWeight ?? FontWeight.w400,
            fontFamily: "Poppins",
            color: textColor ?? AppColors.dartArsh,
            overflow: overflow ?? TextOverflow.visible,
            decoration: textDecoration,
          ),
      textAlign: textAlign ?? TextAlign.center,
    );
  }
}

class MoneySymbolText extends StatelessWidget {
  const MoneySymbolText({
    this.fontSize,
    this.text,
    this.textColor,
    this.textAlign,
    this.overflow,
    this.fontWeight,
    this.textStyle,
    this.textDecoration,
    Key? key,
  }) : super(key: key);
  final String? text;
  final Color? textColor;
  final TextStyle? textStyle;
  final double? fontSize;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final TextDecoration? textDecoration;
  final FontWeight? fontWeight;
  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? "",
      style: textStyle ??
          TextStyle(
            fontSize: fontSize ?? 16,
            fontWeight: fontWeight ?? FontWeight.w400,
            color: textColor ?? AppColors.primaryColor.withOpacity(0.6),
            overflow: overflow ?? TextOverflow.visible,
            decoration: textDecoration,
          ),
      textAlign: textAlign ?? TextAlign.center,
    );
  }
}

class CustomTextHeader1 extends StatelessWidget {
  const CustomTextHeader1({
    this.text,
    this.textColor = AppColors.primaryColor,
    this.fontSize,
    this.textAlign,
    this.fontWeight,
    this.textDecoration,
    this.overflow,
    this.textStyle,
    Key? key,
  }) : super(key: key);
  final TextAlign? textAlign;
  final String? text;
  final double? fontSize;
  final Color? textColor;
  final TextOverflow? overflow;
  final FontWeight? fontWeight;
  final TextDecoration? textDecoration;
  final TextStyle? textStyle;
  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? "",
      style: textStyle ??
          TextStyle(
            fontSize: fontSize ?? 32,
            fontFamily: "Poppins",
            fontWeight: fontWeight ?? FontWeight.w600,
            color: textColor,
            overflow: overflow ?? TextOverflow.visible,
            decoration: textDecoration,
          ),
      textAlign: textAlign ?? TextAlign.center,
    );
  }
}
