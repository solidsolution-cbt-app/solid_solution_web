import 'package:flutter/material.dart';
import 'package:solidsolutionweb/components/custom_buttons/app_text_button.dart';
import 'package:solidsolutionweb/components/custom_texts/custom_texts.dart';
import 'package:solidsolutionweb/constants/colors.dart';

class DeleteDialog extends StatelessWidget {
  const DeleteDialog({
    required this.deleteMessage,
    required this.onTapDelete,
    super.key,
  });
  final String deleteMessage;
  final Function() onTapDelete;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.only(left: 300),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        height: 200,
        width: 300,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.close,
                    size: 25,
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextHeader1(
                    text: deleteMessage,
                    textColor: AppColors.dartArsh,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AppTextButton(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        buttontext: "No",
                      ),
                      const SizedBox(width: 10),
                      AppTextButton(
                        textcolor: AppColors.dartArsh,
                        onTap: onTapDelete,
                        buttontext: "Yes",
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
