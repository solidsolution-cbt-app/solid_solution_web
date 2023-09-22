import 'package:flutter/material.dart';
import 'package:solidsolutionweb/components/app_text_fields/app_text_field.dart';
import 'package:solidsolutionweb/components/custom_buttons/app_button.dart';
import 'package:solidsolutionweb/components/custom_buttons/app_text_button.dart';
import 'package:solidsolutionweb/components/custom_check_box/app_check_box.dart';

class TestScreen extends StatelessWidget {
  static const String routeName = "/test_screen";
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const AppTextField(
            fieldLabel: "Phone",
            prefixIconPath: "asset/svg/call.svg",
            isPassword: true,
          ),
          AppButton(
            buttonText: "Next",
            onTap: () {},
          ),
          const AppTextField(
            fieldLabel: "Phone",
            prefixIconPath: "asset/svg/lock.svg",
            isPassword: true,
          ),
          AppTextButton(
            onTap: () {},
          ),
          const SizedBox(height: 20),
          // const SpinKitFadingCircle(
          //   color: AppColors.primaryColor,
          //   size: 50.0,
          // ),
          const SizedBox(height: 20),
          AppCheckBox(
            toggleChecked: (value) {},
            isChecked: true,
          ),
          const Row()
        ],
      ),
    );
  }
}
