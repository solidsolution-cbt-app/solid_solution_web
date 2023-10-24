import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solidsolutionweb/components/custom_texts/custom_texts.dart';
import 'package:solidsolutionweb/core/base_view.dart';
import 'package:solidsolutionweb/features/base/view/base_screen.dart';
import 'package:solidsolutionweb/features/topic_quiz/view_model/topic_view_model.dart';
import 'package:solidsolutionweb/widgets/add_question_card.dart';
import 'package:solidsolutionweb/widgets/question_widget.dart';

class TopicQuizPreviewScreen extends StatefulWidget {
  const TopicQuizPreviewScreen({
    super.key,
    required this.topic,
  });
  final String topic;
  static const String routeName = "/topic_quiz_preview";

  @override
  State<TopicQuizPreviewScreen> createState() => _TopicQuizPreviewScreenState();
}

class _TopicQuizPreviewScreenState extends State<TopicQuizPreviewScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseView<TopicQuizVeiwModel>(builder: (
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
                  CustomTextHeader1(
                    text: widget.topic,
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
                  //   (index) => QuestionCard(controller: controller)
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
