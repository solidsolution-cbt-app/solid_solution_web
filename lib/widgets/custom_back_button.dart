import 'package:flutter/material.dart';
import 'package:solidsolutionweb/components/custom_texts/custom_texts.dart';
import 'package:solidsolutionweb/constants/colors.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    required this.onTap,
    this.padding,
    super.key,
  });
  final Function() onTap;
  final double? padding;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: padding ?? 20,
          vertical: padding ?? 20,
        ),
        width: 130,
        child: InkWell(
          onTap: onTap,
          child: const Row(
            children: [
              Icon(
                Icons.arrow_back,
              ),
              CustomTextBody1(
                text: "Back",
                textColor: AppColors.dartArsh,
              )
            ],
          ),
        ),
      ),
    );
  }
}
