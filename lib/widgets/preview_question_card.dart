import 'package:flutter/material.dart';
import 'package:solidsolutionweb/components/custom_texts/custom_texts.dart';
import 'package:solidsolutionweb/constants/colors.dart';
import 'package:solidsolutionweb/models/question_model.dart';

class PreviewQuestionWidget extends StatelessWidget {
  const PreviewQuestionWidget({
    required this.question,
    super.key,
  });
  final QuestionModel question;

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        // PreviewQuestionCard(
        //   isOption: false,
        //   showImage: question.isQuestionImage!,
        //   question: question.question!,
        // ),
        // const SizedBox(height: 20),
        // PreviewQuestionCard(
        //   isCorrectOption: true,
        //   showImage: question.isoption1Image!,
        //   question: question.option1!,
        // ),
        // PreviewQuestionCard(
        //   showImage: question.isoption2Image!,
        //   question: question.option2!,
        // ),
        // PreviewQuestionCard(
        //   showImage: question.isoption3Image!,
        //   question: question.option3!,
        // ),
        // PreviewQuestionCard(
        //   showImage: question.isoption4Image!,
        //   question: question.option4!,
        // ),
      ],
    );
  }
}

class PreviewQuestionCard extends StatelessWidget {
  const PreviewQuestionCard({
    this.isOption = true,
    this.isCorrectOption = false,
    required this.showImage,
    required this.question,
    super.key,
  });

  final String question;
  final bool isOption;
  final bool isCorrectOption;
  final bool showImage;

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
          visible: showImage,
          child: const ImageBox(),
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
    this.onTapdelete,
    super.key,
  });
  final Function()? onTapdelete;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      width: 350,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: AppColors.violet,
      ),
    );
  }
}
