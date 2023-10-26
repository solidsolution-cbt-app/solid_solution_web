import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solidsolutionweb/components/custom_texts/custom_texts.dart';
import 'package:solidsolutionweb/core/base_view.dart';
import 'package:solidsolutionweb/features/base/view/base_screen.dart';
import 'package:solidsolutionweb/features/exam_quiz/view_model/exam_quiz_view_model.dart';
import 'package:solidsolutionweb/widgets/preview_question_card.dart';

class ExamQuizPreviewScreen extends StatefulWidget {
  const ExamQuizPreviewScreen({
    super.key,
  });
  static const String routeName = "/exam_quiz_previewscreen";

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
                  //     AppButton(
                  //       onTap: () {
                  //         model.initializeControllerValue(
                  //           questionModel: model.previewQuestion,
                  //         );
                  //         navigator.push(
                  //           routeName: EditExamQuizScreen.routeName,
                  //         );
                  //       },
                  //       buttonWidth: 80,
                  //       buttonText: "Edit",
                  //     )
                ],
              ),
              const SizedBox(height: 50),
              PreviewQuestionWidget(
                question: model.previewQuestion,
              ),
            ],
          ),
        ),
      );
    });
  }
}
