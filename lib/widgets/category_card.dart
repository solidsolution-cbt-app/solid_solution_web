import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solidsolutionweb/components/custom_texts/custom_texts.dart';
import 'package:solidsolutionweb/constants/colors.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    required this.imagePath,
    required this.onTap,
    required this.title,
    super.key,
  });
  final Function() onTap;
  final String title, imagePath;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        width: 310,
        height: 260,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.violet.withOpacity(.4)),
          borderRadius: BorderRadius.circular(8),
          color: AppColors.violet.withOpacity(.1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(imagePath),
            const SizedBox(height: 20),
            CustomTextBody1(
              text: title,
            ),
            const SizedBox(height: 20),
            const CircleAvatar(
              radius: 10,
              backgroundColor: AppColors.primaryColor,
            )
          ],
        ),
      ),
    );
  }
}
