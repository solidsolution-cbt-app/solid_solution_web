import 'package:flutter/material.dart';
import 'package:solidsolutionweb/components/custom_texts/custom_texts.dart';
import 'package:solidsolutionweb/components/methods/dart_methods.dart';
import 'package:solidsolutionweb/constants/colors.dart';
import 'package:solidsolutionweb/models/question_model.dart';

class QuestionSummaryCard extends StatelessWidget {
  const QuestionSummaryCard({
    required this.question,
    required this.questionNumber,
    this.onTap,
    super.key,
  });
  final int questionNumber;
  final QuestionModel question;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onTap,
        child: Container(
            width: 400,
            height: 200,
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 10,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                width: 1,
                color: AppColors.primaryColor,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomTextBody1(
                  text: "Question $questionNumber",
                  textColor: AppColors.primaryColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
                const SizedBox(height: 10),
                CustomTextBody1(
                  text: getFirstNCharacters(
                    question.text,
                    100,
                  ),
                  textAlign: TextAlign.left,
                  fontSize: 14,
                ),
                const Row()
              ],
            )),
      ),
    );
  }
}
