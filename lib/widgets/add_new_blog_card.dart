import 'package:flutter/material.dart';
import 'package:solidsolutionweb/components/custom_texts/custom_texts.dart';
import 'package:solidsolutionweb/constants/colors.dart';

class AddNewBlogCard extends StatelessWidget {
  const AddNewBlogCard({
    required this.onTap,
    super.key,
  });
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: 400,
          height: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            border: Border.all(
              color: AppColors.violet,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    width: 2,
                    color: AppColors.primaryColor,
                  ),
                ),
                child: const Icon(
                  Icons.add,
                  size: 30,
                  color: AppColors.primaryColor,
                ),
              ),
              const SizedBox(height: 30),
              const CustomTextHeader1(
                text: "Upload On Blog Page",
                fontWeight: FontWeight.w500,
              )
            ],
          ),
        ),
      ),
    );
  }
}
