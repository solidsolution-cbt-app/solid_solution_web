import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:solidsolutionweb/components/custom_texts/custom_texts.dart';
import 'package:solidsolutionweb/constants/colors.dart';
import 'package:solidsolutionweb/core/route_service/route.gr.dart';
import 'package:solidsolutionweb/widgets/category_card.dart';

@RoutePage()
class UtmeBaseRoute extends StatelessWidget {
  const UtmeBaseRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
      child: Column(
        children: [
          const CustomTextHeader1(
            text: "Select the quiz type you want to upload:   ",
            textColor: AppColors.greyColor,
          ),
          const SizedBox(height: 10),
          const CustomTextBody1(
            text: "Choose an action to get started",
            textColor: AppColors.grey400Color,
          ),
          const SizedBox(height: 50),
          Wrap(
            spacing: 50,
            runSpacing: 50,
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.center,
            children: [
              CategoryCard(
                title: " Topic Quiz",
                imagePath: "asset/svg/cap.svg",
                onTap: () {},
              ),
              CategoryCard(
                title: " Subject Quiz",
                imagePath: "asset/svg/cap.svg",
                onTap: () {},
              ),
              CategoryCard(
                title: " Exam Quiz",
                imagePath: "asset/svg/cap.svg",
                onTap: () {
                  context.pushRoute(
                    const ExamDashBoard(),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
