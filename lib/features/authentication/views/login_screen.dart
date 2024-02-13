import 'package:flutter/material.dart';
import 'package:solidsolutionweb/components/app_text_fields/app_text_field.dart';
import 'package:solidsolutionweb/components/custom_buttons/app_button.dart';
import 'package:solidsolutionweb/components/custom_texts/custom_texts.dart';
import 'package:solidsolutionweb/core/base_view.dart';
import 'package:solidsolutionweb/features/authentication/view_model/auth_view_model.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  static const String routeName = "/loginScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BaseView<AuthenticationViewModel>(
        builder: (context, model, child) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5 - 100,
                child: Column(
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
                    AppTextField(
                      isNumberField: true,
                      controller: model.phoneNumberController,
                      fieldLabel: "Phone number",
                      maxLength: 11,
                      prefixIconPath: "asset/svg/call.svg",
                    ),
                    const SizedBox(height: 10),
                    AppTextField(
                      controller: model.passwordController,
                      fieldLabel: "Password",
                      prefixIconPath: "asset/svg/lock.svg",
                      isPassword: true,
                      onComplete: () {
                        model.login();
                      },
                    ),
                    const SizedBox(height: 30),
                    AppButton(
                      buttonWidth: 400,
                      showLoader: model.showLoader,
                      onTap: () {
                        model.login();
                      },
                      buttonText: "Login",
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 100),
                height: 500,
                width: MediaQuery.of(context).size.width * 0.5 - 100,
                child: Image.asset("asset/images/login.png"),
              ),
            ],
          );
        },
      ),
    );
  }
}
