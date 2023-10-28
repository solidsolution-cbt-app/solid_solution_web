import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solidsolutionweb/components/custom_texts/custom_texts.dart';
import 'package:solidsolutionweb/core/base_view.dart';
import 'package:solidsolutionweb/core/locator.dart';
import 'package:solidsolutionweb/enums/question_type_enum.dart';
import 'package:solidsolutionweb/features/base/view/base_screen.dart';
import 'package:solidsolutionweb/features/base/view_model/base_screen_view_model.dart';
import 'package:solidsolutionweb/features/exam_quiz/view_model/exam_quiz_view_model.dart';
import 'package:solidsolutionweb/features/exam_quiz/views/exam_quiz_preview_screen.dart';
import 'package:solidsolutionweb/widgets/add_question_card.dart';
import 'package:solidsolutionweb/widgets/app_progress_indicator.dart';
import 'package:solidsolutionweb/widgets/question_summary_card.dart';

class ExamQuizScreen extends StatefulWidget {
  const ExamQuizScreen({
    super.key,
  });
  static const String routeName = "/exam_quiz_preview";

  @override
  State<ExamQuizScreen> createState() => _ExamQuizScreenState();
}

class _ExamQuizScreenState extends State<ExamQuizScreen> {
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return BaseView<ExamQuizViewModel>(
      onModelReady: (model) {
        model.shouldgetQuestions(
          subject: locatorX<BaseScreenViewModel>().selectedText,
        );
        _scrollController.addListener(() {
          if (_scrollController.position.atEdge) {
            if (_scrollController.position.pixels == 0) {
            } else {
              model.fetchMoreExamQuestions(
                  subject: locatorX<BaseScreenViewModel>().selectedText);
            }
          }
        });
      },
      builder: (context, model, child) {
        return Stack(
          children: [
            BaseScreen(
              onTap: () {
                model.shouldgetQuestions(
                  subject: locatorX<BaseScreenViewModel>().selectedText,
                );
              },
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
                          const CustomTextHeader1(
                            text: "Exam Quiz",
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
                          const AddNewQuestionCard(
                            questiontype: Questiontype.examQuestion,
                          ),
                          ...model.questionToshow
                              .mapIndexed(
                                (index, element) => QuestionSummaryCard(
                                  onTap: () {
                                    navigator.push(
                                      routeName:
                                          ExamQuizPreviewScreen.routeName,
                                      argument: element,
                                    );
                                  },
                                  question: element,
                                  questionNumber: index + 1,
                                ),
                              )
                              .toList()
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            AppProgressIndicator(
              showLoader: model.loadExamQuestion,
            )
          ],
        );
      },
    );
  }
}
