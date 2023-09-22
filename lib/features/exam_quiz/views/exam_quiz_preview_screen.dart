import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solidsolutionweb/components/custom_texts/custom_texts.dart';
import 'package:solidsolutionweb/core/base_view.dart';
import 'package:solidsolutionweb/features/base/view/base_screen.dart';
import 'package:solidsolutionweb/features/exam_quiz/view_model/exam_quiz_view_model.dart';
import 'package:solidsolutionweb/widgets/add_question_card.dart';

class ExamQuizPreviewScreen extends StatefulWidget {
  const ExamQuizPreviewScreen({
    super.key,
  });
  static const String routeName = "/exam_quiz_preview";

  @override
  State<ExamQuizPreviewScreen> createState() => _ExamQuizPreviewScreenState();
}

class _ExamQuizPreviewScreenState extends State<ExamQuizPreviewScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseView<ExamQuizViewModel>(builder: (
      context,
      model,
      child,
    ) {
      return BaseScreen(
        onTap: () {
          setState(() {});
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
          child: Column(
            children: [
              Row(
                children: [
                  SvgPicture.asset("asset/svg/book-square outline.svg"),
                  const SizedBox(width: 15),
                  const CustomTextHeader1(
                    text: "Exam Quiz",
                    fontWeight: FontWeight.w500,
                  ),
                  const Spacer(),
                ],
              ),
              const SizedBox(height: 50),
              const Wrap(
                spacing: 50,
                runSpacing: 20,
                children: [
                  AddNewQuestionCard(),
                  // ...List.generate(
                  //   20,
                  //   (index) => QuestionCard(
                  //     questionNumber: index + 1,
                  //     question:
                  //         "How many element are in the periodic table, list the first 50 elements of the periodic table, kindly tell more of where can i go ifHow many element are in the periodic table, list the first 50 elements of the periodic table, kindly tell more of where can i go if i am very hungry and doesn't have anything to eat atall i am so lazy and cant cook",
                  //   ),
                  // ),
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
