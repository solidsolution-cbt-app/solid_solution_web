import 'package:flutter/material.dart';
import 'package:solidsolutionweb/components/custom_buttons/app_button.dart';
import 'package:solidsolutionweb/components/custom_buttons/app_text_button.dart';
import 'package:solidsolutionweb/constants/constants.dart';
import 'package:solidsolutionweb/constants/styles.dart';

class LogOutDialog extends StatelessWidget {
  const LogOutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        width: AppConstants.screenWidth(),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        height: 240,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Comeback Soon?",
              style: AppTextStyles.bodyLargeMedium,
            ),
            const SizedBox(height: 10),
            Text(
              "Your are attempting to logout of solid solution app. Are you sure you want to logout?",
              style: AppTextStyles.labelRegular,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            AppButton(
              onTap: () {},
              buttonText: "Yes, Logout",
            ),
            const SizedBox(height: 10),
            AppTextButton(
              onTap: () {
                Navigator.pop(context);
              },
              buttontext: "Cancel",
              textWeight: FontWeight.w400,
            )
          ],
        ),
      ),
    );
  }
}
