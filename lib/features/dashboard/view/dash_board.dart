import 'package:flutter/material.dart';
import 'package:solidsolutionweb/components/custom_texts/custom_texts.dart';
import 'package:solidsolutionweb/components/dialogs/dialog_service.dart';
import 'package:solidsolutionweb/constants/colors.dart';
import 'package:solidsolutionweb/core/locator.dart';
import 'package:solidsolutionweb/features/base/view/base_screen.dart';
import 'package:solidsolutionweb/features/base/view_model/base_screen_view_model.dart';
import 'package:solidsolutionweb/features/exam_quiz/views/exam_quiz_screen.dart';
import 'package:solidsolutionweb/features/subject_quiz/views/subject_preview_screen.dart';
import 'package:solidsolutionweb/features/topic_quiz/views/topic_quiz_view.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  static const String routeName = "/dash_board";

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      isDashBoard: true,
      child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 100, vertical: 50),
          child: const Wrap(
            spacing: 50,
            runSpacing: 50,
            children: [
              QuizTypeCard(
                routeName: TopicQuizScreen.routeName,
                title: "Topic Quiz",
              ),
              QuizTypeCard(
                routeName: SubjectPreviewScreen.routeName,
                title: "Subject Quiz",
              ),
              QuizTypeCard(
                routeName: ExamQuizScreen.routeName,
                title: "Exam Quiz",
              )
            ],
          ),
        ),
      ),
    );
  }
}

class QuizTypeCard extends StatelessWidget {
  const QuizTypeCard({
    required this.routeName,
    required this.title,
    super.key,
  });

  final String routeName;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          String subjectSelect = locatorX<BaseScreenViewModel>().selectedText;
          if (subjectSelect == "") {
            DialogService().showErrorDialog(
              errorMessage: "Kindly Select a subject before you proceed",
            );
          } else {
            navigator.push(routeName: routeName);
          }
        },
        child: Container(
          height: 300,
          width: 400,
          decoration: BoxDecoration(
            color: AppColors.violet.withOpacity(0.5),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: AppColors.primaryColor,
                    width: 3,
                  ),
                ),
                child: const Icon(
                  Icons.add,
                  color: AppColors.primaryColor,
                  size: 40,
                ),
              ),
              const SizedBox(width: 10),
              CustomTextHeader1(
                text: title,
                fontWeight: FontWeight.w500,
                fontSize: 36,
              )
            ],
          ),
        ),
      ),
    );
  }
}
