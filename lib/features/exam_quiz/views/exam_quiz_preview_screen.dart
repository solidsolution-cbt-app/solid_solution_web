import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solidsolutionweb/components/custom_buttons/app_button.dart';
import 'package:solidsolutionweb/components/custom_texts/custom_texts.dart';
import 'package:solidsolutionweb/core/base_view.dart';
import 'package:solidsolutionweb/core/locator.dart';
import 'package:solidsolutionweb/features/base/view/base_screen.dart';
import 'package:solidsolutionweb/features/exam_quiz/view_model/exam_quiz_view_model.dart';
import 'package:solidsolutionweb/features/exam_quiz/views/edit_exam_quiz_screen.dart';
import 'package:solidsolutionweb/models/question_model.dart';
import 'package:solidsolutionweb/widgets/app_progress_indicator.dart';
import 'package:solidsolutionweb/widgets/preview_question_card.dart';

class ExamQuizPreviewScreen extends StatefulWidget {
  const ExamQuizPreviewScreen({
    required this.questionData,
    super.key,
  });
  final QuestionModel questionData;
  static const String routeName = "/exam_quiz_previewscreen";

  @override
  State<ExamQuizPreviewScreen> createState() => _ExamQuizPreviewScreenState();
}

class _ExamQuizPreviewScreenState extends State<ExamQuizPreviewScreen> {
  bool loadScreen = true;
  toggleLoadScreen(bool value) {
    loadScreen = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<ExamQuizViewModel>(
      onModelReady: (model) async {
        await model.getExamQuestionData(
          questionId: widget.questionData.id!,
        );
        toggleLoadScreen(false);
      },
      builder: (context, model, child) {
        return Stack(
          children: [
            BaseScreen(
              allowSubjectChange: false,
              child: SingleChildScrollView(
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
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
                          AppButton(
                            onTap: () {
                              navigator.pushReplaceMent(
                                routeName: EditExamQuizScreen.routeName,
                                argument: model.previewQuestionData,
                              );
                            },
                            buttonWidth: 80,
                            buttonText: "Edit",
                          )
                        ],
                      ),
                      const SizedBox(height: 50),
                      if (model.previewQuestionData != null)
                        PreviewQuestionWidget(
                          question: model.previewQuestionData!,
                        ),
                    ],
                  ),
                ),
              ),
            ),
            AppProgressIndicator(
              showLoader: loadScreen,
            )
          ],
        );
      },
    );
  }
}
