import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:solidsolutionweb/components/dialogs/dialog_service.dart';
import 'package:solidsolutionweb/constants/app_strings.dart';
import 'package:solidsolutionweb/core/base_view.dart';
import 'package:solidsolutionweb/features/utme/pages/exam/view_model/exam_view_model.dart';
import 'package:solidsolutionweb/widgets/add_question_card.dart';
import 'package:solidsolutionweb/widgets/question_diaplay_card.dart';
import 'package:solidsolutionweb/widgets/should_delete_question.dart';

@RoutePage()
class ExamQuestionScreen extends StatelessWidget {
  const ExamQuestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<ExamViewModel>(
      onModelReady: (model) async {
        await Future.delayed(const Duration(seconds: 1)).then((value) {});
      },
      builder: (context, model, child) {
        return model.loadGetQuestion
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
              children: [
                Expanded(
                    child: SingleChildScrollView(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
                      child: Wrap(
                        spacing: 50,
                        runSpacing: 50,
                        alignment: WrapAlignment.start,
                        runAlignment: WrapAlignment.center,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          AddQuestionCard(
                            onTap: () {
                              // context.router.navigate(
                              //   const PostUtmeAddQuestionRoute(),
                              // );
                            },
                          ),
                          ...model
                              .getExamQuestion(model.selectedSubject)
                              .mapIndexed(
                                (index, e) => QuestionDiaplaySummaryCard(
                                  questionNumber: index + 1,
                                  question: e,
                                  onSelect: (value) {
                                    if (value == AppString.editQuestion) {
                                      model.setQuestionToView(e);
                                      // context.pushRoute(
                                      //   const PostUtmeEditQuestionRoute(),
                                      // );
                                    }
                                    if (value == AppString.viewQuestion) {
                                      model.setQuestionToView(e);
                                      // context.pushRoute(
                                      //   const PostUtmeQuestionDisplayRoute(),
                                      // );
                                    }
                                    if (value == AppString.delete) {
                                      dialogService.showCustomDialog(
                                        context,
                                        dialogWidget: ShouldDeleteQuestion(
                                          onDelete: () async {
                                            // await model.deleteQuestion(value: e);
                                          },
                                        ),
                                      );
                                    }
                                  },
                                ),
                              ),
                        ],
                      ),
                    ),
                  ),
              ],
            );
      },
    );
  }
}
