import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solidsolutionweb/components/custom_texts/custom_texts.dart';
import 'package:solidsolutionweb/core/base_view.dart';
import 'package:solidsolutionweb/core/locator.dart';
import 'package:solidsolutionweb/enums/question_type_enum.dart';
import 'package:solidsolutionweb/features/base/view/base_screen.dart';
import 'package:solidsolutionweb/features/topic_quiz/view_model/topic_view_model.dart';
import 'package:solidsolutionweb/features/topic_quiz/views/topic_question_preview_screen.dart';
import 'package:solidsolutionweb/models/topic_quiz_model.dart';
import 'package:solidsolutionweb/widgets/add_question_card.dart';
import 'package:solidsolutionweb/widgets/app_progress_indicator.dart';
import 'package:solidsolutionweb/widgets/preview_question_card.dart';
import 'package:solidsolutionweb/widgets/question_summary_card.dart';

class TopicQuizPreviewScreen extends StatefulWidget {
  const TopicQuizPreviewScreen({
    super.key,
    this.topic,
  });
  final TopicModel? topic;
  static const String routeName = "/topic_quiz_preview";

  @override
  State<TopicQuizPreviewScreen> createState() => _TopicQuizPreviewScreenState();
}

class _TopicQuizPreviewScreenState extends State<TopicQuizPreviewScreen> {
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return BaseView<TopicQuizVeiwModel>(onModelReady: (model) {
      model.getQuestion(
        topic: widget.topic!,
        pageNumber: "1",
      );
      _scrollController.addListener(() {
        if (_scrollController.position.atEdge) {
          if (_scrollController.position.pixels == 0) {
          } else {
            model.fetchMoreQuestions(topic: widget.topic!);
          }
        }
      });
    }, builder: (context, model, child) {
      return Stack(
        children: [
          BaseScreen(
            allowSubjectChange: false,
            onTap: () {},
            child: SingleChildScrollView(
              controller: _scrollController,
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
                          text: widget.topic!.topic,
                          fontWeight: FontWeight.w500,
                        ),
                        const Spacer(),
                      ],
                    ),
                    const SizedBox(height: 50),
                    Wrap(
                      spacing: 50,
                      runSpacing: 20,
                      children: [
                        AddNewQuestionCard(
                          topic: widget.topic,
                          questiontype: Questiontype.topicquizQuestion,
                        ),
                        ...model.questionToshow
                            .mapIndexed(
                              (index, element) => QuestionSummaryCard(
                                onTap: () {
                                  navigator.push(
                                    routeName:
                                        TopicQuestionPreviewScreen.routeName,
                                    argument: TopicPreviewQuestionModel(
                                      topic: widget.topic!,
                                      question: element,
                                    ),
                                  );
                                },
                                question: element,
                                questionNumber: index + 1,
                              ),
                            )
                            .toList(),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          AppProgressIndicator(
            showLoader: model.loadTopicQuestionScreen,
          )
        ],
      );
    });
  }
}
