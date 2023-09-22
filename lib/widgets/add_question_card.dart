import 'package:flutter/material.dart';
import 'package:solidsolutionweb/components/custom_texts/custom_texts.dart';
import 'package:solidsolutionweb/constants/colors.dart';
import 'package:solidsolutionweb/core/locator.dart';
import 'package:solidsolutionweb/enums/question_type_enum.dart';
import 'package:solidsolutionweb/features/subject_quiz/views/add_subject_question.dart';

class AddNewQuestionCard extends StatelessWidget {
  const AddNewQuestionCard({
    this.questiontype = Questiontype.topicquizQuestion,
    super.key,
  });
  final Questiontype questiontype;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          if (questiontype == Questiontype.subjectQuestion) {
            navigator.push(
              routeName: AddSubjectQuizScreen.routeName,
            );
          }
        },
        child: Container(
          width: 400,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: AppColors.violet,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    width: 2,
                    color: AppColors.primaryColor,
                  ),
                ),
                child: const Icon(
                  Icons.add,
                  size: 30,
                  color: AppColors.primaryColor,
                ),
              ),
              const SizedBox(width: 20),
              const CustomTextHeader1(
                text: "Add New Question",
                fontWeight: FontWeight.w500,
              )
            ],
          ),
        ),
      ),
    );
  }
}
