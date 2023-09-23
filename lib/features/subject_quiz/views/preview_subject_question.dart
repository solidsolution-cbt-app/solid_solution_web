import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solidsolutionweb/components/custom_buttons/app_button.dart';
import 'package:solidsolutionweb/components/custom_texts/custom_texts.dart';
import 'package:solidsolutionweb/core/base_view.dart';
import 'package:solidsolutionweb/core/locator.dart';
import 'package:solidsolutionweb/features/base/view/base_screen.dart';
import 'package:solidsolutionweb/features/subject_quiz/view_model/subject_quiz_view_model.dart';
import 'package:solidsolutionweb/features/subject_quiz/views/edit_subject_question.dart';
import 'package:solidsolutionweb/widgets/preview_question_card.dart';

class SubjectQuizPreviewScreen extends StatefulWidget {
  const SubjectQuizPreviewScreen({
    super.key,
  });
  static const String routeName = "/subject_quiz_previewscreen";

  @override
  State<SubjectQuizPreviewScreen> createState() =>
      _SubjectQuizPreviewScreenState();
}

class _SubjectQuizPreviewScreenState extends State<SubjectQuizPreviewScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseView<SubjectQuizViewModel>(builder: (
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
                    text: "Subject Quiz",
                    fontWeight: FontWeight.w500,
                  ),
                  const Spacer(),
                  AppButton(
                    onTap: () {
                      model.initializeControllerValue(
                        questionModel: model.previewQuestion,
                      );
                      navigator.push(
                        routeName: EditQuizPreviewScreen.routeName,
                      );
                    },
                    buttonWidth: 80,
                    buttonText: "Edit",
                  )
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
