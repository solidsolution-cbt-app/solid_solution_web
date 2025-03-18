import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:solidsolutionweb/core/route_service/route.gr.dart';
import 'package:solidsolutionweb/widgets/category_card.dart';

@RoutePage()
class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});
  static const String routeName = "/category";
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 50,
      runSpacing: 50,
      crossAxisAlignment: WrapCrossAlignment.center,
      alignment: WrapAlignment.center,
      runAlignment: WrapAlignment.center,
      children: [
        CategoryCard(
          title: "Upload Solid Solution Jamb Questions",
          imagePath: "asset/svg/computer.svg",
          onTap: () {
            context.router.navigate(
              const UtmeBaseRoute(),
            );
          },
        ),
        CategoryCard(
          title: "Upload Solid Solution Post UTME Questions",
          imagePath: "asset/svg/computer.svg",
          onTap: () {
            context.router.navigate(
              const PostUtmeBaseRoute(),
            );
          },
        ),
        CategoryCard(
          title: "Upload on Blog Page",
          imagePath: "asset/svg/file.svg",
          onTap: () {
            context.router.navigate(
              const BlogBaseRoute(),
            );
          },
        ),
      ],
    );
  }
}
