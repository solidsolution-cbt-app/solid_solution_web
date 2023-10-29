import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solidsolutionweb/components/custom_buttons/app_button.dart';
import 'package:solidsolutionweb/components/custom_texts/custom_texts.dart';
import 'package:solidsolutionweb/core/base_view.dart';
import 'package:solidsolutionweb/core/locator.dart';
import 'package:solidsolutionweb/features/base/view/base_screen.dart';
import 'package:solidsolutionweb/features/subject_quiz/view_model/subject_quiz_view_model.dart';
import 'package:solidsolutionweb/features/subject_quiz/views/edit_subject_question.dart';
import 'package:solidsolutionweb/models/question_model.dart';
import 'package:solidsolutionweb/widgets/app_progress_indicator.dart';
import 'package:solidsolutionweb/widgets/preview_question_card.dart';

class SubjectQuizPreviewScreen extends StatefulWidget {
  const SubjectQuizPreviewScreen({
    required this.questionData,
    super.key,
  });
  final QuestionModel questionData;
  static const String routeName = "/subject_quiz_previewscreen";

  @override
  State<SubjectQuizPreviewScreen> createState() =>
      _SubjectQuizPreviewScreenState();
}

class _SubjectQuizPreviewScreenState extends State<SubjectQuizPreviewScreen> {
  bool loadScreen = true;
  toggleLoadScreen(bool value) {
    loadScreen = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<SubjectQuizViewModel>(
      onModelReady: (model) async {
        await model.getSubjectQuestionData(
          questionId: widget.questionData.id!,
        );
        toggleLoadScreen(false);
      },
      builder: (context, model, child) {
        return Stack(
          children: [
            BaseScreen(
              allowSubjectChange: false,
              onTap: () {},
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset("asset/svg/book-square outline.svg"),
                          const SizedBox(width: 15),
                          const CustomTextHeader1(
                            text: "Subject Quiz",
                            fontWeight: FontWeight.w500,
                          ),
                          const Spacer(),
                          AppButton(
                            onTap: () {
                              navigator.pushReplaceMent(
                                routeName: EditQuizPreviewScreen.routeName,
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
