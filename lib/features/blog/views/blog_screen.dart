import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:solidsolutionweb/components/custom_texts/custom_texts.dart';
import 'package:solidsolutionweb/constants/colors.dart';

@RoutePage()
class BlogScreen extends StatelessWidget {
  const BlogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 50),
          Row(
            children: [
              const SizedBox(width: 50),
              Image.asset(
                width: 47,
                height: 53,
                "asset/images/app_logo.png",
              ),
              const SizedBox(width: 20),
              const CustomTextHeader1(
                text: "Solid Solutions",
                fontSize: 25,
                textColor: AppColors.dartArsh,
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Divider(
            color: AppColors.grey400Color,
          ),
        ],
      ),
    );
  }
}
