import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';
import 'package:solidsolutionweb/components/custom_buttons/app_button.dart';
import 'package:solidsolutionweb/constants/app_strings.dart';
import 'package:solidsolutionweb/constants/colors.dart';
import 'package:solidsolutionweb/core/locator.dart';
import 'package:solidsolutionweb/features/pdf_viewer_page.dart/pdf_viewer_page.dart';
import 'package:solidsolutionweb/models/question_model.dart';
import 'package:solidsolutionweb/models/topic_quiz_model.dart';

class PreviewQuestionWidget extends StatelessWidget {
  const PreviewQuestionWidget({
    required this.question,
    super.key,
  });
  final QuestionModel question;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TeXView(
          child: TeXViewColumn(
            children: [
              TeXViewDocument(
                AppString.getExpression("Question"),
              ),
              previewTextContainer(
                text: question.text ?? "",
                image: question.image ?? "",
              ),
              TeXViewDocument(
                AppString.getExpression("Correct Option"),
              ),
              previewTextContainer(
                text: question.option1?.text ?? "",
                image: question.image ?? "",
              ),
              TeXViewDocument(
                AppString.getExpression("Option2"),
              ),
              previewTextContainer(
                text: question.option2?.text ?? "",
                image: question.option2?.image ?? "",
              ),
              TeXViewDocument(
                AppString.getExpression("Option3"),
              ),
              previewTextContainer(
                text: question.option3?.text ?? "",
                image: question.option3?.image ?? "",
              ),
              TeXViewDocument(
                AppString.getExpression("Option4"),
              ),
              previewTextContainer(
                text: question.option1?.text ?? "",
                image: question.option4?.image ?? "",
              ),
              TeXViewDocument(
                AppString.getExpression("Solution"),
              ),
              previewTextContainer(
                text: question.solutionText ?? "",
                image: question.solutionImage ?? "",
              ),
            ],
          ),
        ),
        const SizedBox(height: 50),
        Visibility(
          visible: question.solutionpdf != "",
          child: AppButton(
            buttonWidth: 130,
            onTap: () {
              navigator.push(
                routeName: PdfViewerPage.routeName,
                argument: question.solutionpdf,
              );
            },
            buttonText: "Open pdf",
          ),
        ),
      ],
    );

    
  }

  TeXViewColumn previewTextContainer(
      {required String text, required String image}) {
    return TeXViewColumn(
      children: [
        TeXViewContainer(
          child: TeXViewDocument(
            AppString.getExpression(text),
          ),
          style: const TeXViewStyle(
            padding: TeXViewPadding.all(20),
            margin: TeXViewMargin.only(top: 20, bottom: 15),
            borderRadius: TeXViewBorderRadius.all(20),
            textAlign: TeXViewTextAlign.left,
            border: TeXViewBorder.all(
              TeXViewBorderDecoration(
                borderColor: AppColors.dartArsh,
                borderStyle: TeXViewBorderStyle.solid,
                borderWidth: 2,
              ),
            ),
          ),
        ),
        TeXViewContainer(
          child: TeXViewImage.network(image),
          style: const TeXViewStyle(
            margin: TeXViewMargin.all(10),
            borderRadius: TeXViewBorderRadius.all(20),
          ),
        ),
      ],
    );
  }
}

class TopicPreviewQuestionModel {
  TopicModel topic;
  QuestionModel question;
  TopicPreviewQuestionModel({required this.question, required this.topic});
}


