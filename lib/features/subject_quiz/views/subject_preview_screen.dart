import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solidsolutionweb/components/custom_texts/custom_texts.dart';
import 'package:solidsolutionweb/core/base_view.dart';
import 'package:solidsolutionweb/core/locator.dart';
import 'package:solidsolutionweb/enums/question_type_enum.dart';
import 'package:solidsolutionweb/features/base/view/base_screen.dart';
import 'package:solidsolutionweb/features/base/view_model/base_screen_view_model.dart';
import 'package:solidsolutionweb/features/subject_quiz/view_model/subject_quiz_view_model.dart';
import 'package:solidsolutionweb/features/subject_quiz/views/preview_subject_question.dart';
import 'package:solidsolutionweb/widgets/add_question_card.dart';
import 'package:solidsolutionweb/widgets/app_progress_indicator.dart';
import 'package:solidsolutionweb/widgets/question_summary_card.dart';
import 'package:solidsolutionweb/widgets/year_filter_widget.dart';

class SubjectPreviewScreen extends StatefulWidget {
  const SubjectPreviewScreen({
    super.key,
  });
  static const String routeName = "/subject_preview";

  @override
  State<SubjectPreviewScreen> createState() => _SubjectPreviewScreenState();
}

class _SubjectPreviewScreenState extends State<SubjectPreviewScreen> {
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return BaseView<SubjectQuizViewModel>(
      onModelReady: (model) {
        model.shouldgetQuestions(
          subject: locatorX<BaseScreenViewModel>().selectedText,
          selectedYear: model.selectedYear,
        );
        _scrollController.addListener(() {
          if (_scrollController.position.atEdge) {
            if (_scrollController.position.pixels == 0) {
            } else {
              if (model.selectedYear == "all") {
                model.fetchMoreSubjectQuestions(
                    subject: locatorX<BaseScreenViewModel>().selectedText);
              } else {
                model.fetchMoreSubjectQuestionsFilter(
                    year: model.selectedYear,
                    subject: locatorX<BaseScreenViewModel>().selectedText);
              }
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
                  selectedYear: model.selectedYear,
                  subject: locatorX<BaseScreenViewModel>().selectedText,
                );
              },
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
                            SvgPicture.asset(
                                "asset/svg/book-square outline.svg"),
                            const SizedBox(width: 15),
                            const CustomTextHeader1(
                              text: "Subject Quiz",
                              fontWeight: FontWeight.w500,
                            ),
                            const Spacer(),
                            YearFilter(
                              onChangeyear: (year) {
                                model.resetQuestionData();
                                model.onChangeYear(year);
                                model.shouldgetQuestions(
                                  subject: locatorX<BaseScreenViewModel>()
                                      .selectedText,
                                  selectedYear: model.selectedYear,
                                );
                              },
                              selectedYear: model.selectedYear,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 50),
                      Wrap(
                        spacing: 50,
                        runSpacing: 50,
                        children: [
                          const AddNewQuestionCard(
                            questiontype: Questiontype.subjectQuestion,
                          ),
                          ...model.questionToshow
                              .mapIndexed(
                                (index, element) => QuestionSummaryCard(
                                  onTapDelete: () {
                                    model.deleteSubjectQuestion(
                                      questionModel: element,
                                      subject: locatorX<BaseScreenViewModel>()
                                          .selectedText,
                                    );
                                  },
                                  onTap: () {
                                    navigator.push(
                                      routeName:
                                          SubjectQuizPreviewScreen.routeName,
                                      argument: element,
                                    );
                                  },
                                  question: element,
                                  questionNumber: index + 1,
                                ),
                              )
                              .toList()
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            AppProgressIndicator(
              showLoader: model.loadSubjectQuestion,
            )
          ],
        );
      },
    );
  }
}
