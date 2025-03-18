import 'package:flutter/material.dart';
import 'package:solidsolutionweb/components/custom_texts/custom_texts.dart';
import 'package:solidsolutionweb/constants/colors.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    required this.onTap,
    super.key,
  });
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
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
    );
  }
}
