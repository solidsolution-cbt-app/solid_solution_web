import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';


@RoutePage()
class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});
  static const String routeName = "/category";
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Image.asset(
            "asset/images/app_logo.png",
          ),
        ),
        const Divider(),
      ],
    );
  }
}
