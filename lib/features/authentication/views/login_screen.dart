import 'package:flutter/material.dart';
import 'package:solidsolutionweb/components/app_text_fields/app_text_field.dart';
import 'package:solidsolutionweb/components/custom_buttons/app_button.dart';
import 'package:solidsolutionweb/components/custom_texts/custom_texts.dart';
import 'package:solidsolutionweb/core/locator.dart';
import 'package:solidsolutionweb/features/dashboard/view/dash_board.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomTextHeader1(
                text: "Login",
              ),
              const SizedBox(height: 10),
              const CustomTextBody1(
                text: "Welcome back! Please input your details",
              ),
              const SizedBox(height: 30),
              const AppTextField(
                fieldLabel: "Phone number",
                prefixIconPath: "asset/svg/call.svg",
              ),
              const SizedBox(height: 10),
              const AppTextField(
                fieldLabel: "Password",
                prefixIconPath: "asset/svg/lock.svg",
                isPassword: true,
              ),
              const SizedBox(height: 30),
              AppButton(
                buttonWidth: 500,
                onTap: () {
                  navigator.pushReplaceMent(routeName: DashBoard.routeName);
                },
                buttonText: "Login",
              ),
            ],
          ),
          const SizedBox(width: 100),
          Container(
            margin: const EdgeInsets.only(top: 100),
            width: 500,
            height: 500,
            child: Image.asset("asset/images/login.png"),
          )
        ],
      ),
    );
  }
}
