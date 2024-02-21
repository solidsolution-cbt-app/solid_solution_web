import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solidsolutionweb/components/custom_texts/custom_texts.dart';
import 'package:solidsolutionweb/constants/constants.dart';
import 'package:solidsolutionweb/core/base_view.dart';
import 'package:solidsolutionweb/core/locator.dart';
import 'package:solidsolutionweb/enums/question_type_enum.dart';
import 'package:solidsolutionweb/features/base/view/base_screen.dart';
import 'package:solidsolutionweb/features/base/view_model/base_screen_view_model.dart';
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
      model.shouldGetTopicQuestions(
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
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          SvgPicture.asset("asset/svg/book-square outline.svg"),
                          const SizedBox(width: 15),
                          SizedBox(
                            width: AppConstants.screenWidth() * 0.6,
                            child: CustomTextHeader1(
                              text: widget.topic!.topic,
                              fontWeight: FontWeight.w500,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 50),
                    Wrap(
                      spacing: 50,
                      runSpacing: 50,
                      children: [
                        AddNewQuestionCard(
                          topic: widget.topic,
                          questiontype: Questiontype.topicquizQuestion,
                        ),
                        ...model.questionToshow
                            .mapIndexed(
                              (index, element) => QuestionSummaryCard(
                                onTapDelete: () {
                                  model.deleteTopicQuestion(
                                    questionModel: element,
                                    subject: locatorX<BaseScreenViewModel>()
                                        .selectedText,
                                    topic: widget.topic!,
                                  );
                                },
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
