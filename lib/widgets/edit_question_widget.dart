import 'package:flutter/material.dart';
import 'package:solidsolutionweb/components/app_text_fields/app_text_field.dart';
import 'package:solidsolutionweb/components/custom_texts/custom_texts.dart';
import 'package:solidsolutionweb/constants/colors.dart';

class EditQuestionWidget extends StatelessWidget {
  const EditQuestionWidget({
    required this.option1Controller,
    required this.option2Controller,
    required this.option3Controller,
    required this.option4Controller,
    required this.questionController,
    super.key,
  });
  final TextEditingController questionController;
  final TextEditingController option1Controller;

  final TextEditingController option2Controller;
  final TextEditingController option3Controller;
  final TextEditingController option4Controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        QuestionCard(
          isOption: false,
          controller: questionController,
        ),
        const SizedBox(height: 20),
        QuestionCard(
          controller: option1Controller,
          isCorrectOption: true,
        ),
        QuestionCard(
          controller: option2Controller,
        ),
        QuestionCard(
          controller: option3Controller,
        ),
        QuestionCard(
          controller: option4Controller,
        ),
      ],
    );
  }
}

class QuestionCard extends StatefulWidget {
  const QuestionCard({
    required this.controller,
    this.title = "Enter Question",
    this.isOption = true,
    this.isCorrectOption = false,
    super.key,
  });

  final TextEditingController controller;
  final String title;
  final bool isOption;
  final bool isCorrectOption;

  @override
  State<QuestionCard> createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  bool showQuestionImage = false;
  toggleshowQuestionImage(bool value) {
    showQuestionImage = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: widget.isOption ? 60 : 0),
          child: CustomTextBody1(
            text: widget.isOption
                ? (widget.isCorrectOption ? "Option (Correct)" : "Option")
                : widget.title,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Visibility(
              visible: widget.isOption,
              child: OptionIndicator(
                isCorrect: widget.isCorrectOption,
              ),
            ),
            Expanded(
              child: AppTextField2(
                controller: widget.controller,
                maxLines: 4,
                hintText: "Type...",
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Container(
          margin: EdgeInsets.only(left: widget.isOption ? 60 : 0),
          child: Material(
            child: InkWell(
              onTap: () {
                toggleshowQuestionImage(true);
              },
              child: const SizedBox(
                width: 230,
                child: Row(
                  children: [
                    Icon(
                      Icons.image_outlined,
                      color: AppColors.primaryColor,
                    ),
                    SizedBox(width: 10),
                    CustomTextBody1(
                      text: "click to upload diagram",
                      textColor: AppColors.primaryColor,
                      fontSize: 16,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Visibility(
          visible: showQuestionImage,
          child: ImageBox(
            onTapdelete: () {
              toggleshowQuestionImage(false);
            },
          ),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            onPressed: onTapdelete,
            icon: const Icon(
              Icons.delete_outline_rounded,
              size: 35,
              color: AppColors.redColor,
            ),
          )
        ],
      ),
    );
  }
}
