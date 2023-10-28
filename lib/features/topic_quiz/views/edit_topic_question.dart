import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solidsolutionweb/components/custom_texts/custom_texts.dart';
import 'package:solidsolutionweb/core/base_view.dart';
import 'package:solidsolutionweb/features/base/view/base_screen.dart';
import 'package:solidsolutionweb/features/topic_quiz/view_model/topic_view_model.dart';
import 'package:solidsolutionweb/widgets/app_progress_indicator.dart';
import 'package:solidsolutionweb/widgets/edit_question_widget.dart';
import 'package:solidsolutionweb/widgets/preview_question_card.dart';

class EditTopicQuestionPreviewScreen extends StatefulWidget {
  const EditTopicQuestionPreviewScreen(
      {super.key, required this.topicQuestionData});
  static const String routeName = "/edit_topic_quiz_preview";

  final TopicPreviewQuestionModel topicQuestionData;
  @override
  State<EditTopicQuestionPreviewScreen> createState() =>
      _EditTopicQuestionPreviewScreenState();
}

class _EditTopicQuestionPreviewScreenState
    extends State<EditTopicQuestionPreviewScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseView<TopicQuizVeiwModel>(builder: (
      context,
      model,
      child,
    ) {
      return Stack(
        children: [
          BaseScreen(
            allowSubjectChange: false,
            onTap: () {},
            child: Stack(
              children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                                "asset/svg/book-square outline.svg"),
                            const SizedBox(width: 15),
                            CustomTextHeader1(
                              text: widget.topicQuestionData.topic.topic ?? "",
                              fontWeight: FontWeight.w500,
                            ),
                            const Spacer(),
                          ],
                        ),
                        const SizedBox(height: 50),
                        EditQuestionWidget(
                          onSubmitQuestion: (value) async {
                            await model.editQuestion(
                              topic: widget.topicQuestionData.topic,
                              jsonData: value.dataSent!,
                              questionId: widget.topicQuestionData.question.id!,
                            );
                          },
                          initialquestion: widget.topicQuestionData.question,
                        ),
                        const SizedBox(height: 50),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          AppProgressIndicator(
            showLoader: model.loadEditQuestion,
          )
        ],
      );
    });
  }
}
