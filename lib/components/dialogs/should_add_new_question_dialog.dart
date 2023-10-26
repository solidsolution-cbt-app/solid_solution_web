import 'package:flutter/material.dart';
import 'package:solidsolutionweb/components/custom_buttons/app_button.dart';
import 'package:solidsolutionweb/components/dialogs/dialog_service.dart';
import 'package:solidsolutionweb/constants/styles.dart';

class SHouldAddNewQuestionWidget extends StatelessWidget {
  const SHouldAddNewQuestionWidget({
    required this.successMessage,
    super.key,
  });
  final String successMessage;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        height: 280,
        width: 280,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                successMessage,
                style: AppTextStyles.labelSemiBold.copyWith(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Do you want to add a new question", // successMessage,
                style: AppTextStyles.labelMedium.copyWith(
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppButton(
                  buttonWidth: 100,
                  isOutline: true,
                  onTap: () {
                    Navigator.pop(context);
                    dialogService.hideLoaderDialog();
                  },
                  buttonText: "No",
                ),
                const SizedBox(width: 25),
                AppButton(
                  buttonWidth: 100,
                  onTap: () {
                    Navigator.pop(context);
                  },
                  buttonText: "Yes",
                ),
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
