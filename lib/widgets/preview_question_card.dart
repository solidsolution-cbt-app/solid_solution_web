import 'package:flutter/material.dart';
import 'package:solidsolutionweb/components/custom_texts/custom_texts.dart';
import 'package:solidsolutionweb/constants/colors.dart';
import 'package:solidsolutionweb/models/question_model.dart';
import 'package:solidsolutionweb/models/topic_quiz_model.dart';
import 'package:solidsolutionweb/widgets/image_viewer.dart';
import 'package:solidsolutionweb/widgets/selected_pdf_widget.dart';

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
        PreviewQuestionCard(
          isOption: false,
          imagePath: question.image,
          question: question.text!,
        ),
        const SizedBox(height: 20),
        PreviewQuestionCard(
          isCorrectOption: true,
          imagePath: question.option1!.image,
          question: question.option1!.text!,
        ),
        PreviewQuestionCard(
          imagePath: question.option2!.image,
          question: question.option2!.text!,
        ),
        PreviewQuestionCard(
          imagePath: question.option3!.image,
          question: question.option3!.text!,
        ),
        PreviewQuestionCard(
          imagePath: question.option4!.image,
          question: question.option4!.text!,
        ),
        const SizedBox(height: 50),
        SelectPdfWidget(
          showRemove: false,
          prfLink: question.solutionpdf!,
          setSolutionPdf: (value) {},
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

class PreviewQuestionCard extends StatelessWidget {
  const PreviewQuestionCard({
    this.isOption = true,
    this.isCorrectOption = false,
    this.imagePath = "",
    required this.question,
    super.key,
  });

  final String question;
  final bool isOption;
  final bool isCorrectOption;
  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: isOption ? 60 : 0),
          child: CustomTextBody1(
            text: isOption
                ? (isCorrectOption ? "Option (Correct)" : "Option")
                : "Question",
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Visibility(
              visible: isOption,
              child: OptionIndicator(
                isCorrect: isCorrectOption,
              ),
            ),
            Expanded(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: AppColors.dartArsh,
                  ),
                ),
                child: CustomTextBody1(
                  text: question,
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Visibility(
          visible: imagePath != "",
          child: imagePath != ""
              ? ImageBox(
                  imagePath: imagePath!,
                )
              : const SizedBox(),
        ),
        const Row()
      ],
    );
  }
}

class OptionIndicator extends StatelessWidget {
  const OptionIndicator({
    this.isCorrect = false,
    super.key,
  });

  final bool isCorrect;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      child: Column(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: isCorrect ? AppColors.greenColor : AppColors.redColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
              ),
            ),
          ),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: AppColors.dartArsh,
              ),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(5),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ImageBox extends StatelessWidget {
  const ImageBox({
    required this.imagePath,
    super.key,
  });

  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return ImageViewer(
      urlImagePath: imagePath,
    );
  }
}
