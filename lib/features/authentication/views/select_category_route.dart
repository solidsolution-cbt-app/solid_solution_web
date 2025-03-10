import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:solidsolutionweb/components/custom_texts/custom_texts.dart';
import 'package:solidsolutionweb/constants/colors.dart';
import 'package:solidsolutionweb/core/route_service/route.gr.dart';

@RoutePage()
class SelectCategoryScreen extends StatelessWidget {
  const SelectCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        CategoryRoute(),
        BlogRoute(),
        UtmeBaseRoute(),
        PostUtmeBaseRoute(),
      ],
      builder: (context, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              const SizedBox(height: 20),
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
                    textColor: AppColors.greyColor,
                  ),
                ],
              ),
              const SizedBox(height: 10),
               Divider(
                color: AppColors.grey400Color.withOpacity(.1),
                thickness: 5,
              ),
              Expanded(child: child),
            ],
          ),
        );
      },
    );
  }
}
