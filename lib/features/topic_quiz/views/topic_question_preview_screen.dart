import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solidsolutionweb/components/custom_buttons/app_button.dart';
import 'package:solidsolutionweb/components/custom_texts/custom_texts.dart';
import 'package:solidsolutionweb/core/base_view.dart';
import 'package:solidsolutionweb/core/locator.dart';
import 'package:solidsolutionweb/features/base/view/base_screen.dart';
import 'package:solidsolutionweb/features/topic_quiz/view_model/topic_view_model.dart';
import 'package:solidsolutionweb/features/topic_quiz/views/edit_topic_question.dart';
import 'package:solidsolutionweb/widgets/app_progress_indicator.dart';
import 'package:solidsolutionweb/widgets/preview_question_card.dart';

class TopicQuestionPreviewScreen extends StatefulWidget {
  const TopicQuestionPreviewScreen({
    required this.topicQuestionData,
    super.key,
  });
  final TopicPreviewQuestionModel topicQuestionData;
  static const String routeName = "/topic_question_previewscreen";

  @override
  State<TopicQuestionPreviewScreen> createState() =>
      _TopicQuestionPreviewScreenState();
}

class _TopicQuestionPreviewScreenState
    extends State<TopicQuestionPreviewScreen> {
  bool loadScreen = true;
  toggleLoadScreen(bool value) {
    loadScreen = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<TopicQuizVeiwModel>(
      onModelReady: (model) async {
        await model.getQuestionData(
          questionId: widget.topicQuestionData.question.id!,
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
                          CustomTextHeader1(
                            text: widget.topicQuestionData.topic.topic ?? "",
                            fontWeight: FontWeight.w500,
                          ),
                          const Spacer(),
                          AppButton(
                            onTap: () {
                              if (model.previewQuestionData != null) {
                                navigator.pushReplaceMent(
                                  routeName:
                                      EditTopicQuestionPreviewScreen.routeName,
                                  argument: TopicPreviewQuestionModel(
                                    question: model.previewQuestionData!,
                                    topic: widget.topicQuestionData.topic,
                                  ),
                                );
                              }
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
